local E, L, V, P, G =  unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local M = E:GetModule('Minimap');
local LO = E:GetModule('Layout');
E.Minimap = M
local RBRWidthDPE = ((E.MinimapSize - 6) / 7 + 4)

--A part of addint 7th icon to raid buff reminder
M.UpdateSettingsDPE = M.UpdateSettings
function M:UpdateSettings()
	M.UpdateSettingsDPE(self)

	if E.db.general.raidReminder then
		E.RBRWidth = RBRWidthDPE
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