local E, L, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local DT = E:GetModule('DataTexts')

local displayString = '';
local lastPanel;
local self = lastPanel
E.version = GetAddOnMetadata("ElvUI", "Version");

local function OnEvent(self, event, ...)
	self.text:SetFormattedText(displayString, 'ElvUI v', E.version);
end

local function Click()
	ElvConfigToggle:Click();
end

local function OnEnter(self)
	DT:SetupTooltip(self)

	GameTooltip:AddDoubleLine("Сборка ElvUI версии", E.version)
	GameTooltip:AddLine("Редакция от Darth Predator (Дартпредатор - Свежеватель Душ)")
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine("При возникновении вопросов или желании подогнать сборку под себя обращаться:")
	GameTooltip:AddLine("- Игровая почта")
	GameTooltip:AddLine("- Личное сообщение на форуме TukUI, ник Darth Predator")
	GameTooltip:AddLine("- Личное сообщение на Curse, ник Darth_Predator")
	GameTooltip:AddLine("- Сайт Shadowmage.ru")
	
	GameTooltip:Show()
end

local function ValueColorUpdate(hex, r, g, b)
	displayString = string.join("", "%s", hex, "%.2f|r", " : Darth Predator's edit")
	
	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E['valueColorUpdateFuncs'][ValueColorUpdate] = true

DT:RegisterDatatext("Version", {'PLAYER_ENTERING_WORLD'}, OnEvent, Update, Click, OnEnter)

