local E, L, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local CH = E:GetModule('Chat')

CH.PositionChatDPE = CH.PositionChat
function CH:PositionChat(override)
	CH.PositionChatDPE(self)
	local chat, chatbg, tab, id, point, button, isDocked, chatFound
	for _, frameName in pairs(CHAT_FRAMES) do
		chat = _G[frameName]
		id = chat:GetID()
		point = GetChatWindowSavedPosition(id)
		
		if point == "BOTTOMRIGHT" and chat:IsShown() then
			chatFound = true
			break
		end
	end	

	CreatedFrames = id
	
	for i=1, CreatedFrames do
		chat = _G[format("ChatFrame%d", i)]
		chatbg = format("ChatFrame%dBackground", i)
		button = _G[format("ButtonCF%d", i)]
		id = chat:GetID()
		tab = _G[format("ChatFrame%sTab", i)]
		point = GetChatWindowSavedPosition(id)
		_, _, _, _, _, _, _, _, isDocked, _ = GetChatWindowInfo(id)		
		
		if id > NUM_CHAT_WINDOWS then
			if point == nil then
				point = select(1, chat:GetPoint())
			end
			if select(2, tab:GetPoint()):GetName() ~= bg then
				isDocked = true
			else
				isDocked = false
			end	
		end	
		
		if not chat.isInitialized then return end
	
		
	if point == "BOTTOMRIGHT" and chat:IsShown() and not (id > NUM_CHAT_WINDOWS) and id == self.RightChatWindowID then
		if id ~= 2 then
			chat:ClearAllPoints()
			chat:Point("BOTTOMLEFT", RightChatDataPanel, "TOPLEFT", -70, 3)
			chat:SetSize(E.db.general.panelWidth - 6, (E.db.general.panelHeight - 27))
		else
			chat:ClearAllPoints()
			chat:Point("BOTTOMLEFT", RightChatDataPanel, "TOPLEFT", 1, 3)
			chat:Size(E.db.general.panelWidth - 11, (E.db.general.panelHeight - 60) - CombatLogQuickButtonFrame_Custom:GetHeight())				
		end

		FCF_SavePositionAndDimensions(chat)			
		
		tab:SetParent(RightChatPanel)
		chat:SetParent(tab)
		
		if E.db.general.panelBackdrop == 'HIDEBOTH' or E.db.general.panelBackdrop == 'LEFT' then
			CH:SetupChatTabs(tab, true)
		else
			CH:SetupChatTabs(tab, false)
		end
	elseif not isDocked and chat:IsShown() then
		tab:SetParent(E.UIParent)
		chat:SetParent(E.UIParent)
		
		CH:SetupChatTabs(tab, true)
	else
		if id ~= 2 and not (id > NUM_CHAT_WINDOWS) then
			chat:ClearAllPoints()
			chat:Point("BOTTOMLEFT", LeftChatToggleButton, "TOPLEFT", 1, 3)
			chat:Size(E.db.general.panelWidth - 6, (E.db.general.panelHeight - 27))
			FCF_SavePositionAndDimensions(chat)		
		end
		chat:SetParent(LeftChatPanel)
		tab:SetParent(GeneralDockManager)
		
		if E.db.general.panelBackdrop == 'HIDEBOTH' or E.db.general.panelBackdrop == 'RIGHT' then
			CH:SetupChatTabs(tab, true)
		else
			CH:SetupChatTabs(tab, false)
		end			
	end	

	end
end