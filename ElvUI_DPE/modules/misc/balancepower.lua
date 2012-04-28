local E, L, P, G = unpack(ElvUI); --Engine
local M = E:GetModule('Misc');
local DPE = E:GetModule('DPE');

--Defaults
P['general'] = {
	['bpenable'] = false,
};

local bpower = CreateFrame('Frame', "BPower", E.UIParent)
local bpower_text = bpower:CreateFontString(nil, 'OVERLAY')

function M:CreateBalancePower()
	
	bpower:Size(30, 10)
	bpower:Point("BOTTOMLEFT", ElvUF_Player, "TOPLEFT", 2, 3)
	bpower:CreateBackdrop('Default')
	
	
	bpower_text:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
	bpower_text:SetPoint("CENTER", bpower, "CENTER")
	
	bpower:SetScript("OnUpdate", function(self,event,...)
		local spower = UnitPower( PlayerFrame.unit, SPELL_POWER_ECLIPSE );
		bpower_text:SetText(spower)
	end)
	
	E:CreateMover(bpower, "BalancePowerMover", "BP")
	
	bpower:Hide()
	
	DPE:BPUpdate()
end

function DPE:BPUpdate()
	if E.db.general.bpenable then
		bpower:Show()
	else
		bpower:Hide()
	end
end

if E.myclass == "DRUID" then
	M:CreateBalancePower()
end