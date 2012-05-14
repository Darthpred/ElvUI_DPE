local E, L, V, P, G =  unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local CH = E:GetModule('Chat')

local selectedName
local selectedChannel
local names
local channels

local function UpdateName(reset)
	if not selectedName or not E.private['namelist'][selectedName] or reset then
		E.Options.args.nameplate.args.nameGroup = nil
		if not reset then
			return
		end
	end
	
	E.Options.args.dpe.args.chat.args.nameGroup = {
		type = 'group',
		name = selectedName,
		guiInline = true,
		order = -10,	
		args = {},	
	}
	
	E.Options.args.dpe.args.chat.args.nameGroup.args.info = {
		order = 1,
		type = "description",
		name = L["You can delete selected name from the list here by clicking the button below"],
	}
	
	E.Options.args.dpe.args.chat.args.nameGroup.args.delete = {
		order = 2,
		type = "execute",
		name = L["Remove Name"],
		desc = L["Delete this name from the list"],
		func = function() CH:DeleteName() end,
	}	
end

local function UpdateChannel(reset)
	if not selectedChannel or not E.private['channellist'][selectedChannel] or reset then
		E.Options.args.nameplate.args.channelGroup = nil
		if not reset then
			return
		end
	end
	
	E.Options.args.dpe.args.chat.args.channelGroup = {
		type = 'group',
		name = selectedChannel,
		guiInline = true,
		order = -20,	
		args = {},	
	}
	
	E.Options.args.dpe.args.chat.args.channelGroup.args.info = {
		order = 1,
		type = "description",
		name = L["You can delete selected channel from the list here by clicking the button below"],
	}
	
	E.Options.args.dpe.args.chat.args.channelGroup.args.delete = {
		order = 2,
		type = "execute",
		name = L["Remove Channel"],
		desc = L["Delete this channel from the list"],
		func = function() CH:DeleteChannel() end,
	}	
end

function CH:DeleteName()
	E.private['namelist'][selectedName] = nil
	selectedName = nil;
	E.Options.args.dpe.args.chat.args.nameGroup = nil
	UpdateName()
	CH:NamesListUpdate()
end

function CH:DeleteChannel()
	E.private['channellist'][selectedChannel] = nil
	selectedChannel = nil;
	E.Options.args.dpe.args.chat.args.channelGroup = nil
	UpdateChannel()
	CH:ChannelListUpdate()
end

E.Options.args.dpe.args.chat = {
	order = 8,
	type = "group",
	name = L["Chat"],
	args = {
		header = {
			order = 1,
			type = "header",
			name = L["Chat options"],
		},
		general = {
			order = 2,
			type = "group",
			name = L["General"],
			guiInline = true,
			args = {
				chatwindowfade = {
					order = 1,
					type = "toggle",
					name = L["Chat Fade"],
					desc = L["Enable/disable the text fading in the chat window."],
					get = function(info) return E.db.dpe.chat.fade end,
					set = function(info, value) E.db.dpe.chat.fade = value; CH:FadeUpdate() end, --StaticPopup_Show("CONFIG_RL") end,
				},
				editboxhistory = {
					order = 2,
					type = "range",
					name = L["Chat Editbox History"],
					desc = L["Amount of messages to save. Set to 0 to disable."],
					min = 0, max = 20, step = 1,
					get = function(info) return E.db.chat.editboxhistory end,
					set = function(info, value)	E.db.chat.editboxhistory = value; end,
				},
			},
		},
		warning = {
			order = 3,
			type = "group",
			name = L["Name Highlight"],
			guiInline = true,
			args = {
				info = {
					order = 1,
					type = "description",
					name = L["TOON_DESC"],
				},
				enable = {
					order = 2,
					type = "toggle",
					name = L["Enable"],
					get = function(info) return E.db.dpe.chat.namehighlight end,
					set = function(info, value) E.db.dpe.chat.namehighlight = value; end
				},
				soundenable = {
					order = 3,
					type = "toggle",
					name = L["Enable sound"],
					desc = L["Play sound when your name is mentioned in chat."],
					disabled = function() return not E.db.dpe.chat.namehighlight end,
					get = function(info) return E.db.dpe.chat.sound end,
					set = function(info, value) E.db.dpe.chat.sound = value; end
				},
				sound = {
					type = "select", dialogControl = 'LSM30_Sound',
					order = 4,
					name = L["Sound"],
					desc = L["Sound that will play when your name is mentioned in chat."],
					disabled = function() return not E.db.dpe.chat.sound or not E.db.dpe.chat.namehighlight end,
					values = AceGUIWidgetLSMlists.sound,
					get = function(info) return E.db.dpe.chat.warningsound end,
					set = function(info, value) E.db.dpe.chat.warningsound = value; end		
				},
				addName = {
					type = 'input',
					order = 5,
					name = L['Add Name'],
					desc = L["Add a name different from your current character's to be looked for"],
					get = function(info) return "" end,
					set = function(info, value) 
						E.Options.args.dpe.args.chat.args.nameGroup = nil
						E.private['namelist'][value] = {};	
						E.private['namelist'][value].enable = true
						UpdateName()
						CH:NamesListUpdate()
					end,
				},
				selectName = {
					order = 7,
					type = 'select',
					name = L['Names list'],
					get = function(info) return selectedName end,
					set = function(info, value) selectedName = value; UpdateName(true) end,							
					values = function()
						names = {}
						for name in pairs(E.private.namelist) do
							names[name] = name
						end
						return names
					end,
				},
				warning = {
					order = 10,
					type = "group",
					name = L["Channels"],
					guiInline = true,
					args = {
						addChannel = {
							type = 'input',
							order = 5,
							name = L['Add channel'],
							--desc = L["Add a name different from your current character's to be looked for"],
							get = function(info) return "" end,
							set = function(info, value) 
								E.Options.args.dpe.args.chat.args.channelGroup = nil
								E.private['channellist'][value] = {};	
								E.private['channellist'][value].enable = true
								UpdateName()
								CH:ChannelListUpdate()
							end,
						},
						selectChannel = {
							order = 7,
							type = 'select',
							name = L['Channels list'],
							get = function(info) return selectedChannel end,
							set = function(info, value) selectedChannel = value; UpdateChannel(true) end,							
							values = function()
								channels = {}
								for channel in pairs(E.private.channellist) do
									channels[channel] = channel
								end
								return channels
							end,
						},
					},
				},
			},
		},
	},
}
