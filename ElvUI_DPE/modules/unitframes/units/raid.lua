local E, L, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local UF = E:GetModule('UnitFrames');
local LSM = LibStub("LibSharedMedia-3.0");

local abs = math.abs
local _, ns = ...
local ElvUF = ns.oUF

function UF:Resize_RaidResIndicator()
	if GetNumRaidMembers() == 0 then return end
	local Rmembers = GetNumRaidMembers()
	if GetNumRaidMembers() > 5 and GetNumRaidMembers() < 26 then
		for i = 1, Rmembers do
			_G["ElvUF_Raid625UnitButton"..i].ResurrectIcon:Size(16, 20)
		end
	else
		for i = 1, Rmembers do
			_G["ElvUF_Raid2640UnitButton"..i].ResurrectIcon:Size(16, 20)
		end
	end
end

UF:Update_AllFrames()
UF:RegisterEvent("RAID_ROSTER_UPDATE", "Resize_RaidResIndicator")
