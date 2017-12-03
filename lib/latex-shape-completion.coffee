{ Disposable, CompositeDisposable } = require 'atom'

module.exports = LaTeXShapeCompletion =
  subscriptions: null
  completer:     null
  completing:    false
  
  insertSnippet: (snippet, editor, cursor = editor.getLastCursor()) ->
    atom.notifications.addInfo("No snippet service available")


  consumeSnippets: ({insertSnippet}) ->
    @insertSnippet = (snippet, editor, cursor = editor.getLastCursor()) ->
      insertSnippet(snippet, editor, cursor)

  greek_dictionary:
    'a':    '\\alpha'
    'b':    '\\beta'
    'g':    '\\gamma'
    'd':    '\\delta'
    'e':    '\\varepsilon'
    'e-':   '\\epsilon'
    'et':   '\\eta'
    'z':    '\\zeta'
    't':    '\\tau'
    'th':   '\\theta'
    'th-':  '\\vartheta'
    'i':    '\\iota'
    'k':    '\\kappa'
    'l':    '\\lambda'
    'm':    '\\mu'
    'n':    '\\nu'
    'x':    '\\xi'
    'o':    '\\omega'
    'p':    '\\pi'
    'ph':   '\\varphi'
    'ph-':  '\\phi'
    'p-':   '\\varpi'
    'ps':   '\\psi'
    'r':    '\\rho'
    's':    '\\sigma'
    's-':   '\\varsigma'
    'u':    '\\upsilon'
    'c':    '\\chi'

  shape_dictionary:
    '|\\|': '\\aleph'
    '||-' : '\\Vdash'
    '/\\':  '\\land'
    '\\/':  '\\lor'
    'prod': '\\prod'

  font_dictionary:
    'b': {type: 'section', name: 'mathbb'}
    'c': {type: 'section', name: 'mathcal'}
    's': {type: 'section', name: 'mathscr'}
    'B': {type: 'section', name: 'mathbf'}
    'f': {type: 'section', name: 'mathfrak'}

  insert: (inp, editor) ->
    type = Object.prototype.toString.call(inp).slice(8, -1).toLowerCase()
    if (typeof(inp) == 'string' || inp instanceof String || type == 'string')
        editor.insertText(inp)
        return false
    else
      switch inp?.type
        when 'maketitle'
            editor.insertText("\\" + inp.name)
            return false
        when 'section'
            @insertSnippet("\\\\" + inp.name + "{${1:text}}$0", editor)
            return true
        when 'large'
            @insertSnippet("{\\\\" + inp.name + " $0}", editor)
            return true
        when 'begin'
            @insertSnippet """
                           \\\\begin{${1:theorem}}
                             $0
                           \\\\end{$1}
                           """,
                           editor
            return true
        else
            throw "Unknown Error"
                
        
        

  activate: (state) ->
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
          
    editor = atom.workspace.getActiveTextEditor()
    editor?.onDidChangeCursorPosition => @dispose_completer()
    editor?.onDidChangeSelectionRange => @dispose_completer()

  completion_name: "latex-shape-completion.completion"

  backspace: (e) ->
    editor = atom.workspace.getActiveTextEditor()
    view = atom.views.getView editor
    if @completer
        e.charCode = 127
        @completer e
    else
      e.abortKeyBinding()

  build_trie: (dic) ->
    trie = {}
    for key, val of dic
      targ = trie
      while key.length > 0
        targ = targ[key[0]] ?= {value: null, children: null}
        if key.length == 1
          targ.value = val
        else
          targ.value ?= val
          targ = targ.children ?= {}
        key = key.slice(1)
    return trie               

  dispose_completer: ->
    if @completer
      editor = atom.workspace.getActiveTextEditor()
      view = atom.views.getView editor
      view.removeEventListener 'keypress', @completer
      @completer = null

  catch_next_key_with: (dic, ign = null, mark = null, prev = []) ->
    editor = atom.workspace.getActiveTextEditor()
    view = atom.views.getView editor
    disposeDisposer = editor?.onDidChangeCursorPosition (e) =>
        atom.beep()
        @dispose_completer()
    @completer = (evt) =>
      char = String.fromCharCode(evt.charCode)
      l = dic?[char]
      evt.stopImmediatePropagation()
      evt.preventDefault()
      @dispose_completer()
      disposeDisposer.dispose()
      console.log('Input: ' + JSON.stringify([char, dic, mark, prev, evt.charCode]));

      if ign && String(char) == String(ign)
        @insert(ign, editor)
      else if evt.charCode == 127
        if (prev?.length > 0)
            if mark
                editor.setTextInBufferRange mark, '', undo: 'skip'
            mark_ = null
            [_, dic_] = prev.shift()
            psymb = prev[0]?[0]
            if psymb
                start = editor.getCursorBufferPosition()
                @insert(psymb, editor)
                end   = editor.getCursorBufferPosition()
                mark_ = [start,end]
            @catch_next_key_with dic_, null, mark_, prev
        else
            atom.beep()
      else if (!l) || l == undefined || l == null
        atom.beep()
        @insert(char, editor)
      else
        mark_ = null
        isSnippet = false
        if symb = l.value
          if mark
            editor.setTextInBufferRange mark, '', undo: 'skip'
          start = editor.getCursorBufferPosition()
          isSnippet = @insert(symb, editor)
          end   = editor.getCursorBufferPosition()
          mark_ = [start,end]
          atom.workspace.add
        unless isSnippet
          prev.unshift [symb, dic]
          @catch_next_key_with l.children, null, mark_, prev

    view.addEventListener 'keypress', @completer

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
          math = delim2 == "$$" || delim2 == "\\]"
        when "punctuation.definition.string.end.tex"
          math = delim1 == "$"
    return math

  make_completer: (trigger, dic, e) ->
    editor = atom.workspace.getActiveTextEditor()
    if @is_math() && ! @completer
      @catch_next_key_with(@build_trie(dic), trigger)
    else
      @dispose_completer()
      e.abortKeyBinding()

  complete_shape: (e) -> @make_completer ";", @shape_dictionary, e

  complete_greek: (e) -> @make_completer ":", @greek_dictionary, e

  complete_font: (e) -> @make_completer "@", @font_dictionary, e

  complete_section: -> return

  complete_maketitle: -> return

  insert_begin: -> return

  change: -> return

  kill_tex: -> return
