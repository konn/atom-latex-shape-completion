{ Disposable, CompositeDisposable } = require 'atom'
CompletionView = require './latex-shape-completion-view'
RegexIterator = require './latex-shape-completion-iterator'
_ = require 'underscore-plus'
settings = require './latex-shape-completion-config'
config = settings.config

module.exports = LaTeXShapeCompletion =
  config: config
  subscriptions: null
  completionView: null

  insertSnippet: (snippet, editor, cursor = editor.getLastCursor()) ->
    atom.notifications.addInfo("No snippet service available")


  consumeSnippets: ({insertSnippet}) ->
    @insertSnippet = (snippet, editor = @activeEditor(), cursor = editor.getLastCursor()) ->
      insertSnippet(snippet, editor, cursor)

  buildSectionSnippet: ({name, args, postfix}, def = @getSelected()) ->
    counter = 1;
    unless name?
      name = "${1:cmd}"
      counter += 1;
    snip = "\\\\#{name}"
    args ?= ["fixed"]
    for arg in args
        if @isString(arg)
            type = arg
        else
            type = arg.type
            plhd = arg.default
        plhd ?= "arg"

        switch type
          when 'fixed'
            if def?
                snip += "{${#{counter}:#{def}}}"
                def = null
            else
                snip += "{${#{counter}:#{plhd}}}"
            counter += 1
          when 'optional'
            snip += "${#{counter}:[${#{counter+1}:#{plhd}}]}"
            counter += 2
    snip += postfix if postfix?
    snip += "$0"
    return snip

  activeEditor: -> atom.workspace.getActiveTextEditor()

  getSelected: ->
    sel = atom.workspace.getActiveTextEditor().getSelectedText()
    return sel if sel

  buildEnvSnippet: ({name, args}, def = @getSelected()) ->
    counter = 1;
    def ?= ""
    unless name?
      begname = "${1:env}"
      endname = "$1"
      counter += 1
    else
      begname = endname = name
    snip = "\\\\begin{#{begname}}"
    args ?= []
    for type in args
        switch type
          when 'fixed'
            snip += "{${#{counter}:arg}}"
            counter += 1
          when 'optional'
            snip += "${#{counter}:[${#{counter+1}:arg}]}"
            counter += 2
    snip += "\n  #{def}$0\n"
    snip += "\\\\end{#{endname}}"
    return snip

  isString: (inp) ->
    type = Object.prototype.toString.call(inp).slice(8, -1).toLowerCase()
    return (typeof(inp) is 'string' || inp instanceof String || type is 'string')
    

  insert: (inp, editor = atom.workspace.getActiveTextEditor(), postfix = "") ->
    if @isString(inp)
        editor.insertText(inp)
        return false
    else
      inp.type ?= 'maketitle'
      switch inp?.type
        when 'text'
            text = "#{inp.name}#{postfix}"
            editor.insertText(text)
            return false
        when 'maketitle'
            if inp.name?
                editor.insertText "\\#{inp.name}#{postfix}"
            else
                @insertSnippet "\\\\${1:maketitle} $0", editor
            return false
        when 'section'
            @insertSnippet(@buildSectionSnippet(inp), editor)
            return true
        when 'large'
            if (ph = editor.getSelectedText())
                editor.insertText "{\\#{inp.name} #{ph}}"
            else
                @insertSnippet("{\\\\#{inp.name} $0}", editor)
            return true
        when 'begin', 'environment'
            @insertSnippet @buildEnvSnippet(inp), editor
            return true

  activate: (state) ->
    editor = atom.workspace.getActiveTextEditor()

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace',
      'latex-shape-completion:complete-shape':     (e) => @complete_shape(e),
      'latex-shape-completion:complete-greek':     (e) => @complete_greek(e),
      'latex-shape-completion:complete-font':     (e) => @complete_font(e),
      'latex-shape-completion:insert-begin':       (e) => @insert_begin(e),
      'latex-shape-completion:complete-section':   (e) => @complete_section(e),
      'latex-shape-completion:complete-maketitle': (e) => @complete_maketitle(e),
      'latex-shape-completion:change': => @change(),
      'latex-shape-completion:kill-tex': => @kill_tex(),
      'latex-shape-completion:backspace': (e) => @backspace e
      'latex-shape-completion:check-display-math': (e) => @check_display_math(e)
      'latex-shape-completion:newline': (e) => @newline(e)

  check_display_math: (evt) ->
    editor = atom.workspace.getActiveTextEditor()
    view = atom.views.getView editor
    pos = editor.getCursorBufferPosition()
    ran = [pos.translate([0, -1]), pos]
    prec = editor.getTextInBufferRange(ran)
    if prec is '\\'
        evt.stopImmediatePropagation()
        evt.preventDefault()
        editor.setTextInBufferRange ran, '', undo: 'skip'
        @insertSnippet "\\\\[\n $0\n\\\\]", editor
    else
        evt.abortKeyBinding()

  build_items: (dic) ->
    items = []
    for key, val of dic
        val_ = _.deepClone(val)
        val_.index = key
        items.push val_
    return items

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->
    return {}

  is_math: =>
    editor = atom.workspace.getActiveTextEditor()
    cursor = editor.getLastCursor()
    pos = cursor.getBufferPosition()
    delim2 = editor.getTextInBufferRange [
      pos, pos.translate [0, 2]
    ]
    delim1 = editor.getTextInBufferRange [
      pos, pos.translate [0, 1]
    ]
    desc = cursor.getScopeDescriptor()
    scopes = desc.getScopesArray()
    math = scopes.some (c) -> /^string.other.math/.test(c)
    [..., last] = scopes
    if math
      switch last
        when "punctuation.definition.string.end.latex"
          math = delim2 is "$$" || delim2 is "\\]"
        when "punctuation.definition.string.end.tex"
          math = delim1 is "$"
    return math

  show_completion_view: (items, fallback, callback) ->
    if @completionView?.hasParent()
        @completionView.detach()
        @completionView = null
    @completionView ?= new CompletionView items, fallback, callback
    @completionView.show()
    @completionView.focusFilterEditor()


  make_stroke_completer: (trigger, dic, e) ->
    editor = atom.workspace.getActiveTextEditor()
    view = atom.views.getView editor
    if @is_math()
        items = _.deepClone(dic)
        fallback = ({text, lastItem, lastChar}) =>
            if (lastChar is trigger) && (text is trigger || text.legth is 0)
                editor.insertText(trigger)
            else
                editor.transact () =>
                    @insert(lastItem, editor, "")
                    evt = atom.keymaps.constructor.buildKeydownEvent(lastChar, {target: view})
                    if view.dispatchEvent(evt)
                        editor.insertText(lastChar) 
            return true
        callback = (inp, postfix = "") => @insert(inp, editor, postfix)
        @show_completion_view items, fallback, callback
    else
        e.abortKeyBinding()

  make_snippet_completer: (type, dic, e) ->
    editor = atom.workspace.getActiveTextEditor()
    items = _.deepClone(dic)
    for key, val of items
        val.type = type
    fallback = ({text, lastItem, lastChar}) =>
      console.log("falling back with: #{JSON.stringify({text, lastItem: lastItem, lastChar: lastChar})}")
      if text?.length > 0 && (lastChar is "\r" || lastChar is " ")
        @insert({type: type, name: text}, editor, "")
        return true
      else
        return false
    callback = (inp, postfix = "") =>
      @insert(inp, editor, postfix)

    @show_completion_view items, fallback, callback

  get_dictionary: (name) ->
    dic = atom.config.get("latex-shape-completion.#{name}_dictionary") || []
    def = (settings["default_#{name}_dictionary"] || []).filter (i) ->
        !(dic.some (j) -> j.index == i.index)
    return dic.concat(def)

  complete_shape: (e) -> @make_stroke_completer ";", @get_dictionary("shape") , e

  complete_greek: (e) -> @make_stroke_completer ":", @get_dictionary("greek") , e

  complete_font: (e) -> @make_stroke_completer "@", @get_dictionary("font"), e

  complete_section: (e) -> @make_snippet_completer 'section', @get_dictionary("section"), e

  insert_begin: (e) -> @make_snippet_completer 'environment', @get_dictionary("environment"), e

  complete_maketitle: (e) -> @make_snippet_completer 'maketitle', @get_dictionary("maketitle"), e

  getScopes: (editor = @activeEditor()) ->
    editor.getLastCursor().getScopeDescriptor().getScopesArray()

  getCurrentEnvironmentAt: (pos = @activeEditor().getCursorBufferPosition()) ->
    re = /\\(begin|end)\{([^{}]+?)\}/
    iter = new RegexIterator @activeEditor().getBuffer(), pos, re
    targ = null
    levels = []
    targetRange = null
    until iter.finished || !(result = iter.scan()) || targ
        [txt, begORend, env] = result.match
        inside = result.range.start.translate([0, begORend.length])
        scopes = @activeEditor().scopeDescriptorForBufferPosition(inside).getScopesArray()
        scope  = scopes[scopes.length - 1]
        
        if scope is "support.function.be.latex"
          switch begORend
            when 'begin'
              if levels.length == 0
                  targ = env
                  targetRange = result.range
                  break
              else
                  levels.pop()
            when 'end'
              levels.push env
    return {name: targ, envStart: targetRange.end}

  countAmpersands: (buf, rowStart, rowEnd) ->
    range = [[rowStart, 0], [rowEnd, buf.lineLengthForRow(rowEnd)]]
    count = 0
    console.log("searching in: #{JSON.stringify range}")
    for line in buf.getTextInRange(range).split("\\\\")
        count = Math.max(count, (line.match(/\&/g) || []).length)
    return count

  # Smart newline.
  newline: (e) ->
    editor = @activeEditor()
    {name, envStart} = @getCurrentEnvironmentAt()
    maths = @get_dictionary("display_math")
    lists = @get_dictionary("list_env")
    console.log("newline: #{JSON.stringify res: {name, envStart} || [], maths: maths, lists: lists}")
    console.log("search math: #{JSON.stringify maths.find((i) -> i.name == name)}")
    console.log("search list: #{JSON.stringify lists.find((i) -> i.name == name)}")
    if (env = maths.find((i) -> i.name == name))?.multiline
        console.log "math detected!"
        @insert("\\\\")
        @activeEditor().insertNewline()
        if env.alignable
            rowStart = envStart.row
            rowEnd   = editor.getCursorBufferPosition().row
            amps = @countAmpersands editor.getBuffer(), rowStart, rowEnd
            places = ("${#{i}: }" for i in [1..amps+1])
            cols = places.join(" & ")
            @insertSnippet cols
    else if (env = lists.find((i) -> i.name == name))?
        console.log "list detected!"
        @activeEditor().insertNewline()
        brack = ""
        brack = "[${1:term}]" if env.hasOptionalItemArg
        @insertSnippet("\\\\item#{brack} $0")
    else
        e.abortKeyBinding()

  change: -> return

  kill_tex: -> return
