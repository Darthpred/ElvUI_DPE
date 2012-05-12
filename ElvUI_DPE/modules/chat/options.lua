local E, L, V, P, G =  unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local CH = E:GetModule('Chat')

E.Options.args.dpe.args.chat = {
	order = 300,
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
					name = L["Enable/Disable Chat Fade"],
					desc = L["You can enable/disable the text fading in the chat window."],
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
				enable = {
					order = 1,
					type = "toggle",
					name = L["Enable"],
					get = function(info) return E.db.dpe.chat.namehighlight end,
					set = function(info, value) E.db.dpe.chat.namehighlight = value; end
				},
				soundenable = {
					order = 2,
					type = "toggle",
					name = L["Enable sound"],
					desc = L["Play sound when your name is mentioned in chat."],
					disabled = function() return not E.db.dpe.chat.namehighlight end,
					get = function(info) return E.db.dpe.chat.sound end,
					set = function(info, value) E.db.dpe.chat.sound = value; end
				},
				sound = {
					type = "select", dialogControl = 'LSM30_Sound',
					order = 3,
					name = L["Sound"],
					desc = L["Sound that will play when your name is mentioned in chat."],
					disabled = function() return not E.db.dpe.chat.sound or not E.db.dpe.chat.namehighlight end,
					values = AceGUIWidgetLSMlists.sound,
					get = function(info) return E.db.dpe.chat.warningsound end,
					set = function(info, value) E.db.dpe.chat.warningsound = value; end		
				},
			--Block for names
			namelist = {
				order = 4,
				type = "group",
				name = L["List of additional names"],
				guiInline = true,
				disabled = function() return not E.db.dpe.chat.namehighlight end,
					args = {
						first = {
							order = 1,
							type = 'input',
							width = '60',
							name = L["Alternative Name"],
							desc = L["Set alternative name to use in warnings on par with your character name."],
							get = function(info) return E.db.dpe.chat.name1 end,
							set = function(info, value) E.db.dpe.chat.name1 = value; CH:NamesListUpdate() end,
						},
						second = {
							order = 2,
							type = 'input',
							width = '60',
							name = L["Alternative Name"],
							desc = L["Set alternative name to use in warnings on par with your character name."],
							get = function(info) return E.db.dpe.chat.name2 end,
							set = function(info, value) E.db.dpe.chat.name2 = value; CH:NamesListUpdate() end,
						},
					},
				},
			},
		},
	},
}
