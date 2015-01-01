--[[

Created by Zombine, http://steamcommunity.com/id/dyfile
If you modify this, please be sure to give proper credits.

]]--

plugin:IncludeFile("shared.lua", SERVERGUARD.STATE.CLIENT)

plugin:Hook("OnPlayerChat", "Tags", function( ply, msg, teamChat, isDead )
	local group = serverguard.player:GetRank(ply)
	local color = serverguard.ranks:GetRank(group).color
	local name = serverguard.ranks:GetRank(group).name

	chat.AddText( Color(color.r, color.g, color.b), "[", name, "] ", team.GetColor(ply:Team()), ply, Color(255,255,255), ": ", msg )
	
	return true

end)