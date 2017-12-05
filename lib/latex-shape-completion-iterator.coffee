# Iterates regex-matching over buffer, in a backward manner by default.
class RegexIterator
    regex: null
    pos: null
    finished: false
    buf: null
    scanner: null
    backward: true

    constructor: (buf, start, regex, backward = true) ->
        @buf   = buf
        @pos   = start
        @regex = regex
        @backward = backward

        if backward
            @scanner = @buf.backwardsScanInRange
        else
            @scanner = @buf.scanInRange

    terminalReached: ->
        if @backwards
            @pos.row == 0 && @pos.column == 0
        else
            end = @buf.getEndPosition()
            @pos.row == end.row && @pos.column == end.column

    scan: ->
        obj = null
        if @backward
            range = [[0,0], @pos]
        else
            range = [@pos, @buf.getEndPosition()]
        looper = (iter) =>
            @finished = false
            obj = {
                match:     iter.match
                matchText: iter.matchText
                range:     iter.range
                replace:   iter.replace
            }
            if @backward
                @pos = obj.range.start
            else
                @pos = obj.range.end
            iter.stop()
        if @backward
            @buf.backwardsScanInRange @regex, range, looper
        else
            @buf.scanInRange @regex, range, looper
        if !obj || @terminalReached()
            @finished = true
        return obj

module.exports = RegexIterator
