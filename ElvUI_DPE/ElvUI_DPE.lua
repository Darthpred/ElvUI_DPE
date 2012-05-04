-------------------------------------------------
--Here be Credits
-------------------------------------------------
local E, L, V, P, G =  unpack(ElvUI); --Engine, Locales, Profile, Global
local DPE = E:NewModule('DPE', 'AceHook-3.0', 'AceEvent-3.0');

function DPE:Initialize()
	E.db.auras.perRow = 19 --Forcing more auras to show
	
	print("DPE initialized")
end

E.UpdateAllDPE = E.UpdateAll
function E:UpdateAll()
    E.UpdateAllDPE(self)
	E:GetModule('DTPanels'):Update()
	
	E.db.auras.perRow = 19 --Forcing more auras to show after profile change as long as it's profile based setting
end

E:RegisterModule(DPE:GetName())