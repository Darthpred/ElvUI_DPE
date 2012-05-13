local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local AB = E:GetModule('ActionBars');

	local function PositionBar1()
		AB.movers['bar1']["p"] = "BOTTOM"
		AB.movers['bar1']["p2"] = E.UIParent
		AB.movers['bar1']["p3"] = "BOTTOM"
		AB.movers['bar1']["p4"] = 0
		AB.movers['bar1']["p5"] = 21
	end

	local function PositionBar2()
		AB.movers['bar2']["p"] = "TOP"
		AB.movers['bar2']["p2"] = ElvUI_Bar1
		AB.movers['bar2']["p3"] = "BOTTOM"
		AB.movers['bar2']["p4"] = 0
		AB.movers['bar2']["p5"] = bar2ypos
	end

	local function PositionStanceBar()
		AB.movers['barShapeShift']["p"] = "BOTTOMRIGHT"
		AB.movers['barShapeShift']["p2"] = LeftChatPanel
		AB.movers['barShapeShift']["p3"] = "TOPRIGHT"
		AB.movers['barShapeShift']["p4"] = 2
		AB.movers['barShapeShift']["p5"] = -3
	end
	
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
	
local function PositionHookUpdate()
	PositionBar1()
	PositionBar2()
	PositionStanceBar()

	AB:SetMoverPositions()  --Saves Action Bar Positions

	PositionGMMover()

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