return function(programs)
    local terminal, fileManager, menu, browser = programs.terminal, programs.fileManager, programs.menu, programs.browser

    ---------------------
    ---- KEYBINDINGS ----
    ---------------------

    local mainMod = "SUPER" -- Sets "Windows" key as main modifier

    -- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
    hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(terminal))
    hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser))
    local closeWindowBind = hl.bind(mainMod .. " + SHIFT + X", hl.dsp.window.close())
    -- closeWindowBind:set_enabled(false)
    hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
    hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
    hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
    hl.bind(mainMod .. " + SemiColon", hl.dsp.exec_cmd(menu))
    hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
    hl.bind(mainMod .. " + Z", hl.dsp.layout("togglesplit"))    -- dwindle only
    hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
    hl.bind(mainMod .. " + tab", hl.dsp.group.next())

    -- Move focus with mainMod + arrow keys
    hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
    hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
    hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
    hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

    -- Cycle focus through windows with mainMod + J/K
    hl.bind(mainMod .. " + J", hl.dsp.window.cycle_next())
    hl.bind(mainMod .. " + K", hl.dsp.window.cycle_next({ next = false }))

    -- Switch workspaces with mainMod + [0-9]
    -- Move active window to a workspace with mainMod + SHIFT + [0-9]
    for i = 1, 10 do
        local key = i % 10 -- 10 maps to key 0
        hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
        hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
    end

    -- Switch to / move active window to next or previous workspace
    hl.bind(mainMod .. " + L",         hl.dsp.focus({ workspace = "+1" }))
    hl.bind(mainMod .. " + H",         hl.dsp.focus({ workspace = "-1" }))
    hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ workspace = "+1" }))
    hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ workspace = "-1" }))

    -- Named special workspaces (scratchpads)
    -- mainMod + key toggles the scratchpad, mainMod + SHIFT + key moves the active window into it.
    -- `spawn` (optional) is launched when the scratchpad is opened while empty.
    local scratchpads = {
        { name = "magic", key = "S" },
        { name = "web",    key = "B", spawn = browser },
        { name = "claude", key = "C", spawn = terminal .. " start --cwd " .. os.getenv("HOME") .. "/workspace/claude -- claude" },
    }
    for _, pad in ipairs(scratchpads) do
        local workspace = "special:" .. pad.name
        hl.bind(mainMod .. " + " .. pad.key,             hl.dsp.workspace.toggle_special(pad.name))
        hl.bind(mainMod .. " + SHIFT + " .. pad.key,     hl.dsp.window.move({ workspace = workspace }))
        if pad.spawn then
            hl.workspace_rule({ workspace = workspace, on_created_empty = pad.spawn })
        end
    end

    -- Scroll through existing workspaces with mainMod + scroll
    hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
    hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

    -- Move/resize windows with mainMod + LMB/RMB and dragging
    hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
    hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

    -- Screenshots (grim + slurp + satty): every capture is saved to shotDir and copied to the clipboard
    local shotDir = os.getenv("HOME") .. "/share/Screenshots"
    local shotFile = shotDir .. "/Screenshot-$(date +%Y-%m-%d_%H-%M-%S).png"
    local function shot(grimArgs)
        return 'mkdir -p "' .. shotDir .. '" && f="' .. shotFile .. '" && grim ' .. grimArgs .. ' "$f" && wl-copy < "$f"'
    end
    hl.bind("Print",               hl.dsp.exec_cmd(shot("")))                -- full screen
    hl.bind("SHIFT + Print",       hl.dsp.exec_cmd(shot('-g "$(slurp)"')))   -- region
    hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd('mkdir -p "' .. shotDir .. '" && grim -g "$(slurp)" - | satty --filename - --output-filename "' .. shotFile .. '" --copy-command wl-copy --actions-on-enter save-to-clipboard,save-to-file,exit'))  -- region -> annotate

    -- Laptop multimedia keys for volume and LCD brightness
    hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
    hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
    hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
    hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
    hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
    hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

    -- Requires playerctl
    hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
    hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
end
