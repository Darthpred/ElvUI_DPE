local E, L, P, G = unpack(ElvUI); --Engine
local M = E:GetModule('Misc');

--Defaults
P['general'] = {
	['bpenable'] = 0,
};

function M:CreateBalancePower()
	local bpower = CreateFrame('Frame', "BPower", E.UIParent)
	bpower:Size(30, 10)
	bpower:Point("BOTTOMLEFT", ElvUF_Player, "TOPLEFT", 2, 3)
	bpower:CreateBackdrop('Default')
	
	local bpower_text = bpower:CreateFontString(nil, 'OVERLAY')
	bpower_text:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
	bpower_text:SetPoint("CENTER", bpower, "CENTER")
	
	bpower:SetScript("OnUpdate", function(self,event,...)
		local spower = UnitPower( PlayerFrame.unit, SPELL_POWER_ECLIPSE );
		bpower_text:SetText(spower)
	end)
	
	E:CreateMover(bpower, "BalancePowerMover", "BP")
end

if E.myclass == "DRUID" and E.db.general.bpenable then
	M:CreateBalancePower()
end