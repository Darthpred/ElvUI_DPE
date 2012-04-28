﻿-------------------------------------------------
--Here be Credits
-------------------------------------------------
local E, L, P, G = unpack(ElvUI); --Engine, Locales, Profile, Global
local DPE = E:NewModule('DPE', 'AceHook-3.0', 'AceEvent-3.0');
local M = E:GetModule('Misc');
local CH = E:GetModule('Chat')

function DPE:Initialize()
	--For testing purposes.
	print("DPE initialized")
end

E.UpdateAllDPE = E.UpdateAll
function E:UpdateAll()
    E.UpdateAllDPE(self)
end

E:RegisterModule(DPE:GetName())