-------------------------------------------------
--Here be Credits
-------------------------------------------------
local E, L, V, P, G =  unpack(ElvUI); --Engine, Locales, Profile, Global
local DPE = E:NewModule('DPE', 'AceHook-3.0', 'AceEvent-3.0');

function DPE:Initialize()
	E.db.auras.perRow = 19 --Forcing more auras to show
	Start_Questtracker()
	
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "UpdateThings");
	if self.db.general.loginmessage then
		print(L['DPE_LOGIN_MSG'])
	end
end

--Updating things that must be updated only after everything loads
function DPE:UpdateThings()
	E:GetModule('UnitFrames'):Update_CombatIndicator()
end

E.UpdateAllDPE = E.UpdateAll
function E:UpdateAll()
    E.UpdateAllDPE(self)
	E:GetModule('DTPanels'):Update()
	E:GetModule('UnitFrames'):Update_CombatIndicator()
	
	E.db.auras.perRow = 19 --Forcing more auras to show after profile change as long as it's profile based setting
end

E:RegisterModule(DPE:GetName())