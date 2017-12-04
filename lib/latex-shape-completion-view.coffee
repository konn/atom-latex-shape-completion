{ $, $$, SelectListView } = require 'atom-space-pen-views'
_ = require 'underscore-plus'

module.exports =
class CompletionView extends SelectListView
    panel: null
    callback: null
    spaced: false
    lastItem: null
    lastChar: null
    fallback: null

    initialize: (items, fallback, callback) ->
        super()
        its = _.deepClone(items)
        for i in its
            i.index ?= i.name
              
        @setItems its
        @fallback = fallback
        @callback = callback
        @addClass('atex-completion-view overlay popover')

        @filterEditorView.on 'keydown', (e) =>
            if (e.keyCode == 10 || e.keyCode == 13)
                console.log("Keydown enter: #{e.keyCode}")
                @lastItem = @getSelectedItem()
                @lastChar = String.fromCharCode(e.keyCode)
                if @lastItem?
                    @confirmed(@lastItem)
                else
                    @cancel() if @tryFallback()
            else if (e.keyCode == 32)
                @lastItem = @getSelectedItem()
                @lastChar = String.fromCharCode(e.keyCode)
                if @lastItem?
                    @confirmed(@lastItem)
                else
                    @cancel() if @tryFallback()

        @filterEditorView.on 'keypress', (e) =>
            @lastItem = @getSelectedItem()
            @lastChar = String.fromCharCode(e.charCode || e.keyCode)
            
        @filterEditorView.on 'keyup', (e) =>
            unless @getSelectedItem()?
                @cancel() if @tryFallback()
                

    getFilterKey: -> 'index'

    show: ->
        @panel ?= atom.workspace.addModalPanel(item: this)
        @panel.show()

        @storeFocusedElement()
        @focusFilterEditor()

    hide: ->
        @fallback = @callback = @lastItem = @lastChar = null
        @setItems([])
        @panel?.hide()

    clearText: ->
        @withEnter = false
        @filterEditorView.setText('')

    viewForItem: (item) ->
        item.preview ?= item.name
        """<li>
            #{item.index} 
            <small style="text-color: gray">
                #{item.preview}
            </small>
        </li>"""

    confirmed: (item) ->
        @clearText()
        @callback?(item)
        @spaced = false
        @hide()
        @restoreFocus()

    tryFallback: () ->
        text = @filterEditorView.getText()
        console.log("Trying fallback with: #{JSON.stringify({text, item: @lastItem, char: @lastChar})}")
        if @fallback?
            return @fallback({text: text, lastItem: @lastItem, lastChar: @lastChar})
        else
            return false

    cancelled: ->
        @clearText()
        @hide()

    seralize: ->
    destroy: -> @detach()
