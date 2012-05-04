local E, L, V, P, G =  unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local M = E:GetModule('Misc');
local RU = E:GetModule('RaidUtility');

--For moving raid utility button
M.InitializeDPE = M.Initialize
function M:Initialize()
	M.InitializeDPE(self)

	RU:MoveButton()
end
