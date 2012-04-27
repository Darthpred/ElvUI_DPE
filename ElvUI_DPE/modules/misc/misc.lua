local E, L, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local M = E:GetModule('Misc');
local RU = E:GetModule('RaidUtility');


M.InitializeDPE = M.Initialize
function M:Initialize()
	M.InitializeDPE(self)

	self:LoadAutoRelease()
	RU:MoveButton()
end
