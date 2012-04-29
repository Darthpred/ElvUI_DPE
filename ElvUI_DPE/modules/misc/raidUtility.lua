local E, L, DF = unpack(ElvUI) -- Import Functions/Constants, Config, Locales
local RU = E:GetModule('RaidUtility');

E.RaidUtility = RU

--Moved RU down cause of top datatext panels
function RU:MoveButton()
	ShowButton:ClearAllPoints()
	ShowButton:Point("TOP", E.UIParent, "TOP", -400, -21)
	
	ShowButton:SetScript("OnDragStop", function(self) 
		self:StopMovingOrSizing()
		local point = self:GetPoint()
		local xOffset = self:GetCenter()
		local screenWidth = E.UIParent:GetWidth() / 2
		xOffset = xOffset - screenWidth
		self:ClearAllPoints()
		if string.find(point, "BOTTOM") then
			self:SetPoint('BOTTOM', E.UIParent, 'BOTTOM', xOffset, -1)
		else
			self:SetPoint('TOP', E.UIParent, 'TOP', xOffset, -21)		
		end
	end)
end