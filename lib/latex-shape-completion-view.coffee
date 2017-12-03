{ $, $$, SelectListView } = require 'atom-space-pen-views'
_ = require 'underscore-plus'

module.exports =
class CompletionView extends SelectListView
    panel: null
    callback: null
    spaced: false
    lastItem: null
    fallback: null
    withEnter: false

    initialize: (items, fallback, callback) ->
        super()
        its = _.deepClone(items)
        for i in its
            i.stroke ?= i.name
              
        @setItems its
        @fallback = fallback
        @callback = callback
        @addClass('atex-completion-view overlay popover')
        @filterEditorView.on 'keydown', (e) =>
            if e.keyCode is 13
                @withEnter = true
            else
                e.abortKeyBinding?()
    
        @filterEditorView.on 'keypress', (e) =>
            item = @getSelectedItem()
            if e.charCode is 32
                e.stopImmediatePropagation()
                e.preventDefault()
                if item? && @filterEditorView.getText()
                    @spaced = true
                    @confirmed(item)
                else
                  @cancel()
            else
                e.abortKeyBinding?()

    getFilterKey: -> 'stroke'

    show: ->
        @panel ?= atom.workspace.addModalPanel(item: this)
        @panel.show()

        @storeFocusedElement()
        @focusFilterEditor()

    hide: -> @panel?.hide()

    clearText: ->
        @withEnter = false
        @filterEditorView.setText('')

    viewForItem: (item) ->
        item.preview ?= item.name
        """<li>
            #{item.stroke} 
            <small style="text-color: gray">
                #{item.preview}
            </small>
        </li>"""

    confirmed: (item) ->
        @clearText()
        @callback?(item, @spaced)
        @spaced = false
        @hide()
        @restoreFocus()

    cancel: ->
        text = @filterEditorView.getText()
        if @withEnter && text && @fallback?
            @fallback text
        super()

    cancelled: ->
        @clearText()
        @hide()

    seralize: ->
    destroy: -> @detach()
