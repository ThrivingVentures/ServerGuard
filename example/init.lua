
--[[
	Anything you need serverside should be put here. See below on how to add plugin
	hooks.
]]

local plugin = plugin;

-- Include the shared.lua and cl_panel.lua files on the client and server.
plugin:IncludeFile("shared.lua", SERVERGUARD.STATE.SHARED);
plugin:IncludeFile("cl_panel.lua", SERVERGUARD.STATE.CLIENT);

--[[
	Add a folder in the data directory for this plugin.
	This is used if you have any data that needs to be saved on the server, and will
	make sure that the folder is there when you need it.
]]
serverguard.AddFolder("example");

-- Define a function that can be used throughout the plugin serverside.
function plugin:Welcome(player)
	player:ChatPrint("Welcome to the server, "..player:Name().."!");
end;

--[[
	Add a hook for PlayerInitialSpawn.
	plugin:Hook() should be used here instead of hook.Add() - these hooks will not be ran
	if the plugin has been disabled.

	plugin:hook("Hook name", "Unique hook ID", function() end)

	The unique hook ID is usually the unique ID of your plugin followed by the name,
	but you can set it to whatever you want.
]]
plugin:Hook("PlayerInitialSpawn", "example.PlayerInitialSpawn", function(player)
	plugin:Welcome(player);
end);
