-------------------------------------------------
--Here be Credits
-------------------------------------------------
local E, L, P, G = unpack(ElvUI); --Engine, Locales, Profile, Global
local DPE = E:NewModule('DPE', 'AceHook-3.0', 'AceEvent-3.0');

function DPE:Initialize()
	--For testing purposes.
	E.db.auras.perRow = 19
	print("DPE initialized")
end

E.UpdateAllDPE = E.UpdateAll
function E:UpdateAll()
    E.UpdateAllDPE(self)
	
	E.db.auras.perRow = 19
end

E:RegisterModule(DPE:GetName())