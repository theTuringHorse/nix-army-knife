-- speed-hold.lua
-- Hold MBTN_LEFT or (b) to play at 2x speed; release to restore.
-- Mirrors the YouTube "hold to speed up" behavior.

local prev_speed = nil

local function on_hold(e)
    if e.event == "down" then
        prev_speed = mp.get_property_number("speed")
        mp.set_property_number("speed", 2.0)
        mp.osd_message("2x speed", 9999)
    elseif e.event == "up" or e.event == "cancel" then
        if prev_speed ~= nil then
            mp.set_property_number("speed", prev_speed)
            mp.osd_message("")
            prev_speed = nil
        end
    end
end

-- Forced bindings override input.conf (needed for MBTN_LEFT which is set to ignore)
mp.add_forced_key_binding("MBTN_LEFT", "speed-hold-mouse", on_hold, { complex = true })
mp.add_forced_key_binding("b",         "speed-hold-key",   on_hold, { complex = true })
