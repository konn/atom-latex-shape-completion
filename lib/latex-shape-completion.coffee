{ Disposable, CompositeDisposable } = require 'atom'
CompletionView = require './latex-shape-completion-view'
_ = require 'underscore-plus'

module.exports = LaTeXShapeCompletion =
  subscriptions: null
  completer:     null
  completing:    false
  completionView: null
  disposeDisposer: -> return

  insertSnippet: (snippet, editor, cursor = editor.getLastCursor()) ->
    atom.notifications.addInfo("No snippet service available")


  consumeSnippets: ({insertSnippet}) ->
    @insertSnippet = (snippet, editor, cursor = editor.getLastCursor()) ->
      insertSnippet(snippet, editor, cursor)

  greek_dictionary:
    'a':    {name: 'alpha', preview: 'α'}
    'b':    {name: 'beta', preview: 'β'}
    'g':    {name: 'gamma', preview: 'γ'}
    'd':    {name: 'delta', preview: 'δ'}
    'e':    {name: 'varepsilon', preview: 'ε'}
    'e-':   {name: 'epsilon', preview: 'ϵ'}
    'et':   {name: 'eta', preview: 'η'}
    'z':    {name: 'zeta', preview: 'ζ'}
    't':    {name: 'tau', preview: 'τ'}
    'th':   {name: 'theta', preview: 'θ'}
    'th-':  {name: 'vartheta', preview: 'ϑ'}
    'i':    {name: 'iota', preview: 'ι'}
    'k':    {name: 'kappa', preview: 'κ'}
    'l':    {name: 'lambda', preview: 'λ'}
    'm':    {name: 'mu', preview: 'μ'}
    'n':    {name: 'nu', preview: 'ν'}
    'x':    {name: 'xi', preview: 'ξ'}
    'o':    {name: 'omega', preview: 'ω'}
    'p':    {name: 'pi', preview: 'π'}
    'ph':   {name: 'varphi', preview: 'φ'}
    'ph-':  {name: 'phi', preview: 'ϕ'}
    'p-':   {name: 'varpi', preview: 'ϖ'}
    'ps':   {name: 'psi', preview: 'ψ'}
    'r':    {name: 'rho', preview: 'ρ'}
    's':    {name: 'sigma', preview: 'σ'}
    's-':   {name: 'varsigma', preview: 'ς'}
    'u':    {name: 'upsilon', preview: 'υ'}
    'c':    {name: 'chi', preview: 'χ'}

  shape_dictionary:
    '|\\|': {name: 'aleph', preview: 'ℵ'}
    ']':    {name: 'beth', preview: 'ℶ'}
    '||-' : {name: 'Vdash', preview: '⊩'}
    '/\\':  {name: 'land', preview: '∧'}
    '\\/':  {name: 'lor', preview: '∨'}
    'prod': {name: 'prod', preview: '∏'}
    'sum':  {name: 'sum', preview: '∑'}
    '{':    {name: 'in', preview: '∈'}
    '}':    {name: 'ni', preview: '∋'}
    '{/':   {name: 'notin', preview: '∉'}
    '(':    {name: 'subset', preview: '⊂'}
    '(-':   {name: 'subseteq', preview: '⊆'}
    '(=':   {name: 'subseteqq', preview: '⫅'}
    ')':    {name: 'supset', preview: '⊃'}
    ')-':   {name: 'supseteq', preview: '⊇'}
    ')=':   {name: 'supseteqq', preview: '⫆'}
    '=/':   {name: 'neq', preview: '≠'}
    '==':   {name: 'equiv', preview: '≡'}
    '==/':  {name: 'nequiv', preview: '≢'}
    '<':    {name: 'leq', preview: '≤'}
    '</':   {name: 'nleq', preview: '≰'}
    '>':    {name: 'geq', preview: '≥'}
    '>/':   {name: 'ngeq', preview: '≱'}
    '<<':   {name: 'll', preview: '≪'}
    '>>':   {name: 'ngeq', preview: '≫'}
    '<\'':  {name: 'langle', preview: '⟨'}
    '>\'':  {name: 'rangle', preview: '⟩'}
    '->':   {name: 'rightarrow', preview: '→'}
    '=>':   {name: 'Rightarrow', preview: '⇒'}
    '==>':   {name: 'implies', preview: '⟹'}
    '-->':  {name: 'longrightarrow', preview: '⟶'}
    'x->':  {name: 'xrightarrow',preview: '⟶^_',type: 'section',args: ['optional', 'fixed']}
    '|->':  {name: 'mapsto', preview: '↦'}
    '|=>':  {name: 'Mapsto', preview: '↦'}
    '>->':  {name: 'rightarrowtail', preview: '↣'}
    '->>':  {name: 'twoheadrightarrow', preview: '↠'}
    '(->':  {name: 'hookrightarrow', preview: '↪'}
    '~>':   {name: 'leadsto', preview: '⇝'}
    '<-':  {name: 'leftarrow', preview: '←'}
    '<<-':  {name: 'twoheadleftarrow', preview: '↞'}
    '<-<':  {name: 'leftarrowtail', preview: '↢'}
    '<-)':  {name: 'hookleftarrow', preview: '↩'}
    '<-|':  {name: 'mapsfrom', preview: '↤'}
    '<=|':  {name: 'Mapsfrom', preview: '⤆'}
    '<--':  {name: 'longleftarrow', preview: '⟵'}
    '<=':   {name: 'Leftarrow', preview: '⟵'}
    '<==':   {name: 'impliedby', preview: '⟸'}

  font_dictionary:
    'i': {type: 'section', name: 'mathit'}
    'r': {type: 'section', name: 'mathrm'}
    'd': {type: 'section', name: 'mathds'}
    'b': {type: 'section', name: 'mathbb'}
    'c': {type: 'section', name: 'mathcal'}
    's': {type: 'section', name: 'mathsf'}
    'S': {type: 'section', name: 'mathscr'}
    'B': {type: 'section', name: 'mathbf'}
    'f': {type: 'section', name: 'mathfrak'}

  buildSectionSnippet: ({name, args}, def = null) ->
    counter = 1;
    snip = "\\\\#{name}"
    args ?= ["fixed"]
    for type in args
        switch type
          when 'fixed'
            if def?
                snip += "{${#{counter}:#{def}}}"
                def = null
            else
                snip += "{${#{counter}:arg}}"
            counter += 1
          when 'optional'
            snip += "${#{counter}:[${#{counter+1}:arg}]}"
            counter += 2
    snip += "$0"
    return snip

  buildEnvSnippet: ({name, args}, def = null) ->
    counter = 1;
    def ?= ""
    snip = "\\\\begin{#{name}}"
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
    snip += "\\\\end{#{name}}"
    return snip

  insert: (inp, editor, spaced = false) ->
    type = Object.prototype.toString.call(inp).slice(8, -1).toLowerCase()
    ph = sel if sel = editor.getSelectedText()

    if spaced
        pad = ' '
    else
        pad = ''

    if (typeof(inp) == 'string' || inp instanceof String || type == 'string')
        editor.insertText(inp)
        return false
    else
      inp.type ?= 'maketitle'
      switch inp?.type
        when 'text'
            text = "#{inp.name}#{pad}"
            editor.insertText(text)
            return false
        when 'maketitle'
            text = "\\#{inp.name}#{pad}"
            editor.insertText(text)
            return false
        when 'section'
            snip = @buildSectionSnippet(inp, ph)
            @insertSnippet(snip, editor)
            return true
        when 'large'
            if (ph = editor.getSelectedText())
                editor.insertText "{\\#{inp.name} #{ph}}"
            else
                @insertSnippet("{\\\\#{inp.name} $0}", editor)
            return true
        when 'begin'
            @insertSnippet @buildEnvSnippet(inp, ph), editor
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
      'latex-shape-completion:display-math': => @display_math()
          
          
    editor?.onDidChangeCursorPosition => @dispose_completer()
    editor?.onDidChangeSelectionRange => @dispose_completer()

  display_math: ->
    editor = atom.workspace.getActiveTextEditor()
    @insertSnippet "\\\\[\n  $0\n\\\\]", editor

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
          targ.value = _.deepClone(val)
        else
          targ.value ?= _.deepClone(val)
          targ = targ.children ?= {}
        key = key.slice(1)
    return trie               

  build_items: (dic) ->
    items = []
    for key, val of dic
        val_ = _.deepClone(val)
        val_.stroke = key
        items.push val_
    return items

  dispose_completer: ->
    if @completer
      editor = atom.workspace.getActiveTextEditor()
      view = atom.views.getView editor
      view.removeEventListener 'keypress', @completer
      @completer = null

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
        @completionView ?= new CompletionView (inp, spaced = false) =>
            @insert(inp, editor, spaced)
        @completionView.show()
        items = @build_items(dic)
        items.unshift {stroke: trigger, type: "text", name: trigger}
        @completionView.setItems items
        @completionView.focusFilterEditor()
        # @catch_next_key_with(@build_trie(dic), trigger)
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
