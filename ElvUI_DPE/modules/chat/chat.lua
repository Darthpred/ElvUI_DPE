local E, L, V, P, G =  unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local CH = E:GetModule('Chat')
local LSM = LibStub("LibSharedMedia-3.0")

function CH:FadeUpdate()
	for _, frameName in pairs(CHAT_FRAMES) do
		local frame = _G[frameName]
	CH:StyleChat(frame)
	end
end

CH.StyleChatRE = CH.StyleChat
function CH:StyleChat(frame)
	self:StyleChatRE(frame)
	local name = frame:GetName()
	if E.db.dpe.chat.fade then
		_G[name]:SetFading(true) --Enable chat text fading after some time
	else
		_G[name]:SetFading(false) --Disable chat text fading after some time
	end
end

function CH:ChatEdit_AddHistory(editBox, line)
	if line:find("/rl") then return; end

	if ( strlen(line) > 0 ) then
		for i, text in pairs(ElvCharacterData.ChatEditHistory) do
			if text == line then
				return
			end
		end

		table.insert(ElvCharacterData.ChatEditHistory, #ElvCharacterData.ChatEditHistory + 1, line)
		if #ElvCharacterData.ChatEditHistory > E.db.chat.editboxhistory then
			for i=1,(#ElvCharacterData.ChatEditHistory - E.db.chat.editboxhistory) do
				table.remove(ElvCharacterData.ChatEditHistory, 1)
			end
		end
	end
end

-------------------------------------------------------
-- Highlight your own name when someone mentions you
-- Credit: Hydra
-- Todo: Add some options for it later
-------------------------------------------------------
local string = string
local gsub = string.gsub
local strsub = string.sub
local strfind = string.find
local format = string.format
local strlower = string.lower
local Wrapper = "|cff71D5FF[%s]|r"
local MyName = gsub(UnitName("player"), "%u", strlower, 1)
local NameList = {MyName, "Дартпредатор", "Дарт", "Дартэ", "Пред", "Darth", "Darthpred"}

-- Finding our name in a URL breaks the hyperlink, so check & exclude them
local FindURL = function(msg)
	local NewString, Found = gsub(msg, "(%a+)://(%S+)%s?", "%1://%2")
	if Found > 0 then return NewString end

	NewString, Found = gsub(msg, "www%.([_A-Za-z0-9-]+)%.(%S+)%s?", "www.%1.%2")
	if Found > 0 then return NewString end

	NewString, Found = gsub(msg, "([_A-Za-z0-9-%.]+)@([_A-Za-z0-9-]+)(%.+)([_A-Za-z0-9-%.]+)%s?", "%1@%2%3%4")
	if Found > 0 then return NewString end
end

local FindMyName = function(self, event, message, author, ...)
	if not E.db.dpe.chat.namehighlight then return end
	for i = 1, #NameList do
		if strfind(message, NameList[i]) then
			local Start, Stop = strfind(message, NameList[i])
			local Name = strsub(message, Start, Stop)
			local Link = FindURL(message)

			if (not Link) or (Link and not strfind(Link, Name)) then
				if E.db.dpe.chat.sound then
					PlaySoundFile(LSM:Fetch("sound", E.db.dpe.chat.warningsound));
				end
				return false, gsub(message, Name, format(Wrapper, Name)), author, ...
			end
		end
	end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", FindMyName)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", FindMyName)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", FindMyName)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", FindMyName)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", FindMyName)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND", FindMyName)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND_LEADER", FindMyName)

--Replacement of chat tab position and size function
function CH:PositionChat(override)
	if (InCombatLockdown() and not override and self.initialMove) or (IsMouseButtonDown("LeftButton") and not override) then return end
	
	RightChatPanel:Size(E.db.general.panelWidth, E.db.general.panelHeight)
	LeftChatPanel:Size(E.db.general.panelWidth, E.db.general.panelHeight)	
	
	if E.private.chat.enable ~= true then return end
	
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

	if chatFound then
		self.RightChatWindowID = id
	else
		self.RightChatWindowID = nil
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
			chat:Point("BOTTOMRIGHT", RightChatDataPanel, "TOPRIGHT", 10, 3) -- <<< Changed
			chat:SetSize(E.db.general.panelWidth - 6, (E.db.general.panelHeight - 27)) -- <<< Changed
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
			chat:Size(E.db.general.panelWidth - 6, (E.db.general.panelHeight - 27)) -- <<< Changed
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
	
	self.initialMove = true;
end