{ $, $$, SelectListView } = require 'atom-space-pen-views'
module.exports =
class CompletionView extends SelectListView
    panel: null
    callback: null
    spaced: false
    lastItem: null

    initialize: (callback) ->
        super()
        @callback = callback
        @addClass('atex-completion-view overlay popover')
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
                e.abortKeyBinding()

    getFilterKey: -> 'stroke'

    show: ->
        @panel ?= atom.workspace.addModalPanel(item: this)
        @panel.show()

        @storeFocusedElement()
        @focusFilterEditor()

    hide: -> @panel?.hide()

    clearText: ->
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

    cancelled: ->
        @clearText()
        @hide()

    seralize: ->
    destroy: -> @detach()
