local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local AB = E:GetModule('ActionBars');

	--[[local function PositionBar1()
		--E.db.movers.ElvAB_1 = "BOTTOMUIParentBOTTOM021"
		--AB.['bar1']['position'] = "BOTTOM,ElvUIParent,BOTTOM,0,21"
		--AB.movers['bar1']["p"] = "BOTTOM"
		AB.movers['bar1']["p2"] = E.UIParent
		AB.movers['bar1']["p3"] = "BOTTOM"
		AB.movers['bar1']["p4"] = 0
		AB.movers['bar1']["p5"] = 21
	end]]
	
AB["barDefaults"] = {
	["bar1"] = {
		['page'] = 1,
		['bindButtons'] = "ACTIONBUTTON",
		['conditions'] = "[bonusbar:5] 11; [bar:2] 2; [bar:3] 3; [bar:4] 4; [bar:5] 5; [bar:6] 6;",
		['position'] = "BOTTOM,ElvUIParent,BOTTOM,0,21",
	},
	["bar2"] = {
		['page'] = 5,
		['bindButtons'] = "MULTIACTIONBAR2BUTTON",
		['conditions'] = "",
		['position'] = "BOTTOM,ElvUI_Bar1,TOP,0,2",
	},
	["bar3"] = {
		['page'] = 6,
		['bindButtons'] = "MULTIACTIONBAR1BUTTON",
		['conditions'] = "",
		['position'] = "LEFT,ElvUI_Bar1,RIGHT,4,0",
	},
	["bar4"] = {
		['page'] = 4,
		['bindButtons'] = "MULTIACTIONBAR4BUTTON",
		['conditions'] = "",
		['position'] = "RIGHT,ElvUIParent,RIGHT,-4,0",
	},
	["bar5"] = {
		['page'] = 3,
		['bindButtons'] = "MULTIACTIONBAR3BUTTON",
		['conditions'] = "",
		['position'] = "RIGHT,ElvUI_Bar1,LEFT,-4,0",
	},	
}	
--[[
	local function PositionBar2()
		AB.movers['bar2']["p"] = "TOP"
		AB.movers['bar2']["p2"] = ElvUI_Bar1
		AB.movers['bar2']["p3"] = "BOTTOM"
		AB.movers['bar2']["p4"] = 0
		AB.movers['bar2']["p5"] = bar2ypos
	end
]]
	--local function PositionStanceBar()
	--ElvUI_BarShapeShift:Point('TOPLEFT', E.UIParent, 'TOPLEFT', 4, -4);
		--[[AB.movers['barShapeShift']["p"] = "BOTTOMRIGHT"
		AB.movers['barShapeShift']["p2"] = LeftChatPanel
		AB.movers['barShapeShift']["p3"] = "TOPRIGHT"
		AB.movers['barShapeShift']["p4"] = 2
		AB.movers['barShapeShift']["p5"] = -3]]
	--end
--[[	
	local function PositionGMMover()
		if not E:HasMoverBeenMoved('GMMover') then
			GMMover:ClearAllPoints()
			GMMover:Point("TOPLEFT", E.UIParent, "TOPLEFT", 310, -1)
		end
		E.CreatedMovers['GMMover']["p"] = "TOPLEFT"
		E.CreatedMovers['GMMover']["p2"] = E.UIParent
		E.CreatedMovers['GMMover']["p3"] = "TOPLEFT"
		E.CreatedMovers['GMMover']["p4"] = 310
		E.CreatedMovers['GMMover']["p5"] = -1
	end
]]	
local function PositionHookUpdate()
	--PositionBar1()
	--PositionBar2()
	--PositionStanceBar()

	--AB:SetMoverPositions()  --Saves Action Bar Positions

	--PositionGMMover()

	--For some reason the FocusTarget frame position won't stick unless I do this. UF positions are set in install.lua
	E:MoveUI(true, 'unitframes')
	E:MoveUI(false)

	-- hook the ExtraActionButton1 texture, idea by roth via WoWInterface forums
	-- code taken from Tukui
	local button = ExtraActionButton1
	local icon = button.icon
	local texture = button.style

	local function disableTexture(style, texture)
		if string.sub(texture,1,9) == "Interface" then
			style:SetTexture("")
		end
	end
	button.style:SetTexture("")
	hooksecurefunc(texture, "SetTexture", disableTexture)
end

local frame = CreateFrame("Frame", nil, nil)
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent",function(self, event)
	if event == "PLAYER_ENTERING_WORLD" then
		PositionHookUpdate()
		frame:UnregisterEvent("PLAYER_ENTERING_WORLD")
	end
end)	