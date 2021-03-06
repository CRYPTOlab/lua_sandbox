-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/.

require "circular_buffer"

function process(tc)
    if tc == 0 then
        local cb = circular_buffer.new(2) -- new() incorrect # args
    elseif tc == 1 then
        local cb = circular_buffer.new(nil, 1, 1) -- new() non numeric row
    elseif tc == 2 then
        local cb = circular_buffer.new(1, 1, 1) -- new() 1 row
    elseif tc == 3 then
        local cb = circular_buffer.new(2, nil, 1) -- new() non numeric column
    elseif tc == 4 then
        local cb = circular_buffer.new(2, 0, 1) -- new() zero column
    elseif tc == 5  then
        local cb = circular_buffer.new(2, 1, nil) -- new() non numeric seconds_per_row
    elseif tc == 6 then
        local cb = circular_buffer.new(2, 1, 0) -- new() zero seconds_per_row
    elseif tc == 7 then
        local cb = circular_buffer.new(2, 1, 3601) -- new() > hour seconds_per_row 
    elseif tc == 8  then
        local cb = circular_buffer.new(1000, 10, 1) -- new() too much memory
    elseif tc == 9 then
        local cb = circular_buffer.new(2, 1, 1) -- set() out of range column 
        cb:set(0, 2, 1.0)
    elseif tc == 10  then
        local cb = circular_buffer.new(2, 1, 1) -- set() zero column
        cb:set(0, 0, 1.0)
    elseif tc == 11 then
        local cb = circular_buffer.new(2, 1, 1) -- set() non numeric column 
        cb:set(0, nil, 1.0)
    elseif tc == 12 then
        local cb = circular_buffer.new(2, 1, 1) -- set() non numeric time
        cb:set(nil, 1, 1.0)
    elseif tc == 13 then
        local cb = circular_buffer.new(2, 1, 1) -- get() invalid object
        local invalid = 1
        cb.get(invalid, 1, 1)
    elseif tc == 14 then
        local cb = circular_buffer.new(2, 1, 1) -- set() non numeric value
        cb:set(0, 1, nil)
    elseif tc == 15 then
        local cb = circular_buffer.new(2, 1, 1) -- set() incorrect # args
        cb:set(0)
    elseif tc == 16 then
        local cb = circular_buffer.new(2, 1, 1) -- add() incorrect # args
        cb:add(0)
    elseif tc == 17 then
        local cb = circular_buffer.new(2, 1, 1) -- get() incorrect # args
        cb:get(0)
    elseif tc == 18 then
        local cb = circular_buffer.new(2, 1, 1) -- compute() incorrect # args
        cb:compute(0)
    elseif tc == 19 then
        local cb = circular_buffer.new(2, 1, 1) -- compute() incorrect function
        cb:compute("func", 1)
    elseif tc == 20 then
        local cb = circular_buffer.new(2, 1, 1) -- compute() incorrect column
        cb:compute("sum", 0)
    elseif tc == 21 then
        local cb = circular_buffer.new(2, 1, 1) -- compute() start > end
        cb:compute("sum", 1, 2e9, 1e9)
    elseif tc == 22 then
        local cb = circular_buffer.new(2, 1, 1) -- format() invalid
        cb:format("invalid")
    elseif tc == 23  then
        local cb = circular_buffer.new(2, 1, 1) -- format() extra
        cb:format("cbuf", true)
    elseif tc == 24 then
        local cb = circular_buffer.new(2, 1, 1) -- format() missing
        cb:format()
    end
return 0
end
