local E, L, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local DPE = E:GetModule('DPE');
local M = E:GetModule('Misc');
local RM = E:GetModule('RaidMarks');
local BG = E:GetModule('BackGrounds');

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
				pvpautorelease = {
					order = 2,
					type = "toggle",
					name = L["PvP Autorelease"],
					desc = L['Automatically release body when killed inside a battleground.'],
					get = function(info) return E.db.general.pvpautorelease end,
					set = function(info, value) E.db.general.pvpautorelease = value; end
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
					get = function(info) return E.db.marks.enabled end,
					set = function(info, value) E.db.marks.enabled = value; RM:UpdateVisibility() end
				},
				size = {
					order = 2,
					type = "range",
					name = L['Size'],
					desc = L['Sets size of buttons'],
					min = 15, max = 30, step = 1,
					get = function(info) return E.db.marks.size end,
					set = function(info, value) E.db.marks.size = value; RM:FrameButtonsGrowth(); RM:FrameButtonsSize() end,
				},
				growth = {
					order = 3,
					type = "select",
					name = L["Direction"],
					desc = L['Change the direction of buttons growth from "skull" mark'],
					get = function(info) return E.db.marks.growth end,
					set = function(info, value) E.db.marks.growth = value; RM:FrameButtonsGrowth() end,
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

E.Options.args.dpe.args.exprep = {
	type = "group",
    name = L["Xp-Rep Text"],
    order = 1,
   	args = {
		xprepmodheader = {
		order = 1,
		type = "header",
		name = L["XP-Rep Text mod by Benik"],
		},
		xprep_top = {
			order = 2,
			type = "group",
			name = L["General"],
			guiInline = true,
			args = {
				xprepinfo = {
				order = 1,
				type = "toggle",
				name = L["Enable"],
				desc = L['Show/Hide XP-Rep Info.'],
				get = function(info) return E.db.skins.xprepinfo end,
				set = function(info, value) E.db.skins.xprepinfo = value; M:UpdateExpRepBarAnchor() end
				},
				xprepdet = {
				order = 2,
				type = "toggle",
				name = L['Detailed'],
				desc = L['More XP-Rep Info. Shown only when bars are on top.'],
				get = function(info) return E.db.skins.xprepdet end,
				set = function(info, value) E.db.skins.xprepdet = value; M:UpdateExpRepBarAnchor() end
				},
			},
		},
		detailed_opt = {
			order = 3,
			type = "group",
			name = L["Detailed options"],
			guiInline = true,
			disabled = function() return not E.db.skins.xprepdet end,
			args = {			
				repreact = {
				order = 1,
				type = "toggle",
				name = L['Reaction Name'],
				desc = L['Show/Hide Reaction status on bar.'],
				get = function(info) return E.db.skins.repreact end,
				set = function(info, value) E.db.skins.repreact = value; M:UpdateExpRepBarAnchor() end
				},
				xprest = {
				order = 2,
				type = "toggle",
				name = L['Rested Value'],
				desc = L['Show/Hide Rested value.'],
				get = function(info) return E.db.skins.xprest end,
				set = function(info, value) E.db.skins.xprest = value; M:UpdateExpRepBarAnchor() end
				},
			},
		},
	},
}

E.Options.args.dpe.args.backgrounds = {
	type = "group",
	name = L["Backgrounds"],
	order = 2,
	childGroups = "select",
	args = {
		header = {
			order = 1,
			type = "header",
			name = L["Additional Background Panels"],
		},
		intro = {
			order = 2,
			type = "description",
			name = L["Soon™ the description will appear here."]
		},
		bottom_enabled = {
			order = 3,
			type = "toggle",
			name = L["Bottom BG"],
			desc = L['Show/Hide this frame.'],
			get = function(info) return E.db.backgrounds.bottom.enabled end,
			set = function(info, value) E.db.backgrounds.bottom.enabled = value; BG:FramesVisibility() end
		},
		left_enabled = {
			order = 4,
			type = "toggle",
			name = L["Left BG"],
			desc = L['Show/Hide this frame.'],
			get = function(info) return E.db.backgrounds.left.enabled end,
			set = function(info, value) E.db.backgrounds.left.enabled = value; BG:FramesVisibility() end
		},
		spacer = {
			order = 5,
			type = "description",
			name = "",
		},
		right_enabled = {
			order = 6,
			type = "toggle",
			name = L["Right BG"],
			desc = L['Show/Hide this frame.'],
			get = function(info) return E.db.backgrounds.right.enabled end,
			set = function(info, value) E.db.backgrounds.right.enabled = value; BG:FramesVisibility() end
		},
		action_enabled = {
			order = 7,
			type = "toggle",
			name = L["Actionbar BG"],
			desc = L['Show/Hide this frame.'],
			get = function(info) return E.db.backgrounds.action.enabled end,
			set = function(info, value) E.db.backgrounds.action.enabled = value; BG:FramesVisibility() end
		},
	}
}

E.Options.args.dpe.args.backgrounds.args.bottom = {
	type = "group",
	name = L["Bottom BG"],
	order = 1,
	disabled = function() return not E.db.backgrounds.bottom.enabled end,
	args = {
		width = {
			order = 3,
			type = "range",
			name = L['Width'],
			desc = L['Sets width of the frame'],
			min = 200, max = E.screenwidth, step = 1,
			get = function(info) return E.db.backgrounds.bottom.width end,
			set = function(info, value) E.db.backgrounds.bottom.width = value; BG:FramesSize() end,
		},
		height = {
			order = 4,
			type = "range",
			name = L['Height'],
			desc = L['Sets height of the frame'],
			min = 50, max = E.screenheight/2, step = 1,
			get = function(info) return E.db.backgrounds.bottom.height end,
			set = function(info, value) E.db.backgrounds.bottom.height = value; BG:FramesSize() end,
		},
		spacer = {
			order = 5,
			type = "description",
			name = "",
		},
		xoffset = {
			order = 6,
			type = "range",
			name = L['X Offset'],
			desc = L['Sets X offset of the frame'],
			min = -E.screenwidth/2, max = E.screenwidth/2, step = 1,
			get = function(info) return E.db.backgrounds.bottom.xoffset end,
			set = function(info, value) E.db.backgrounds.bottom.xoffset = value; BG:FramesPositions() end,
		},
		yoffset = {
			order = 7,
			type = "range",
			name = L['Y Offset'],
			desc = L['Sets Y offset of the frame'],
			min = -21, max = E.screenheight, step = 1,
			get = function(info) return E.db.backgrounds.bottom.yoffset end,
			set = function(info, value) E.db.backgrounds.bottom.yoffset = value; BG:FramesPositions() end,
		},
		texture = {
			order = 8,
			type = 'input',
			width = 'full',
			name = L["Texture"],
			desc = L["Set texture to use in this frame. Requirements are the same as for the chat textures."],
			get = function(info) return E.db.backgrounds.bottom.texture end,
			set = function(info, value) 
				E.db.backgrounds.bottom.texture = value
				E:UpdateMedia()
				BG:UpdateTex()
			end,
		},
	},
}

E.Options.args.dpe.args.backgrounds.args.left = {
	order = 2,
	type = "group",
	name = L["Left BG"],
	disabled = function() return not E.db.backgrounds.left.enabled end,
	args = {
		width = {
			order = 3,
			type = "range",
			name = L['Width'],
			desc = L['Sets width of the frame'],
			min = 150, max = E.screenwidth, step = 1,
			get = function(info) return E.db.backgrounds.left.width end,
			set = function(info, value) E.db.backgrounds.left.width = value; BG:FramesSize() end,
		},
		height = {
			order = 4,
			type = "range",
			name = L['Height'],
			desc = L['Sets height of the frame'],
			min = 50, max = E.screenheight/2, step = 1,
			get = function(info) return E.db.backgrounds.left.height end,
			set = function(info, value) E.db.backgrounds.left.height = value; BG:FramesSize() end,
		},
		spacer = {
			order = 5,
			type = "description",
			name = "",
		},
		xoffset = {
			order = 6,
			type = "range",
			name = L['X Offset'],
			desc = L['Sets X offset of the frame'],
			min = -E.screenwidth/2, max = E.screenwidth/2, step = 1,
			get = function(info) return E.db.backgrounds.left.xoffset end,
			set = function(info, value) E.db.backgrounds.left.xoffset = value; BG:FramesPositions() end,
		},
		yoffset = {
			order = 7,
			type = "range",
			name = L['Y Offset'],
			desc = L['Sets Y offset of the frame'],
			min = -21, max = E.screenheight, step = 1,
			get = function(info) return E.db.backgrounds.left.yoffset end,
			set = function(info, value) E.db.backgrounds.left.yoffset = value; BG:FramesPositions() end,
		},
		texture = {
			order = 8,
			type = 'input',
			width = 'full',
			name = L["Texture"],
			desc = L["Set texture to use in this frame. Requirements are the same as for the chat textures."],
			get = function(info) return E.db.backgrounds.left.texture end,
			set = function(info, value) 
				E.db.backgrounds.left.texture = value
				E:UpdateMedia()
				BG:UpdateTex()
			end,
		},
	},
}

E.Options.args.dpe.args.backgrounds.args.right = {
	order = 2,
	type = "group",
	name = L["Right BG"],
	disabled = function() return not E.db.backgrounds.right.enabled end,
	args = {
		width = {
			order = 3,
			type = "range",
			name = L['Width'],
			desc = L['Sets width of the frame'],
			min = 150, max = E.screenwidth, step = 1,
			get = function(info) return E.db.backgrounds.right.width end,
			set = function(info, value) E.db.backgrounds.right.width = value; BG:FramesSize() end,
		},
		height = {
			order = 4,
			type = "range",
			name = L['Height'],
			desc = L['Sets height of the frame'],
			min = 50, max = E.screenheight/2, step = 1,
			get = function(info) return E.db.backgrounds.right.height end,
			set = function(info, value) E.db.backgrounds.right.height = value; BG:FramesSize() end,
		},
		spacer = {
			order = 5,
			type = "description",
			name = "",
		},
		xoffset = {
			order = 6,
			type = "range",
			name = L['X Offset'],
			desc = L['Sets X offset of the frame'],
			min = -E.screenwidth/2, max = E.screenwidth/2, step = 1,
			get = function(info) return E.db.backgrounds.right.xoffset end,
			set = function(info, value) E.db.backgrounds.right.xoffset = value; BG:FramesPositions() end,
		},
		yoffset = {
			order = 7,
			type = "range",
			name = L['Y Offset'],
			desc = L['Sets Y offset of the frame'],
			min = -21, max = E.screenheight, step = 1,
			get = function(info) return E.db.backgrounds.right.yoffset end,
			set = function(info, value) E.db.backgrounds.right.yoffset = value; BG:FramesPositions() end,
		},
		texture = {
			order = 8,
			type = 'input',
			width = 'full',
			name = L["Texture"],
			desc = L["Set texture to use in this frame. Requirements are the same as for the chat textures."],
			get = function(info) return E.db.backgrounds.right.texture end,
			set = function(info, value) 
				E.db.backgrounds.right.texture = value
				E:UpdateMedia()
				BG:UpdateTex()
			end,
		},
	},
}

E.Options.args.dpe.args.backgrounds.args.action = {
	order = 4,
	type = "group",
	name = L["Actionbar BG"],
	disabled = function() return not E.db.backgrounds.action.enabled end,
	args = {
		width = {
			order = 3,
			type = "range",
			name = L['Width'],
			desc = L['Sets width of the frame'],
			min = 200, max = E.screenwidth, step = 1,
			get = function(info) return E.db.backgrounds.action.width end,
			set = function(info, value) E.db.backgrounds.action.width = value; BG:FramesSize() end,
		},
		height = {
			order = 4,
			type = "range",
			name = L['Height'],
			desc = L['Sets height of the frame'],
			min = 50, max = E.screenheight/2, step = 1,
			get = function(info) return E.db.backgrounds.action.height end,
			set = function(info, value) E.db.backgrounds.action.height = value; BG:FramesSize() end,
		},
		spacer = {
			order = 5,
			type = "description",
			name = "",
		},
		xoffset = {
			order = 6,
			type = "range",
			name = L['X Offset'],
			desc = L['Sets X offset of the frame'],
			min = -E.screenwidth/2, max = E.screenwidth/2, step = 1,
			get = function(info) return E.db.backgrounds.action.xoffset end,
			set = function(info, value) E.db.backgrounds.action.xoffset = value; BG:FramesPositions() end,
		},
		yoffset = {
			order = 7,
			type = "range",
			name = L['Y Offset'],
			desc = L['Sets Y offset of the frame'],
			min = -21, max = E.screenheight, step = 1,
			get = function(info) return E.db.backgrounds.action.yoffset end,
			set = function(info, value) E.db.backgrounds.action.yoffset = value; BG:FramesPositions() end,
		},
		texture = {
			order = 8,
			type = 'input',
			width = 'full',
			name = L["Texture"],
			desc = L["Set texture to use in this frame. Requirements are the same as for the chat textures."],
			get = function(info) return E.db.backgrounds.action.texture end,
			set = function(info, value) 
				E.db.backgrounds.action.texture = value
				E:UpdateMedia()
				BG:UpdateTex()
			end,
		},
	},
}

if E.myclass == "DRUID" then
E.Options.args.dpe.args.druid = {
	order = 50,
	type = 'group',
	name = L["Druid"],
	args = {
		druidheader = {
			order = 1,
			type = "header",
			name = L["Druid spesific options"],
		},
		general = {
			order = 2,
			type = "group",
			name = '',
			guiInline = true,
			args = {
				bpenable = {
					order = 1,
					type = "toggle",
					name = L["Balance Power Frame"],
					desc = L["Show/hide the frame with exact number of your Solar/Lunar energy."],
					get = function(info) return E.db.general.bpenable end,
					set = function(info, value) E.db.general.bpenable = value; DPE:BPUpdate() end
				},
			},
		},
	},
}
end

--[[
if E.myclass == "DEATHKNIGHT" then
E.Options.args.dpe.args.deathknight = {
	order = 1,
	type = 'group',
	name = L["Death Knight"],
	args = {
		dkheader = {
			order = 1,
			type = "header",
			name = L["Death Knight spesific options"],
		},
		general = {
			order = 2,
			type = "group",
			name = '',
			guiInline = true,
			args = {
				necrostrike = {
					order = 1,
					type = "toggle",
					name = L["Necrotic Strike"],
					desc = L["Show/hide Necrotic Strike absorb overlay."],
					get = function(info) return E.db.general.necrostrike end,
					set = function(info, value) E.db.general.necrostrike = value; DPE:NSLoad() end
				},
			},
		},
	},
}
end
]]

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