local options = require 'mp.options'

local o = {
    ducksecs = 2, -- lol
    duckratio = 0.5
}
options.read_options(o)

local duck_progress = 0
local duck_timer = nil
local orig_vol = nil

function update_quack()
    duck_progress = duck_progress + 1
    if duck_progress >= o.ducksecs * 10 then
        duck_timer:kill()
    end
    mp.set_property_number("volume", math.min(orig_vol, orig_vol * o.duckratio + orig_vol * (1 - o.duckratio) * (duck_progress / (o.ducksecs * 10))))
    -- print(mp.get_property_number("volume"))
end

function engage_ducking(name, val)
    pos = mp.get_property_number("time-pos")
    if val == nil or val == false then
        return
    end
    if pos == 0 then
        return
    end
    duck_progress = 0
    if duck_timer == nil then
        duck_timer = mp.add_periodic_timer(0.1, update_quack)
        orig_vol = mp.get_property_number("volume")
        update_quack() -- fire for immediate effect
    else
        if duck_timer:is_enabled() == false then
            orig_vol = mp.get_property_number("volume")
            duck_timer:resume()
            update_quack()
        end
    end
end

mp.observe_property("seeking", "bool", engage_ducking)
