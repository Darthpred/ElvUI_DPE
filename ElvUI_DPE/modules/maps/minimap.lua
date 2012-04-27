local E, L, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local M = E:GetModule('Minimap');
local LO = E:GetModule('Layout');
E.Minimap = M

M.UpdateSettingsDPE = M.UpdateSettings
function M:UpdateSettings()
	M.UpdateSettingsDPE(self)

	if E.db.general.raidReminder then
		E.RBRWidth = ((E.MinimapSize - 6) / 7) + 4
	else
		E.RBRWidth = 0;
	end
	
	if RaidBuffReminder then
		RaidBuffReminder:Width(E.RBRWidth)
		for i=1, 7 do
			RaidBuffReminder['spell'..i]:Size(E.RBRWidth - 4)
		end
		
		if E.db.general.raidReminder then
			E:GetModule('RaidBuffReminder'):EnableRBR()
		else
			E:GetModule('RaidBuffReminder'):DisableRBR()
		end
	end
	
	LO:UpdateConfigButton()
end