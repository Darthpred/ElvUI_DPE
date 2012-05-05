--[[

QuestTracker by Rushty@EU-Alexstrasza
All rights reserved.

What it does:
- change the font and fontsize
- adds a backdrop to the tracker

]]--
local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local QT = E:NewModule('Questtracker', 'AceHook-3.0', 'AceEvent-3.0');

local function SetupQuestTrackerSkin()
	local numQuestLines = #WATCHFRAME_QUESTLINES
	local numAchivementLines = #WATCHFRAME_ACHIEVEMENTLINES
	local numTimerLines = #WATCHFRAME_TIMERLINES
	local numVisibleLines = numQuestLines + numAchivementLines + numTimerLines

	WatchFrameTitle:FontTemplate(E["media"].normFont, E.global.dpe.questtracker.qtfontsize + 2, E.global.dpe.questtracker.qtfontflags)

	for i = 1, numVisibleLines + 1 do
		_G["WatchFrameLine" .. i].text:FontTemplate(E["media"].normFont, E.global.dpe.questtracker.qtfontsize, E.global.dpe.questtracker.qtfontflags) end
end

local function SetupQuestTrackerBackdrop()
	local numQuestLines = #WATCHFRAME_QUESTLINES
	local numAchivementLines = #WATCHFRAME_ACHIEVEMENTLINES
	local numTimerLines = #WATCHFRAME_TIMERLINES
	local numVisibleLines = numQuestLines + numAchivementLines + numTimerLines

	local top = WatchFrameHeader
	local bottom = _G["WatchFrameLine" .. numVisibleLines + 1]

	SetupQuestTrackerPanel(top, bottom)
end

function QT:QuestTracker_Update()
	SetupQuestTrackerSkin()

	if E.global.dpe.questtracker.qtbackdrop then 
		SetupQuestTrackerBackdrop() end
end

function QT:QuestTracker_Collapse()

	if E.global.dpe.questtracker.qtbackdrop then 
		QuestTrackerPanel:Hide() end
end

function QT:QuestTracker_Expand()

	if E.global.dpe.questtracker.qtbackdrop then 
		QuestTrackerPanel:Show() end
end

function Start_Questtracker()

	SetupQuestTrackerSkin()

	if E.global.dpe.questtracker.qtbackdrop then
		SetupQuestTrackerBackdrop() end

	if not QT:IsHooked("WatchFrame_Update")	then	
		QT:SecureHook( "WatchFrame_Update", "QuestTracker_Update" ) end

	if not QT:IsHooked("WatchFrame_Collapse")	then	
		QT:SecureHook( "WatchFrame_Collapse", "QuestTracker_Collapse" ) end

	if not QT:IsHooked("WatchFrame_Expand")	then	
		QT:SecureHook( "WatchFrame_Expand", "QuestTracker_Expand" ) end
end