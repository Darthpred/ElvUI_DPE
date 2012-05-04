local E, L, V, P, G =  unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local UF = E:GetModule('UnitFrames');
local LSM = LibStub("LibSharedMedia-3.0");

local abs = math.abs
local _, ns = ...
local ElvUF = ns.oUF

--Function to move damn combat indicator to topright part of the frame. Maybe i should create an option to make it placeble everywhere.
function UF:Update_CombatIndicator()
	local CombatText = ElvUF_Player.Combat
	
	local x, y = self:GetPositionOffset(E.db.dpe.combatico.pos)
	CombatText:ClearAllPoints()
	CombatText:Point(E.db.dpe.combatico.pos, ElvUF_Player.Health, E.db.dpe.combatico.pos, x, x)
end

UF.Update_PlayerFrameDPE = UF.Update_PlayerFrame
function UF:Update_PlayerFrame(frame, db)
	UF:Update_PlayerFrameDPE(frame, db)
	
	local power = frame.Power
	--Text
	if db.power.text then
		power.value:Show()
		
		local x, y = self:GetPositionOffset(db.power.position)
		power.value:ClearAllPoints()
		power.value:Point(db.power.position, frame.Power, db.power.position, x, y)			
	else
		power.value:Hide()
	end
	
	frame:UpdateAllElements()
end

UF:Update_AllFrames()
--UF:Update_CombatIndicator(self)