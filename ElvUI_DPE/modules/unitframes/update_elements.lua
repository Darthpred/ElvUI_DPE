local E, L, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local UF = E:GetModule('UnitFrames');
local LSM = LibStub("LibSharedMedia-3.0");

--Replacemant to move pvp indicator
function UF:UpdatePvPText(frame)
	local unit = frame.unit
	local PvPText = frame.PvPText
	local LowManaText = frame.Power.LowManaText
	
	PvPText:Show()
	if LowManaText and LowManaText:IsShown() then LowManaText:Hide() end
		
	local time = GetPVPTimer()
	local min = format("%01.f", floor((time / 1000) / 60))
	local sec = format("%02.f", floor((time / 1000) - min * 60)) 
		
	if(UnitIsPVPFreeForAll(unit)) then
		if time ~= 301000 and time ~= -1 then
			PvPText:SetText(PVP.." ".."("..min..":"..sec..")")
		else
			PvPText:SetText(PVP)
		end
	elseif UnitIsPVP(unit) then
		if time ~= 301000 and time ~= -1 then
			PvPText:SetText(PVP.." ".."("..min..":"..sec..")")
		else
			PvPText:SetText(PVP)
		end
	else
		PvPText:SetText("")
	end
	
	PvPText:Point("BOTTOMLEFT", frame.Health, "BOTTOMLEFT", 2, 2)
end