-------------------------------------------------
--Here be Credits
-------------------------------------------------
local E, L, P, G = unpack(ElvUI); --Engine, Locales, Profile, Global
local DPE = E:NewModule('DPE', 'AceHook-3.0', 'AceEvent-3.0');
local M = E:GetModule('Misc');

E.UpdateAllDPE = E.UpdateAll
function E:UpdateAll()
    E.UpdateAllDPE(self)
end

function DPE:Initialize()
	--For testing purposes. will be deleted
	print("DPE init")
end

E:RegisterModule(DPE:GetName())