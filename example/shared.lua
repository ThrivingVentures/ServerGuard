
--[[
	This file should contain your plugin information and anything else you
	need to have shared; hooks, commands, etc.
]]

plugin.unique = "example"; -- The unique ID of the plugin - this should be lowercase characters only; no spaces or other punctuation.

plugin.name = "Example"; -- The display name of the plugin.
plugin.author = "Team ServerGuard"; -- Author of the plugin.
plugin.version = "1.0"; -- The plugin version.
plugin.description = "An example plugin for development."; -- A small, quick description.
plugin.permissions = {"Example"}; -- A table of permissions to register.

--[[
	Commands should be registered here with plugin:AddCommand().
	You should follow the consistency of immunity checks and notifies that are present
	throughout ServerGuard.
]]

local command = {}; -- Set up the command table.

command.help = "An example command."; -- A small explanation of the command.
command.command = "example"; -- The command's ID used in the chat.
command.arguments = {"<player>"}; -- A table of arguments that the command takes.
command.permissions = "Example"; -- The permission required to use the command. You can use a table to require at least one of many.
								 -- If your command doesn't need a permission, then don't define command.permissions.

-- Called when the command has been ran by a player.
function command:Execute(player, bSilent, arguments)
	-- Find a player by the critera specified.
	local target = util.FindPlayer(arguments[1], player);

	-- Do stuff if we found a target.
	if (IsValid(target)) then
		-- If you have to, check for immunity levels before doing what you need.
		if (serverguard.player:GetImmunity(target) > serverguard.player:GetImmunity(player)) then
			-- Notify the player that ran the command that they can't use it on that target.
			serverguard.Notify(player, SERVERGUARD.NOTIFY.RED, "This player has a higher immunity than you.");
			return;
		end;

		-- Do whatever you need to do after verifying that you can execute the command.
		target:Spawn();

		-- If the bSilent argument is not true, then we notify the server that something happened.
		-- When notifying the server, make sure your command is silent when specified! (bSilent will equal true in this case)
		if (!bSilent) then
			-- Note that nil is specified for serverguard.Notify() - signifying to send the notify to all players.
			serverguard.Notify(nil, SERVERGUARD.NOTIFY.GREEN, player:Name(), SERVERGUARD.NOTIFY.WHITE, " has respawned ", target:Name(), SERVERGUARD.NOTIFY.WHITE, ".");
		end;
	end;
end;

-- Called when the command needs an entry in the context menu (right click menu).
function command:ContextMenu(player, menu, rankData)
	-- Add an option to the context menu.
	local option = menu:AddOption("Respawn", function()
		-- And do something when the player clicks on it.
		serverguard.command.Run("example", false, player:UniqueID());
	end);
end;

-- Register the command through the plugin so it can be disabled when the plugin is.
plugin:AddCommand(command);