local E, L, V, P, G =  unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local LO = E:GetModule('Layout');
local DTP = E:GetModule('DTPanels');

local PANEL_HEIGHT = 22;
local SIDE_BUTTON_WIDTH = 16;

LO.ToggleChatPanelsDPE = LO.ToggleChatPanels
function LO:ToggleChatPanels()
	LO.ToggleChatPanelsDPE(self)

	--I've made replacement only for show both setting. I'm using only those atm. will do more later
	if E.db.general.panelBackdrop == 'SHOWBOTH' then
		LeftChatPanel.backdrop:Show()
		LeftChatTab:Show()
		RightChatPanel.backdrop:Show()
		RightChatTab:Show()		

		LeftChatDataPanel:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', SIDE_BUTTON_WIDTH, -21) --lower line of datapanel
		LeftChatDataPanel:Point('TOPRIGHT', LeftChatPanel, 'BOTTOMRIGHT', -(E.db.general.panelWidth - E.db.dpe.datatext.chatleft.width), -1) --upper line of datapanel		
		RightChatDataPanel:Point('BOTTOMLEFT', RightChatPanel, 'BOTTOMLEFT', E.db.general.panelWidth - E.db.dpe.datatext.chatright.width, -21) --lower-left corner of right datapanel
		RightChatDataPanel:Point('TOPRIGHT', RightChatPanel, 'BOTTOMRIGHT', -SIDE_BUTTON_WIDTH, -1)	--upper-right corner of right datapanel	
		LeftChatToggleButton:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', 0, -21)
		RightChatToggleButton:Point('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT', 0, -21)
	elseif E.db.general.panelBackdrop == 'HIDEBOTH' then
		LeftChatPanel.backdrop:Hide()
		LeftChatTab:Hide()
		RightChatPanel.backdrop:Hide()
		RightChatTab:Hide()		
		
		LeftChatDataPanel:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', SIDE_BUTTON_WIDTH, -21) --lower line of datapanel
		LeftChatDataPanel:Point('TOPRIGHT', LeftChatPanel, 'BOTTOMRIGHT', -(E.db.general.panelWidth - E.db.dpe.datatext.chatleft.width), -1) --upper line of datapanel		
		RightChatDataPanel:Point('BOTTOMLEFT', RightChatPanel, 'BOTTOMLEFT', E.db.general.panelWidth - E.db.dpe.datatext.chatright.width, -21) --lower-left corner of right datapanel
		RightChatDataPanel:Point('TOPRIGHT', RightChatPanel, 'BOTTOMRIGHT', -SIDE_BUTTON_WIDTH, -1)	--upper-right corner of right datapanel	
		LeftChatToggleButton:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', 0, -21)
		RightChatToggleButton:Point('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT', 0, -21)
	elseif E.db.general.panelBackdrop == 'LEFT' then
		LeftChatPanel.backdrop:Show()
		LeftChatTab:Show()
		RightChatPanel.backdrop:Hide()
		RightChatTab:Hide()
		
		LeftChatDataPanel:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', SIDE_BUTTON_WIDTH, -21) --lower line of datapanel
		LeftChatDataPanel:Point('TOPRIGHT', LeftChatPanel, 'BOTTOMRIGHT', -(E.db.general.panelWidth - E.db.dpe.datatext.chatleft.width), -1) --upper line of datapanel		
		RightChatDataPanel:Point('BOTTOMLEFT', RightChatPanel, 'BOTTOMLEFT', E.db.general.panelWidth - E.db.dpe.datatext.chatright.width, -21) --lower-left corner of right datapanel
		RightChatDataPanel:Point('TOPRIGHT', RightChatPanel, 'BOTTOMRIGHT', -SIDE_BUTTON_WIDTH, -1)	--upper-right corner of right datapanel	
		LeftChatToggleButton:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', 0, -21)
		RightChatToggleButton:Point('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT', 0, -21)
	else
		LeftChatPanel.backdrop:Hide()
		LeftChatTab:Hide()
		RightChatPanel.backdrop:Show()
		RightChatTab:Show()	
		
		LeftChatDataPanel:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', SIDE_BUTTON_WIDTH, -21) --lower line of datapanel
		LeftChatDataPanel:Point('TOPRIGHT', LeftChatPanel, 'BOTTOMRIGHT', -(E.db.general.panelWidth - E.db.dpe.datatext.chatleft.width), -1) --upper line of datapanel		
		RightChatDataPanel:Point('BOTTOMLEFT', RightChatPanel, 'BOTTOMLEFT', E.db.general.panelWidth - E.db.dpe.datatext.chatright.width, -21) --lower-left corner of right datapanel
		RightChatDataPanel:Point('TOPRIGHT', RightChatPanel, 'BOTTOMRIGHT', -SIDE_BUTTON_WIDTH, -1)	--upper-right corner of right datapanel	
		LeftChatToggleButton:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', 0, -21)
		RightChatToggleButton:Point('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT', 0, -21)
	end
end

function DTP:ChatResize()
	LeftChatDataPanel:Point('TOPRIGHT', LeftChatPanel, 'BOTTOMRIGHT', -(E.db.general.panelWidth - E.db.dpe.datatext.chatleft.width), -1)
	RightChatDataPanel:Point('BOTTOMLEFT', RightChatPanel, 'BOTTOMLEFT', E.db.general.panelWidth - E.db.dpe.datatext.chatright.width, -21)
end

LO.CreateChatPanelsDPE = LO.CreateChatPanels
function LO:CreateChatPanels()
	LO.CreateChatPanelsDPE(self)
	--Left Chat
	LeftChatPanel:Point('BOTTOMLEFT', E.UIParent, 0, 21)
	
	--Left Chat Tab
	LeftChatTab:Point('TOPLEFT', LeftChatPanel, 'TOPLEFT', 2, -2)
	LeftChatTab:Point('BOTTOMRIGHT', LeftChatPanel, 'TOPRIGHT', -2, -PANEL_HEIGHT)
	
	--Preventing left chat datapanel fading
	ChatFrame1EditBox:Hide()
	
	--Right Chat
	RightChatPanel:Point('BOTTOMRIGHT', E.UIParent, 0, 21)
	
	--Right Chat Tab
	RightChatTab:Point('TOPRIGHT', RightChatPanel, 'TOPRIGHT', -2, -2)
	RightChatTab:Point('BOTTOMLEFT', RightChatPanel, 'TOPLEFT', 2, -PANEL_HEIGHT)
end

--Config button was loading before my minimap changes were taking place. So that's the way to force the correct size
function LO:UpdateConfigButton()
	local RBRWidthDPE = ((E.MinimapSize - 6) / 7 + 4)
	ElvConfigToggle:Width(RBRWidthDPE)
end

function SetupQuestTrackerPanel(top, bottom)
	if QuestTrackerPanel == nil then 
		qtpanel = CreateFrame('Frame', 'QuestTrackerPanel', E.UIParent)
	else
		qtpanel = QuestTrackerPanel
	end
    qtpanel:SetFrameStrata('BACKGROUND')
	qtpanel:SetFrameLevel(0)
    qtpanel:Width(E.UIParent:GetWidth() + (E.mult * 2))
    qtpanel:Point("TOPLEFT", top, "TOPLEFT", -30, 10)
    qtpanel:Point("BOTTOMRIGHT", bottom, "BOTTOMRIGHT", 20, -10)
    qtpanel:SetTemplate('Transparent')
end
