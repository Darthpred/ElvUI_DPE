﻿local E, L, V, P, G =  unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local RM = E:GetModule('RaidMarks')
local UF = E:GetModule('UnitFrames')
local M = E:GetModule('Misc')
local BG = E:GetModule('BackGrounds')
local DTP = E:GetModule('DTPanels')
local RU = E:GetModule('RaidUtility')
local UB = E:GetModule('UIButtons')
local MB = E:GetModule('Microbar')
local AB = E:GetModule('ActionBars')

local positionValues = {
	TOPLEFT = 'TOPLEFT',
	LEFT = 'LEFT',
	BOTTOMLEFT = 'BOTTOMLEFT',
	RIGHT = 'RIGHT',
	TOPRIGHT = 'TOPRIGHT',
	BOTTOMRIGHT = 'BOTTOMRIGHT',
	CENTER = 'CENTER',
	TOP = 'TOP',
	BOTTOM = 'BOTTOM',
};

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
				pvpautorelease = {
					order = 2,
					type = "toggle",
					name = L["PvP Auto Release"],
					desc = L['Automatically release body when killed inside a battleground.'],
					get = function(info) return E.db.dpe.pvpautorelease end,
					set = function(info, value) E.db.dpe.pvpautorelease = value; end
				},
				aurasize = {
					order = 3,
					type = "range",
					name = L['Aura Size'],
					desc = L['Sets size of auras.\n|cffFF0000This is global setting and will affect all your profiles.|r'],
					min = 20, max = 50, step = 1,
					get = function(info) return E.global.dpe.auras.size end,
					set = function(info, value) E.global.dpe.auras.size = value; StaticPopup_Show("GLOBAL_RL") end,
				},
				skadaback = {
					order = 4,
					type = "toggle",
					name = L["Skada Backdrop"],
					desc = L['Show/hide Skada backdrop.'],
					get = function(info) return E.global.dpe.skadaback end,
					set = function(info, value) E.global.dpe.skadaback = value; StaticPopup_Show("GLOBAL_RL") end
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
		indicators = {
			order = 4,
			type = "group",
			name = L["Player Frame Indicators"],
			guiInline = true,
			args = {
				pvpmouse = {
					order = 1,
					type = "toggle",
					name = L["PvP text on mouse over"],
					desc = L['Show PvP text on mouse over player frame.'],
					get = function(info) return E.db.dpe.pvp.mouse end,
					set = function(info, value) E.db.dpe.pvp.mouse = value; end,
				},
				pvp = {
					order = 3,
					type = "select",
					name = L["PvP Position"],
					desc = L['Set the point to show pvp text'],
					get = function(info) return E.db.dpe.pvp.pos end,
					set = function(info, value) E.db.dpe.pvp.pos = value; end,
					values = positionValues
				},
				combatico = {
					order = 4,
					type = "select",
					name = L["Combat Position"],
					desc = L['Set the point to show combat icon'],
					get = function(info) return E.db.dpe.combatico.pos end,
					set = function(info, value) E.db.dpe.combatico.pos = value; UF:Update_CombatIndicator() end,
					values = positionValues
				},
			},
		},
	},
}

--Options for Exp/Rep text
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
				get = function(info) return E.db.dpe.xprepinfo.enabled end,
				set = function(info, value) E.db.dpe.xprepinfo.enabled = value; M:UpdateExpRepBarAnchor() end
				},
				xprepdet = {
				order = 2,
				type = "toggle",
				name = L['Detailed'],
				desc = L['More XP-Rep Info. Shown only when bars are on top.'],
				get = function(info) return E.db.dpe.xprepinfo.xprepdet end,
				set = function(info, value) E.db.dpe.xprepinfo.xprepdet = value; M:UpdateExpRepBarAnchor() end
				},
			},
		},
		detailed_opt = {
			order = 3,
			type = "group",
			name = L["Detailed options"],
			guiInline = true,
			disabled = function() return not E.db.dpe.xprepinfo.xprepdet end,
			args = {			
				repreact = {
				order = 1,
				type = "toggle",
				name = L['Reaction Name'],
				desc = L['Show/Hide Reaction status on bar.'],
				get = function(info) return E.db.dpe.xprepinfo.repreact end,
				set = function(info, value) E.db.dpe.xprepinfo.repreact = value; M:UpdateExpRepBarAnchor() end
				},
				xprest = {
				order = 2,
				type = "toggle",
				name = L['Rested Value'],
				desc = L['Show/Hide Rested value.'],
				get = function(info) return E.db.dpe.xprepinfo.xprest end,
				set = function(info, value) E.db.dpe.xprepinfo.xprest = value; M:UpdateExpRepBarAnchor() end
				},
			},
		},
	},
}

--Options for additional background frames. Main group
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
			name = L["BG_DESC"]
		},
		bottom_enabled = {
			order = 3,
			type = "toggle",
			name = L["Bottom BG"],
			desc = L['Show/Hide this frame.'],
			get = function(info) return E.db.dpe.backgrounds.bottom.enabled end,
			set = function(info, value) E.db.dpe.backgrounds.bottom.enabled = value; BG:FramesVisibility() end
		},
		left_enabled = {
			order = 4,
			type = "toggle",
			name = L["Left BG"],
			desc = L['Show/Hide this frame.'],
			get = function(info) return E.db.dpe.backgrounds.left.enabled end,
			set = function(info, value) E.db.dpe.backgrounds.left.enabled = value; BG:FramesVisibility() end
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
			get = function(info) return E.db.dpe.backgrounds.right.enabled end,
			set = function(info, value) E.db.dpe.backgrounds.right.enabled = value; BG:FramesVisibility() end
		},
		action_enabled = {
			order = 7,
			type = "toggle",
			name = L["Actionbar BG"],
			desc = L['Show/Hide this frame.'],
			get = function(info) return E.db.dpe.backgrounds.action.enabled end,
			set = function(info, value) E.db.dpe.backgrounds.action.enabled = value; BG:FramesVisibility() end
		},
	}
}
--Subgroup for 1st frame. They are based on the same pattern
E.Options.args.dpe.args.backgrounds.args.bottom = {
	type = "group",
	name = L["Bottom BG"],
	order = 1,
	disabled = function() return not E.db.dpe.backgrounds.bottom.enabled end,
	args = {
		width = { --setting width (obviously)
			order = 3,
			type = "range",
			name = L['Width'],
			desc = L['Sets width of the frame'],
			min = 200, max = E.screenwidth, step = 1,
			get = function(info) return E.db.dpe.backgrounds.bottom.width end,
			set = function(info, value) E.db.dpe.backgrounds.bottom.width = value; BG:FramesSize() end,
		},
		height = {
			order = 4,
			type = "range",
			name = L['Height'],
			desc = L['Sets height of the frame'],
			min = 50, max = E.screenheight/2, step = 1,
			get = function(info) return E.db.dpe.backgrounds.bottom.height end,
			set = function(info, value) E.db.dpe.backgrounds.bottom.height = value; BG:FramesSize() end,
		},
		spacer = { --Empty slot for making sliders move to next line
			order = 5,
			type = "description",
			name = "",
		},
		--Main means of moving frames. To create actual mover for them is veeeeeeeeeeery crapy idea.
		xoffset = {
			order = 6,
			type = "range",
			name = L['X Offset'],
			desc = L['Sets X offset of the frame'],
			min = -E.screenwidth/2, max = E.screenwidth/2, step = 1,
			get = function(info) return E.db.dpe.backgrounds.bottom.xoffset end,
			set = function(info, value) E.db.dpe.backgrounds.bottom.xoffset = value; BG:FramesPositions() end,
		},
		yoffset = {
			order = 7,
			type = "range",
			name = L['Y Offset'],
			desc = L['Sets Y offset of the frame'],
			min = -21, max = E.screenheight, step = 1,
			get = function(info) return E.db.dpe.backgrounds.bottom.yoffset end,
			set = function(info, value) E.db.dpe.backgrounds.bottom.yoffset = value; BG:FramesPositions() end,
		},
		--Setting custom texture for those who like it
		texture = {
			order = 8,
			type = 'input',
			width = 'full',
			name = L["Texture"],
			desc = L["Set texture to use in this frame. Requirements are the same as for the chat textures."],
			get = function(info) return E.db.dpe.backgrounds.bottom.texture end,
			set = function(info, value) 
				E.db.dpe.backgrounds.bottom.texture = value
				E:UpdateMedia()
				BG:UpdateTex()
			end,
		},
	},
}
--Subgroup for 2nd frame
E.Options.args.dpe.args.backgrounds.args.left = {
	order = 2,
	type = "group",
	name = L["Left BG"],
	disabled = function() return not E.db.dpe.backgrounds.left.enabled end,
	args = {
		width = {
			order = 3,
			type = "range",
			name = L['Width'],
			desc = L['Sets width of the frame'],
			min = 150, max = E.screenwidth, step = 1,
			get = function(info) return E.db.dpe.backgrounds.left.width end,
			set = function(info, value) E.db.dpe.backgrounds.left.width = value; BG:FramesSize() end,
		},
		height = {
			order = 4,
			type = "range",
			name = L['Height'],
			desc = L['Sets height of the frame'],
			min = 50, max = E.screenheight/2, step = 1,
			get = function(info) return E.db.dpe.backgrounds.left.height end,
			set = function(info, value) E.db.dpe.backgrounds.left.height = value; BG:FramesSize() end,
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
			get = function(info) return E.db.dpe.backgrounds.left.xoffset end,
			set = function(info, value) E.db.dpe.backgrounds.left.xoffset = value; BG:FramesPositions() end,
		},
		yoffset = {
			order = 7,
			type = "range",
			name = L['Y Offset'],
			desc = L['Sets Y offset of the frame'],
			min = -21, max = E.screenheight, step = 1,
			get = function(info) return E.db.dpe.backgrounds.left.yoffset end,
			set = function(info, value) E.db.dpe.backgrounds.left.yoffset = value; BG:FramesPositions() end,
		},
		texture = {
			order = 8,
			type = 'input',
			width = 'full',
			name = L["Texture"],
			desc = L["Set texture to use in this frame. Requirements are the same as for the chat textures."],
			get = function(info) return E.db.dpe.backgrounds.left.texture end,
			set = function(info, value) 
				E.db.dpe.backgrounds.left.texture = value
				E:UpdateMedia()
				BG:UpdateTex()
			end,
		},
	},
}
--Subgroup for 3rd frame
E.Options.args.dpe.args.backgrounds.args.right = {
	order = 2,
	type = "group",
	name = L["Right BG"],
	disabled = function() return not E.db.dpe.backgrounds.right.enabled end,
	args = {
		width = {
			order = 3,
			type = "range",
			name = L['Width'],
			desc = L['Sets width of the frame'],
			min = 150, max = E.screenwidth, step = 1,
			get = function(info) return E.db.dpe.backgrounds.right.width end,
			set = function(info, value) E.db.dpe.backgrounds.right.width = value; BG:FramesSize() end,
		},
		height = {
			order = 4,
			type = "range",
			name = L['Height'],
			desc = L['Sets height of the frame'],
			min = 50, max = E.screenheight/2, step = 1,
			get = function(info) return E.db.dpe.backgrounds.right.height end,
			set = function(info, value) E.db.dpe.backgrounds.right.height = value; BG:FramesSize() end,
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
			get = function(info) return E.db.dpe.backgrounds.right.xoffset end,
			set = function(info, value) E.db.dpe.backgrounds.right.xoffset = value; BG:FramesPositions() end,
		},
		yoffset = {
			order = 7,
			type = "range",
			name = L['Y Offset'],
			desc = L['Sets Y offset of the frame'],
			min = -21, max = E.screenheight, step = 1,
			get = function(info) return E.db.dpe.backgrounds.right.yoffset end,
			set = function(info, value) E.db.dpe.backgrounds.right.yoffset = value; BG:FramesPositions() end,
		},
		texture = {
			order = 8,
			type = 'input',
			width = 'full',
			name = L["Texture"],
			desc = L["Set texture to use in this frame. Requirements are the same as for the chat textures."],
			get = function(info) return E.db.dpe.backgrounds.right.texture end,
			set = function(info, value) 
				E.db.dpe.backgrounds.right.texture = value
				E:UpdateMedia()
				BG:UpdateTex()
			end,
		},
	},
}
--Subgroup for 4th frame
E.Options.args.dpe.args.backgrounds.args.action = {
	order = 4,
	type = "group",
	name = L["Actionbar BG"],
	disabled = function() return not E.db.dpe.backgrounds.action.enabled end,
	args = {
		width = {
			order = 3,
			type = "range",
			name = L['Width'],
			desc = L['Sets width of the frame'],
			min = 200, max = E.screenwidth, step = 1,
			get = function(info) return E.db.dpe.backgrounds.action.width end,
			set = function(info, value) E.db.dpe.backgrounds.action.width = value; BG:FramesSize() end,
		},
		height = {
			order = 4,
			type = "range",
			name = L['Height'],
			desc = L['Sets height of the frame'],
			min = 50, max = E.screenheight/2, step = 1,
			get = function(info) return E.db.dpe.backgrounds.action.height end,
			set = function(info, value) E.db.dpe.backgrounds.action.height = value; BG:FramesSize() end,
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
			get = function(info) return E.db.dpe.backgrounds.action.xoffset end,
			set = function(info, value) E.db.dpe.backgrounds.action.xoffset = value; BG:FramesPositions() end,
		},
		yoffset = {
			order = 7,
			type = "range",
			name = L['Y Offset'],
			desc = L['Sets Y offset of the frame'],
			min = -21, max = E.screenheight, step = 1,
			get = function(info) return E.db.dpe.backgrounds.action.yoffset end,
			set = function(info, value) E.db.dpe.backgrounds.action.yoffset = value; BG:FramesPositions() end,
		},
		texture = {
			order = 8,
			type = 'input',
			width = 'full',
			name = L["Texture"],
			desc = L["Set texture to use in this frame. Requirements are the same as for the chat textures."],
			get = function(info) return E.db.dpe.backgrounds.action.texture end,
			set = function(info, value) 
				E.db.dpe.backgrounds.action.texture = value
				E:UpdateMedia()
				BG:UpdateTex()
			end,
		},
	},
}

--Datatext panels
E.Options.args.dpe.args.datatext = {
	type = "group",
	name = L["Datatext panels"],
	order = 3,
	--childGroups = "select",
	args = {
		header = {
			order = 1,
			type = "header",
			name = L["Additional Datatext Panels"],
		},
		intro = {
			order = 2,
			type = "description",
			name = L["DP_DESC"]
		},
		top_left = {
			order = 3,
			type = "group",
			name = L["DP_1"],
			guiInline = true,
			args = {
				enabled = {
					order = 1,
					type = "toggle",
					name = L["Enable"],
					desc = L['Show/Hide this panel.'],
					get = function(info) return E.db.dpe.datatext.dp1.enabled end,
					set = function(info, value) E.db.dpe.datatext.dp1.enabled = value; DTP:ExtraDataBarSetup() end
				},
				width = {
					order = 2,
					type = "range",
					name = L['Width'],
					desc = L['Sets size of this panel'],
					disabled = function() return not E.db.dpe.datatext.dp1.enabled end,
					min = 100, max = E.screenwidth/2, step = 1,
					get = function(info) return E.db.dpe.datatext.dp1.width end,
					set = function(info, value) E.db.dpe.datatext.dp1.width = value; DTP:Resize() end,
				},
			},
		},
		top_center_left = {
			order = 4,
			type = "group",
			name = L["DP_2"],
			guiInline = true,
			args = {
				enabled = {
					order = 1,
					type = "toggle",
					name = L["Enable"],
					desc = L['Show/Hide this panel.'],
					get = function(info) return E.db.dpe.datatext.dp2.enabled end,
					set = function(info, value) E.db.dpe.datatext.dp2.enabled = value; DTP:ExtraDataBarSetup() end
				},
				width = {
					order = 2,
					type = "range",
					name = L['Width'],
					desc = L['Sets size of this panel'],
					disabled = function() return not E.db.dpe.datatext.dp2.enabled end,
					min = 100, max = E.screenwidth/2, step = 1,
					get = function(info) return E.db.dpe.datatext.dp2.width end,
					set = function(info, value) E.db.dpe.datatext.dp2.width = value; DTP:Resize() end,
				},
			},
		},
		top = {
			order = 5,
			type = "group",
			name = L["Top_Center"],
			guiInline = true,
			args = {
				enabled = {
					order = 1,
					type = "toggle",
					name = L["Enable"],
					desc = L['Show/Hide this panel.'],
					disabled = true,
					get = function(info) return E.db.dpe.datatext.top.enabled end,
					set = function(info, value) E.db.dpe.datatext.top.enabled = value; end
				},
				width = {
					order = 2,
					type = "range",
					name = L['Width'],
					desc = L['Sets size of this panel'],
					min = 100, max = E.screenwidth/2, step = 1,
					get = function(info) return E.db.dpe.datatext.top.width end,
					set = function(info, value) E.db.dpe.datatext.top.width = value; DTP:Resize() end,
				},
			},
		},
		top_center_right = {
			order = 6,
			type = "group",
			name = L["DP_3"],
			guiInline = true,
			args = {
				enabled = {
					order = 1,
					type = "toggle",
					name = L["Enable"],
					desc = L['Show/Hide this panel.'],
					get = function(info) return E.db.dpe.datatext.dp3.enabled end,
					set = function(info, value) E.db.dpe.datatext.dp3.enabled = value; DTP:ExtraDataBarSetup() end
				},
				width = {
					order = 2,
					type = "range",
					name = L['Width'],
					desc = L['Sets size of this panel'],
					disabled = function() return not E.db.dpe.datatext.dp3.enabled end,
					min = 100, max = E.screenwidth/2, step = 1,
					get = function(info) return E.db.dpe.datatext.dp3.width end,
					set = function(info, value) E.db.dpe.datatext.dp3.width = value; DTP:Resize() end,
				},
			},
		},
		top_right = {
			order = 7,
			type = "group",
			name = L["DP_4"],
			guiInline = true,
			args = {
				enabled = {
					order = 1,
					type = "toggle",
					name = L["Enable"],
					desc = L['Show/Hide this panel.'],
					get = function(info) return E.db.dpe.datatext.dp4.enabled end,
					set = function(info, value) E.db.dpe.datatext.dp4.enabled = value; DTP:ExtraDataBarSetup() end
				},
				width = {
					order = 2,
					type = "range",
					name = L['Width'],
					desc = L['Sets size of this panel'],
					disabled = function() return not E.db.dpe.datatext.dp4.enabled end,
					min = 100, max = E.screenwidth/2, step = 1,
					get = function(info) return E.db.dpe.datatext.dp4.width end,
					set = function(info, value) E.db.dpe.datatext.dp4.width = value; DTP:Resize() end,
				},
			},
		},
		bottom_left = {
			order = 8,
			type = "group",
			name = L["DP_5"],
			guiInline = true,
			args = {
				enabled = {
					order = 1,
					type = "toggle",
					name = L["Enable"],
					desc = L['Show/Hide this panel.'],
					get = function(info) return E.db.dpe.datatext.dp5.enabled end,
					set = function(info, value) E.db.dpe.datatext.dp5.enabled = value; DTP:ExtraDataBarSetup() end
				},
				width = {
					order = 2,
					type = "range",
					name = L['Width'],
					desc = L['Sets size of this panel'],
					disabled = function() return not E.db.dpe.datatext.dp5.enabled end,
					min = 100, max = E.screenwidth/2, step = 1,
					get = function(info) return E.db.dpe.datatext.dp5.width end,
					set = function(info, value) E.db.dpe.datatext.dp5.width = value; DTP:Resize() end,
				},
			},
		},
		bottom = {
			order = 9,
			type = "group",
			name = L["Bottom_Panel"],
			guiInline = true,
			args = {
				enabled = {
					order = 1,
					type = "toggle",
					name = L["Enable"],
					desc = L['Show/Hide this panel.'],
					get = function(info) return E.db.dpe.datatext.bottom.enabled end,
					set = function(info, value) E.db.dpe.datatext.bottom.enabled = value; DTP:ExtraDataBarSetup() end
				},
				width = {
					order = 2,
					type = "range",
					name = L['Width'],
					desc = L['Sets size of this panel'],
					disabled = function() return not E.db.dpe.datatext.bottom.enabled end,
					min = 100, max = E.screenwidth/2, step = 1,
					get = function(info) return E.db.dpe.datatext.bottom.width end,
					set = function(info, value) E.db.dpe.datatext.bottom.width = value; DTP:Resize() end,
				},
			},
		},
		bottom_right = {
			order = 10,
			type = "group",
			name = L["DP_6"],
			guiInline = true,
			args = {
				enabled = {
					order = 1,
					type = "toggle",
					name = L["Enable"],
					desc = L['Show/Hide this panel.'],
					get = function(info) return E.db.dpe.datatext.dp6.enabled end,
					set = function(info, value) E.db.dpe.datatext.dp6.enabled = value; DTP:ExtraDataBarSetup() end
				},
				width = {
					order = 2,
					type = "range",
					name = L['Width'],
					desc = L['Sets size of this panel'],
					disabled = function() return not E.db.dpe.datatext.dp6.enabled end,
					min = 100, max = E.screenwidth/2, step = 1,
					get = function(info) return E.db.dpe.datatext.dp6.width end,
					set = function(info, value) E.db.dpe.datatext.dp6.width = value; DTP:Resize() end,
				},
			},
		},
		chat_left = {
			order = 11,
			type = "group",
			name = L["Left Chat"],
			guiInline = true,
			args = {
				enabled = {
					order = 1,
					type = "toggle",
					name = L["Enable"],
					desc = L['Show/Hide this panel.'],
					disabled = true,
					get = function(info) return E.db.dpe.datatext.chatleft.enabled end,
					set = function(info, value) E.db.dpe.datatext.chatleft.enabled = value; end
				},
				width = {
					order = 2,
					type = "range",
					name = L['Width'],
					desc = L['Sets size of this panel'],
					disabled = function() return not E.db.dpe.datatext.chatleft.enabled end,
					min = 100, max = E.screenwidth/2, step = 1,
					get = function(info) return E.db.dpe.datatext.chatleft.width end,
					set = function(info, value) E.db.dpe.datatext.chatleft.width = value; DTP:ChatResize() end,
				},
			},
		},
		chat_right = {
			order = 12,
			type = "group",
			name = L["Right Chat"],
			guiInline = true,
			args = {
				enabled = {
					order = 1,
					type = "toggle",
					name = L["Enable"],
					desc = L['Show/Hide this panel.'],
					disabled = true,
					get = function(info) return E.db.dpe.datatext.chatright.enabled end,
					set = function(info, value) E.db.dpe.datatext.chatright.enabled = value; end
				},
				width = {
					order = 2,
					type = "range",
					name = L['Width'],
					desc = L['Sets size of this panel'],
					disabled = function() return not E.db.dpe.datatext.chatright.enabled end,
					min = 100, max = E.screenwidth/2, step = 1,
					get = function(info) return E.db.dpe.datatext.chatright.width end,
					set = function(info, value) E.db.dpe.datatext.chatright.width = value; DTP:ChatResize() end,
				},
			},
		},
	},
}

--Raid Utility
E.Options.args.dpe.args.raidutil = {
	order = 5,
	type = 'group',
	name = L["Raid Utility"],
	args = {
		raidutilheader = {
			order = 1,
			type = "header",
			name = L["Raid Utility coordinates"],
		},
		raidutilinf = {
			order = 2,
			type = "description",
			name = L["RU_DESC"],
		},
		xpos = {
			order = 3,
			type = "range",
			name = L['X Position'],
			desc = L['Sets X position of Raid Utility button.'],
			min = 0, max = E.screenwidth, step = 1,
			get = function(info) return E.db.dpe.raidutil.xpos end,
			set = function(info, value) E.db.dpe.raidutil.xpos = value; RU:MoveButton() end,
		},
		ypos = {
			order = 4,
			type = "range",
			name = L['Y Position'],
			desc = L['Sets Y position of Raid Utility button.'],
			min = 0, max = E.screenheight, step = 1,
			get = function(info) return E.db.dpe.raidutil.ypos end,
			set = function(info, value) E.db.dpe.raidutil.ypos = value; RU:MoveButton() end,
		},
	},
}

--UI Buttons
E.Options.args.dpe.args.uibuttons = {
	type = "group",
	name = L["UI Buttons"],
	order = 6,
	args = {
		header = {
			order = 1,
			type = "header",
			name = L["Additional menu with useful buttons"],
		},
		enabled = {
			order = 3,
			type = "toggle",
			name = L["Enable"],
			desc = L["Show/Hide UI buttons."],
			get = function(info) return E.db.dpe.uibuttons.enable end,
			set = function(info, value) E.db.dpe.uibuttons.enable = value; UB:Start() end
		},
		options = {
			type = "group",
			name = L["General"],
			order = 4,
			guiInline = true,
			disabled = function() return not E.db.dpe.uibuttons.enable end,
			args = {
				size = {
					order = 1,
					type = "range",
					name = L['Size'],
					desc = L['Sets size of buttons'],
					min = 12, max = 25, step = 1,
					get = function(info) return E.db.dpe.uibuttons.size end,
					set = function(info, value) E.db.dpe.uibuttons.size = value; UB:FrameSize() end,
				},
				mouse = {
					order = 2,
					type = "toggle",
					name = L["Mouse over"],
					desc = L["Show on mouse over."],
					get = function(info) return E.db.dpe.uibuttons.mouse end,
					set = function(info, value) E.db.dpe.uibuttons.mouse = value; end
				},
				position = {
					order = 10,
					name = L["Buttons position"],
					desc = L["Layout for UI buttons."],
					type = "select",
					values = {
						["uib_hor"] = L['Horizontal'],
						["uib_vert"] = L['Vertical'],
					},
					get = function(info) return E.db.dpe.uibuttons.position end,
					set = function(info, value) E.db.dpe.uibuttons.position = value; UB:Positioning(); UB:MoverSize() end,
				},
			},
		},
	},
}

--Microbar
E.Options.args.dpe.args.microbar = {
	type = "group",
    name = L["Microbar"],
    get = function(info) return E.db.microbar[ info[#info] ] end,
    set = function(info, value) E.db.microbar[ info[#info] ] = value; end, 
	order = 50,
   	args = {
		intro = {
			order = 1,
			type = "description",
			name = L['Module for adding micromenu to ElvUI.'],
		},
		enable = {
				order = 2,
				type = 'toggle',
				name = L['Enable'],
				set = function(info, value) E.db.microbar.enable = value; MB:MenuShow(); end,
		},
		visibility = {
			order = 3,
			type = "group",
			name = L["Visibility"],
			guiInline = true,
			disabled = function() return not E.db.microbar.enable end,
			args = {
				mouse = {
					order = 1,
					type = "toggle",
					name = L['On Mouse Over'],
					desc = L['Hide microbar unless you mouse over it.'],
					set = function(info, value) E.db.microbar.mouse = value; end,
				},
				backdrop = {
					order = 2,
					type = "toggle",
					name = L['Backdrop'],
					desc = L['Show backdrop for micromenu'],
					set = function(info, value) E.db.microbar.backdrop = value; MB:Backdrop(); end,
				},
				combat = {
					order = 3,
					type = "toggle",
					name = L['Hide in Combat'],
					desc = L['Hide Microbar in combat.'],
					set = function(info, value) E.db.microbar.combat = value; end,
				},
				alpha = {
					order = 4,
					type = "range",
					name = L['Set Alpha'],
					desc = L['Sets alpha of the microbar'],
					min = 0.2, max = 1, step = 0.01,
					set = function(info, value) E.db.microbar.alpha = value; end,
				},
				scale = {
					order = 5,
					type = "range",
					name = L['Set Scale'],
					desc = L['Sets Scale of the microbar'],
					isPercent = true,
					min = 0.3, max = 2, step = 0.01,
					set = function(info, value) E.db.microbar.scale = value; MB:Scale(); MB:MicroMoverSize(); end,
				},
			}
		},
		positioning = {
			order = 4,
			type = "group",
			name = L["Positioning"],
			guiInline = true,
			disabled = function() return not E.db.microbar.enable end,
			args = {
				layout = {
					order = 1,
					type = "select",
					name = L["Microbar Layout"],
					desc = L["Change the positioning of buttons on Microbar."],
					set = function(info, value) E.db.microbar.layout = value; MB:MicroButtonsPositioning(); MB:MicroFrameSize(); end,
					values = {
						['Micro_Hor'] = L["Horizontal"],
						['Micro_Ver'] = L["Vertical"],
						['Micro_62'] = L["2 rows"],
						['Micro_43'] = L["3 rows"],
						['Micro_34'] = L["4 rows"],
						['Micro_26'] = L["6 rows"],
					},
				},
				xoffset = {
					order = 2,
					type = "range",
					name = L["X Offset"],
					desc = L["Sets X offset for microbar buttons"],
					min = 0, max = 10, step = 1,
					set = function(info, value) E.db.microbar.xoffset = value; MB:MicroButtonsPositioning(); MB:MicroFrameSize(); MB:MicroMoverSize(); end,
				},
				yoffset = {
					order = 3,
					type = "range",
					name = L["Y Offset"],
					desc = L["Sets Y offset for microbar buttons"],
					min = 0, max = 10, step = 1,
					set = function(info, value) E.db.microbar.yoffset = value; MB:MicroButtonsPositioning(); MB:MicroFrameSize(); MB:MicroMoverSize(); end,
				},
			},
		},	
	},
}

--DBM Font size
if IsAddOnLoaded("DBM-Core") then
E.Options.args.dpe.args.dbm = {
	type = "group",
	name = "DBM",
	order = 6,
	guiInline = true,
	args = {
		fontsize = {
			order = 2,
			type = "range",
			name = L['Font Size'],
			desc = L["Sets size on DMB bars"],
			min = 8, max = 14, step = 1,
			get = function(info) return E.global.dpe.dbm.size end,
			set = function(info, value) E.global.dpe.dbm.size = value; StaticPopup_Show("CONFIG_RL") end,
		},
	},
}
end

--Movable Classbar
if E.myclass == "DEATHKNIGHT" or E.myclass == "DRUID" or E.myclass == "PALADIN" or E.myclass == "SHAMAN" or E.myclass == "WARLOCK" then
E.Options.args.dpe.args.classbar = {
	type = "group",
	name = L['Classbar'],
	order = 7,
	guiInline = true,
	args = {
		enable = {
			order = 2,
			type = 'toggle',
			name = L['Enable offset'],
			desc = L["Enable classbar movement"],
			get = function(info) return E.db.classoffset.enable end,
			set = function(info, value) E.db.classoffset.enable = value; UF:ClassbarMove() end, --UF:CreateAndUpdateUF('player') end,
		},
		xoffset = {
			order = 2,
			type = "range",
			name = L['X Offset'],
			desc = L['Sets X offset of the frame'],
			disabled = function() return not E.db.classoffset.enable end,
			min = -E.screenwidth, max = E.screenwidth, step = 1,
			get = function(info) return E.db.classoffset.xoffset end,
			set = function(info, value) E.db.classoffset.xoffset = value; UF:ClassbarMove() end, --UF:CreateAndUpdateUF('player') end,
		},
		yoffset = {
			order = 3,
			type = "range",
			name = L['Y Offset'],
			desc = L['Sets Y offset of the frame'],
			disabled = function() return not E.db.dpe.classbar.enable end,
			min = -E.screenheight, max = E.screenheight, step = 1,
			get = function(info) return E.db.dpe.classbar.yoffset end,
			set = function(info, value) E.db.dpe.classbar.yoffset = value; UF:CreateAndUpdateUF('player') end,
		},
	},
}
end
		
--Adds a new option group is character is a druid.
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
				bpenable = { --Frame with sol/lun energy count
					order = 1,
					type = "toggle",
					name = L["Balance Power Frame"],
					desc = L["Show/hide the frame with exact number of your Solar/Lunar energy."],
					get = function(info) return E.db.general.bpenable end,
					set = function(info, value) E.db.general.bpenable = value; E:GetModule('DPE'):BPUpdate() end
				},
			},
		},
	},
}
end

--Adds a new option group is character is a dk. However i couldn't make intended option work.
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
					set = function(info, value) E.db.general.necrostrike = value; E:GetModule('DPE'):NSLoad() end
				},
			},
		},
	},
}
end
]]

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