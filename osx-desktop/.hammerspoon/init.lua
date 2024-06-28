-- Initialize Hammerspoon
hs.window.animationDuration = 0

function resetHotkeys()
	hs.hotkey.disableAll()
end

-- Call the reset function to clear all hotkeys
resetHotkeys()

-- Set your mod key (Mod4 in i3, usually mapped to the Command key on macOS)
local mod = { "cmd" }
local shift_mode = { "cmd", "Shift" }

-- Focus windows
hs.hotkey.bind(mod, "h", function()
	hs.window.focusedWindow():focusWindowWest()
end)
hs.hotkey.bind(mod, "j", function()
	hs.window.focusedWindow():focusWindowSouth()
end)
hs.hotkey.bind(mod, "k", function()
	hs.window.focusedWindow():focusWindowNorth()
end)
hs.hotkey.bind(mod, "l", function()
	hs.window.focusedWindow():focusWindowEast()
end)

-- Move windows
hs.hotkey.bind(mod, "H", function()
	local win = hs.window.focusedWindow()
	win:moveOneScreenWest()
end)
hs.hotkey.bind(mod, "J", function()
	local win = hs.window.focusedWindow()
	win:moveOneScreenSouth()
end)
hs.hotkey.bind(mod, "K", function()
	local win = hs.window.focusedWindow()
	win:moveOneScreenNorth()
end)
hs.hotkey.bind(mod, "L", function()
	local win = hs.window.focusedWindow()
	win:moveOneScreenEast()
end)

-- Resize windows
hs.hotkey.bind(mod, "left", function()
	hs.window.focusedWindow():resize({ -20, 0 })
end)
hs.hotkey.bind(mod, "right", function()
	hs.window.focusedWindow():resize({ 20, 0 })
end)
hs.hotkey.bind(mod, "up", function()
	hs.window.focusedWindow():resize({ 0, -20 })
end)
hs.hotkey.bind(mod, "down", function()
	hs.window.focusedWindow():resize({ 0, 20 })
end)

-- Fullscreen
hs.hotkey.bind(mod, "f", function()
	hs.window.focusedWindow():toggleFullScreen()
end)

-- Move to specific screen
hs.hotkey.bind(mod, "1", function()
	hs.window.focusedWindow():moveToScreen(hs.screen.allScreens()[1])
end)
hs.hotkey.bind(mod, "2", function()
	hs.window.focusedWindow():moveToScreen(hs.screen.allScreens()[2])
end)

-- Launch applications
hs.hotkey.bind(mod, "Return", function()
	hs.application.launchOrFocus("Terminal")
end)
hs.hotkey.bind(shift_mode, "f", function()
	hs.application.launchOrFocus("Finder")
end)
hs.hotkey.bind(shift_mode, "s", function()
	hs.application.launchOrFocus("Slack")
end)
hs.hotkey.bind(shift_mode, "g", function()
	hs.application.launchOrFocus("Brave Browser")
end)
hs.hotkey.bind(mod, "c", function()
	hs.application.launchOrFocus("Calendar")
end)

-- Reload Hammerspoon configuration
hs.hotkey.bind(mod, "r", function()
	hs.reload()
end)

hs.hotkey.bind(shift_mode, "r", function()
	resetHotkeys()
end)

-- -- Copy (Ctrl + C)
-- hs.hotkey.bind({ "ctrl" }, "c", function()
-- 	hs.eventtap.keyStroke({ "cmd" }, "c")
-- end)
--
-- -- Paste (Ctrl + V)
-- hs.hotkey.bind({ "ctrl" }, "v", function()
-- 	hs.eventtap.keyStroke({ "cmd" }, "v")
-- end)
hs.alert.show("Config loaded")
