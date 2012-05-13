﻿local E, L, V, P, G =  unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local UF = E:GetModule('UnitFrames')
local AB = E:GetModule('ActionBars')
local CH = E:GetModule('Chat')

--Main options group
E.Options.args.dpe = {
	type = "group",
    name = L["Additional options"],
    order = 50,
   	args = {
		header = {
			order = 1,
			type = "header",
			name = L["Darth Predator's edit of ElvUI"],
		},
		info = {
			order = 2,
			type = "description",
			name = L['DPE_DESC'],
		},
		general = {
			order = 3,
			type = "group",
			name = L["General"],
			guiInline = true,
			args = {
				lfrshow = {
					order = 1,
					type = "toggle",
					name = L['LFR Lockdown'],
					desc = L["Show/Hide LFR lockdown info in time datatext's tooltip."],
					get = function(info) return E.db.datatexts.lfrshow end,
					set = function(info, value) E.db.datatexts.lfrshow = value; end
				},
				aurasize = {
					order = 3,
					type = "range",
					name = L['Aura Size'],
					desc = L['Sets size of auras. This setting is character based.'],
					min = 20, max = 50, step = 1,
					get = function(info) return E.private.dpe.auras.size end,
					set = function(info, value) E.private.dpe.auras.size = value; StaticPopup_Show("PRIVATE_RL") end,
				},
				petautocast = {
					order = 5,
					type = "toggle",
					name = L["Pet autocast corners"],
					desc = L['Show/hide tringles in corners of autocastable buttons.'],
					get = function(info) return E.db.dpe.petbar.autocast end,
					set = function(info, value) E.db.dpe.petbar.autocast = value; AB:UpdatePet() end
				},
			},
		},
		marks = {
			order = 4,
			type = "group",
			name = L["Marks"],
			guiInline = true,
			args = {
				enabled = {
					order = 1,
					type = "toggle",
					name = L["Enable"],
					desc = L["Show/Hide raid marks."],
					get = function(info) return E.db.dpe.marks.enabled end,
					set = function(info, value) E.db.dpe.marks.enabled = value; RM:UpdateVisibility() end
				},
				size = {
					order = 2,
					type = "range",
					name = L['Size'],
					desc = L['Sets size of buttons'],
					min = 15, max = 30, step = 1,
					get = function(info) return E.db.dpe.marks.size end,
					set = function(info, value) E.db.dpe.marks.size = value; RM:FrameButtonsGrowth(); RM:FrameButtonsSize() end,
				},
				growth = {
					order = 3,
					type = "select",
					name = L["Direction"],
					desc = L['Change the direction of buttons growth from "skull" mark'],
					get = function(info) return E.db.dpe.marks.growth end,
					set = function(info, value) E.db.dpe.marks.growth = value; RM:FrameButtonsGrowth() end,
					values = {
						['RIGHT'] = L["Right"],
						['LEFT'] = L["Left"],
						['UP'] = L["Up"],
						['DOWN'] = L["Down"],
					},
				},
			},
		},
	},
}

--Credits
E.Options.args.dpe.args.credits = {
	order = 200,
	type = 'group',
	name = L["Credits"],
	args = {
		creditheader = {
			order = 1,
			type = "header",
			name = L["Credits"],
		},
		credits = {
			order = 2,
			type = "description",
			name = L['ELVUI_DPE_CREDITS']..'\n\n\n'..L['Submodules and coding:']..'\n\n'..L['ELVUI_DPE_CODERS']..'\n\n\n'..L['Other support:']..'\n\n'..L['ELVUI_DPE_MISC'],
		},
	},
}