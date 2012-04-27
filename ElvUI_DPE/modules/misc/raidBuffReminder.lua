local E, L, DF = unpack(ElvUI) -- Import Functions/Constants, Config, Locales
local RBR = E:GetModule('RaidBuffReminder');

E.RaidBuffReminder = RBR

localizedClass, englishClass = UnitClass("player")
local class = englishClass

if class == "PALADIN" then
	RBR.Spell7Buffs = {
	20165, --"Seal of Insight"
	20154, --"Seal of Reckoning"
	20164, --"Seal of Justice"
	31801, --"Seal of Truth"
	}
elseif class == "DEATHKNIGHT" then
	RBR.Spell7Buffs = {
	48265, --"Unholy presence"
	48266, --"Frost presence"
	48263, --"Blood presence"
	}
elseif class == "MAGE" then
	RBR.Spell7Buffs = {
	7302, --"Frost armor"
	30482, --"Molten armor"
	6117, --"Mage armor"
	}
elseif class == "WARLOCK" then
    RBR.Spell7Buffs = {
	80398, --"Dark Intent"
	}
elseif class == "PRIEST" then
    RBR.Spell7Buffs = {
	73413, --Внутренняя решимость
	588, --Внутренний огонь
	}
elseif class == "HUNTER" then
    RBR.Spell7Buffs = {
	82661, --Лиса
	13165, --Ястреб
	}	
else
    RBR.Spell7Buffs = {
	80398, --"Dark Intent"
	}
end

RBR.UpdateReminderDPE = RBR.UpdateReminder
function RBR:UpdateReminder(event, unit)
	RBR.UpdateReminderDPE(self)
	
	local frame = self.frame
		
	for i = 2, 7 do
		local hasBuff, texture = self:CheckFilterForActiveBuff(self['Spell'..i..'Buffs'])
		frame['spell'..i].t:SetTexture(texture)
		if hasBuff then
			frame['spell'..i]:SetAlpha(0.2)
		else
			frame['spell'..i]:SetAlpha(1)
		end
	end
end


function RBR:Initialize()
	local frame = CreateFrame('Frame', 'RaidBuffReminder', Minimap)
	frame:SetTemplate('Default')
	frame:Width(E.RBRWidth)
	frame:Point('TOPLEFT', Minimap.backdrop, 'TOPRIGHT', 1, 0)
	frame:Point('BOTTOMLEFT', Minimap.backdrop, 'BOTTOMRIGHT', 1, 0)

	frame.spell1 = self:CreateButton(frame, true)
	frame.spell2 = self:CreateButton(frame.spell1)
	frame.spell3 = self:CreateButton(frame.spell2)
	frame.spell4 = self:CreateButton(frame.spell3)
	frame.spell5 = self:CreateButton(frame.spell4)
	frame.spell6 = self:CreateButton(frame.spell5)
	frame.spell7 = self:CreateButton(frame.spell6, nil, true)
	self.frame = frame
	
	if E.db.general.raidReminder then
		self:EnableRBR()
	else
		self:DisableRBR()
	end
end
