--▓▓▓▓  ▓▓▓ ▓   ▓ ▓▓▓▓   ▓▓▓▓   
--▓░░░▓  ▓░░▓▓  ▓░▓░░░▓ ▓ ░░░░  
--▓▓▓▓░░ ▓░░▓░▓ ▓░▓░░░▓░ ▓▓▓░░░ 
--▓░░░▓ ░▓░░▓░░▓▓░▓░░ ▓░░ ░░▓   
--▓▓▓▓░░▓▓▓░▓░░ ▓░▓▓▓▓ ░▓▓▓▓░░  
-- ░░░░ ░░░░ ░░  ░░░░░░ ░░░░░ ░ 
--  ░░░░  ░░░ ░   ░ ░░░░  ░░░░  


-- Set programs that you use
local terminal          = "kitty"
local fileManager       = "thunar"
local menu              = "rofi -show drun"
local browser           = "app.zen_browser.zen"
local notifications     = "swaync-client -t"
local lockScreen        = "hyprlock"
local wallpaperSwitcher = "~/scripts/rofi_wallpaper_switcher.sh"
local logout		    = "wlogout"
local floatingTerminal  = "kitty -T float"



local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd(floatingTerminal))

hl.bind(mainMod .. " + K", hl.dsp.submap("Kitty_Options"))

--Used to open cava or nmtui ect 
hl.define_submap("Kitty_Options", "reset",function ()

    hl.bind("N", hl.dsp.exec_cmd("kitty -T nmtui nmtui"))
    hl.bind("B", hl.dsp.exec_cmd("kitty -T bluetui bluetui"))
    hl.bind("C", hl.dsp.exec_cmd("kitty -T cava cava") )

end)

hl.bind(mainMod .. " + Q", hl.dsp.window.close())

hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))			 --file manager
hl.bind(mainMod .. " + SPACE", hl.dsp.window.float({ action = "toggle" })) 
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))				  -- rofi menu
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))			 -- dwindle only
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(notifications))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(lockScreen))
hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd(logout))

--Scripts
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("~/scripts/reload.sh"))     	 --waybar and swaync Reload
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(wallpaperSwitcher))			 --wallpaperSwitcher scripts

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + TAB", hl.dsp.window.swap({next = "true"}))
hl.bind("ALT + TAB", hl.dsp.window.cycle_next())

--ScreenShots
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -m window")) -- for window
hl.bind(mainMod .. " + CTRL + Print", hl.dsp.exec_cmd("hyprshot -m region")) --for region

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + U",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + U", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

--Resize of Windows using mouse
hl.bind(mainMod .. " + A", hl.dsp.window.drag())
hl.bind(mainMod .." + S", hl.dsp.window.resize())

--Resizing Of window using Keyboard
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 15, y = 0, relative = true}),  {repeating = true})
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -15, y = 0, relative = true}), { repeating = true })
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 15, relative = true}), { repeating = true })
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -15, relative = true}), { repeating = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 99+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 99-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

