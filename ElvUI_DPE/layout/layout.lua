local E, L, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local LO = E:GetModule('Layout');

local PANEL_HEIGHT = 22;
local SIDE_BUTTON_WIDTH = 16;

LO.ToggleChatPanelsDPE = LO.ToggleChatPanels
function LO:ToggleChatPanels()
	LO.ToggleChatPanelsDPE(self)

	if E.db.general.panelBackdrop == 'SHOWBOTH' then
		LeftChatPanel.backdrop:Show()
		LeftChatTab:Show()
		RightChatPanel.backdrop:Show()
		RightChatTab:Show()		

		LeftChatDataPanel:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', SIDE_BUTTON_WIDTH, -21) --lower line of datapanel
		LeftChatDataPanel:Point('TOPRIGHT', LeftChatPanel, 'BOTTOMRIGHT', -70, -1) --upper line of datapanel		
		RightChatDataPanel:Point('BOTTOMLEFT', RightChatPanel, 'BOTTOMLEFT', 70, -21) --lower-left corner of right datapanel
		RightChatDataPanel:Point('TOPRIGHT', RightChatPanel, 'BOTTOMRIGHT', -SIDE_BUTTON_WIDTH, -1)	--upper-right corner of right datapanel	
		LeftChatToggleButton:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', 0, -21)
		RightChatToggleButton:Point('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT', 0, -21)
	end
end

LO.CreateChatPanelsDPE = LO.CreateChatPanels
function LO:CreateChatPanels()
	LO.CreateChatPanelsDPE(self)
	--Left Chat
	LeftChatPanel:Point('BOTTOMLEFT', E.UIParent, 0, 21)
	
	--Left Chat Tab
	LeftChatTab:Point('TOPLEFT', LeftChatPanel, 'TOPLEFT', 2, -2)
	LeftChatTab:Point('BOTTOMRIGHT', LeftChatPanel, 'TOPRIGHT', -2, -PANEL_HEIGHT)
	
	--Preventing left chat detapanel fading
	ChatFrame1EditBox:Hide()
	
	--Right Chat
	RightChatPanel:Point('BOTTOMRIGHT', E.UIParent, 0, 21)
	
	--Right Chat Tab
	RightChatTab:Point('TOPRIGHT', RightChatPanel, 'TOPRIGHT', -2, -2)
	RightChatTab:Point('BOTTOMLEFT', RightChatPanel, 'TOPLEFT', 2, -PANEL_HEIGHT)
end

function LO:UpdateConfigButton()
	local RBRWidthDPE = ((E.MinimapSize - 6) / 7 + 4)
	ElvConfigToggle:Width(RBRWidthDPE)
end
