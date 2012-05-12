local E, L, V, P, G =  unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local CH = E:GetModule('Chat')

E.Options.args.dpe.args.chat = {
	order = 300,
	type = "group",
	name = L["Chat"],
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
			order = 1,
			type = "range",
			name = L["Chat Editbox History"],
			desc = L["Amount of messages to save. Set to 0 to disable."],
			min = 0, max = 20, step = 1,
			get = function(info) return E.db.chat.editboxhistory end,
			set = function(info, value)	E.db.chat.editboxhistory = value; end,
		},
	},
}