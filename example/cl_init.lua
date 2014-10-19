
--[[
	You can insert anything you need clientside here. Clientside hooks are added
	with plugin:Hook(). See init.lua for an example of how to add a plugin hook.
]]

-- Include the shared.lua and cl_panel.lua files client-side.
plugin:IncludeFile("shared.lua", SERVERGUARD.STATE.CLIENT);
plugin:IncludeFile("cl_panel.lua", SERVERGUARD.STATE.CLIENT);