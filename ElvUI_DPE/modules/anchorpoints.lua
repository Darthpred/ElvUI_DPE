local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local AB = E:GetModule('ActionBars');

local frame = CreateFrame("Frame", nil, UIParent)

frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent",function(self, event)
    if event == "PLAYER_ENTERING_WORLD" then
	local spacing = E:Scale(E.db.actionbar.bar1.buttonspacing);
	local size = E:Scale(E.db.actionbar.bar1.buttonsize);
	local bar2ypos = ((size * 2) + (spacing * 3))
	local bar3ypos = ((size * 3) + (spacing * 4))

		--Set Action Bar 1 position
		AB.movers['bar1']["p"] = "BOTTOM"
		AB.movers['bar1']["p2"] = E.UIParent
		AB.movers['bar1']["p3"] = "BOTTOM"
		AB.movers['bar1']["p4"] = 0
		AB.movers['bar1']["p5"] = 21

		--Set Action Bar 2 position
		AB.movers['bar2']["p"] = "TOP"
		AB.movers['bar2']["p2"] = ElvUI_Bar1
		AB.movers['bar2']["p3"] = "BOTTOM"
		AB.movers['bar2']["p4"] = 0
		AB.movers['bar2']["p5"] = bar2ypos
		
		--Set Shapeshift Bar position
		AB.movers['barShapeShift']["p"] = "BOTTOMRIGHT"
		AB.movers['barShapeShift']["p2"] = LeftChatPanel
		AB.movers['barShapeShift']["p3"] = "TOPRIGHT"
		AB.movers['barShapeShift']["p4"] = 2
		AB.movers['barShapeShift']["p5"] = -3

		--Save Action Bar positions
		AB:SetMoverPositions()
		
		frame:UnregisterEvent("PLAYER_ENTERING_WORLD")
	end
end)