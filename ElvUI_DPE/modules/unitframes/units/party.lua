local E, L, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local UF = E:GetModule('UnitFrames');
local LSM = LibStub("LibSharedMedia-3.0");

local abs = math.abs
local _, ns = ...
local ElvUF = ns.oUF

function UF:Resize_PartyResIndicator()
	if GetNumRaidMembers() > 5 then return end
	local Pmembers = GetNumPartyMembers() + 1
	for i = 1, Pmembers do
		_G["ElvUF_PartyUnitButton"..i].ResurrectIcon:Size(16, 20)
	end
end

UF:Update_AllFrames()
UF:RegisterEvent("PARTY_MEMBERS_CHANGED", "Resize_PartyResIndicator")
