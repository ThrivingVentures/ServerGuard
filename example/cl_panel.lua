
--[[
	Any UI that belongs inside of ServerGuard is usually put inside of a cl_panel.lua
	file (like categories), but is not required. You can shove it in cl_init.lua if you
	really want to.
]]

local plugin = plugin;
local category = {}; -- Set up the category table.

category.name = "Example"; -- Name of the category.
category.material = "serverguard/menuicons/icon_information.png"; -- Path to the material to be used for the icon.
category.permissions = "Example"; -- Permission required to view the category.
								  -- If your category doesn't need a permission, then don't define category.permissions.

--[[
	Called when the category is created.
	You should keep the UI somewhat consistent with the rest of ServerGuard for a better user experience.
	A general convention is putting your content in a tiger.panel, and adding that tiger.panel to the base.
	You should use the tiger.* panels when applicable, and setting the skin for other panels to "serverguard".
]]
function category:Create(base)
	--Create the category panel, set a title, and fill the menu with it via docking.
	base.panel = base:Add("tiger.panel");
	base.panel:SetTitle("Example category");
	base.panel:Dock(FILL);

	--[[
		Create a button, set the text and size, and dock it to the bottom of the category panel.
		No need for DockMargin() here because the base.panel already has a docking margin applied.
	]]
	base.panel.button = base.panel:Add("tiger.button");
	base.panel.button:SetText("This does nothing!");
	base.panel.button:SizeToContents();
	base.panel.button:Dock(BOTTOM);
end;

--[[
	Called whenever the user clicks on the category, making it visible.
	This function doesn't need to be defined if you don't need to use it.
]]
function category:Update()
end;

--[[
	Called while the ServerGuard menu panel is open.
	This function doesn't need to be defined if you don't need to use it.
]]
function category:Think()
end;

-- Register the category through the plugin so it can be enabled/disabled when the plugin is.
plugin:AddCategory(category);