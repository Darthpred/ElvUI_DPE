local E, L, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
--local DTP = E:GetModule('DTPanels');
--local DT = E:GetModule('DataTexts')


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
					name = L["PvP Autorelease"],
					desc = L['Automatically release body when killed inside a battleground.'],
					get = function(info) return E.db.dpe.pvpautorelease end,
					set = function(info, value) E.db.dpe.pvpautorelease = value; end
				},
				aurasize = {
					order = 3,
					type = "range",
					name = L['Aura Size'],
					desc = L['Sets size of auras. This is global setting and will affect all your profiles.'],
					min = 20, max = 50, step = 1,
					get = function(info) return E.global.dpe.auras.size end,
					set = function(info, value) E.global.dpe.auras.size = value; StaticPopup_Show("GLOBAL_RL") end,
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
					set = function(info, value) E.db.dpe.marks.enabled = value; E:GetModule('RaidMarks'):UpdateVisibility() end
				},
				size = {
					order = 2,
					type = "range",
					name = L['Size'],
					desc = L['Sets size of buttons'],
					min = 15, max = 30, step = 1,
					get = function(info) return E.db.dpe.marks.size end,
					set = function(info, value) E.db.dpe.marks.size = value; E:GetModule('RaidMarks'):FrameButtonsGrowth(); E:GetModule('RaidMarks'):FrameButtonsSize() end,
				},
				growth = {
					order = 3,
					type = "select",
					name = L["Direction"],
					desc = L['Change the direction of buttons growth from "skull" mark'],
					get = function(info) return E.db.dpe.marks.growth end,
					set = function(info, value) E.db.dpe.marks.growth = value; E:GetModule('RaidMarks'):FrameButtonsGrowth() end,
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
				get = function(info) return E.db.skins.xprepinfo end,
				set = function(info, value) E.db.skins.xprepinfo = value; E:GetModule('Misc'):UpdateExpRepBarAnchor() end
				},
				xprepdet = {
				order = 2,
				type = "toggle",
				name = L['Detailed'],
				desc = L['More XP-Rep Info. Shown only when bars are on top.'],
				get = function(info) return E.db.skins.xprepdet end,
				set = function(info, value) E.db.skins.xprepdet = value; E:GetModule('Misc'):UpdateExpRepBarAnchor() end
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
				set = function(info, value) E.db.skins.repreact = value; E:GetModule('Misc'):UpdateExpRepBarAnchor() end
				},
				xprest = {
				order = 2,
				type = "toggle",
				name = L['Rested Value'],
				desc = L['Show/Hide Rested value.'],
				get = function(info) return E.db.skins.xprest end,
				set = function(info, value) E.db.skins.xprest = value; E:GetModule('Misc'):UpdateExpRepBarAnchor() end
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
			name = L["Soon™ the description will appear here."]
		},
		bottom_enabled = {
			order = 3,
			type = "toggle",
			name = L["Bottom BG"],
			desc = L['Show/Hide this frame.'],
			get = function(info) return E.db.dpe.backgrounds.bottom.enabled end,
			set = function(info, value) E.db.dpe.backgrounds.bottom.enabled = value; E:GetModule('BackGrounds'):FramesVisibility() end
		},
		left_enabled = {
			order = 4,
			type = "toggle",
			name = L["Left BG"],
			desc = L['Show/Hide this frame.'],
			get = function(info) return E.db.dpe.backgrounds.left.enabled end,
			set = function(info, value) E.db.dpe.backgrounds.left.enabled = value; E:GetModule('BackGrounds'):FramesVisibility() end
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
			set = function(info, value) E.db.dpe.backgrounds.right.enabled = value; E:GetModule('BackGrounds'):FramesVisibility() end
		},
		action_enabled = {
			order = 7,
			type = "toggle",
			name = L["Actionbar BG"],
			desc = L['Show/Hide this frame.'],
			get = function(info) return E.db.dpe.backgrounds.action.enabled end,
			set = function(info, value) E.db.dpe.backgrounds.action.enabled = value; E:GetModule('BackGrounds'):FramesVisibility() end
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
			set = function(info, value) E.db.dpe.backgrounds.bottom.width = value; E:GetModule('BackGrounds'):FramesSize() end,
		},
		height = {
			order = 4,
			type = "range",
			name = L['Height'],
			desc = L['Sets height of the frame'],
			min = 50, max = E.screenheight/2, step = 1,
			get = function(info) return E.db.dpe.backgrounds.bottom.height end,
			set = function(info, value) E.db.dpe.backgrounds.bottom.height = value; E:GetModule('BackGrounds'):FramesSize() end,
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
			set = function(info, value) E.db.dpe.backgrounds.bottom.xoffset = value; E:GetModule('BackGrounds'):FramesPositions() end,
		},
		yoffset = {
			order = 7,
			type = "range",
			name = L['Y Offset'],
			desc = L['Sets Y offset of the frame'],
			min = -21, max = E.screenheight, step = 1,
			get = function(info) return E.db.dpe.backgrounds.bottom.yoffset end,
			set = function(info, value) E.db.dpe.backgrounds.bottom.yoffset = value; E:GetModule('BackGrounds'):FramesPositions() end,
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
				E:GetModule('BackGrounds'):UpdateTex()
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
			set = function(info, value) E.db.dpe.backgrounds.left.width = value; E:GetModule('BackGrounds'):FramesSize() end,
		},
		height = {
			order = 4,
			type = "range",
			name = L['Height'],
			desc = L['Sets height of the frame'],
			min = 50, max = E.screenheight/2, step = 1,
			get = function(info) return E.db.dpe.backgrounds.left.height end,
			set = function(info, value) E.db.dpe.backgrounds.left.height = value; E:GetModule('BackGrounds'):FramesSize() end,
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
			set = function(info, value) E.db.dpe.backgrounds.left.xoffset = value; E:GetModule('BackGrounds'):FramesPositions() end,
		},
		yoffset = {
			order = 7,
			type = "range",
			name = L['Y Offset'],
			desc = L['Sets Y offset of the frame'],
			min = -21, max = E.screenheight, step = 1,
			get = function(info) return E.db.dpe.backgrounds.left.yoffset end,
			set = function(info, value) E.db.dpe.backgrounds.left.yoffset = value; E:GetModule('BackGrounds'):FramesPositions() end,
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
				E:GetModule('BackGrounds'):UpdateTex()
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
			set = function(info, value) E.db.dpe.backgrounds.right.width = value; E:GetModule('BackGrounds'):FramesSize() end,
		},
		height = {
			order = 4,
			type = "range",
			name = L['Height'],
			desc = L['Sets height of the frame'],
			min = 50, max = E.screenheight/2, step = 1,
			get = function(info) return E.db.dpe.backgrounds.right.height end,
			set = function(info, value) E.db.dpe.backgrounds.right.height = value; E:GetModule('BackGrounds'):FramesSize() end,
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
			set = function(info, value) E.db.dpe.backgrounds.right.xoffset = value; E:GetModule('BackGrounds'):FramesPositions() end,
		},
		yoffset = {
			order = 7,
			type = "range",
			name = L['Y Offset'],
			desc = L['Sets Y offset of the frame'],
			min = -21, max = E.screenheight, step = 1,
			get = function(info) return E.db.dpe.backgrounds.right.yoffset end,
			set = function(info, value) E.db.dpe.backgrounds.right.yoffset = value; E:GetModule('BackGrounds'):FramesPositions() end,
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
				E:GetModule('BackGrounds'):UpdateTex()
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
			set = function(info, value) E.db.dpe.backgrounds.action.width = value; E:GetModule('BackGrounds'):FramesSize() end,
		},
		height = {
			order = 4,
			type = "range",
			name = L['Height'],
			desc = L['Sets height of the frame'],
			min = 50, max = E.screenheight/2, step = 1,
			get = function(info) return E.db.dpe.backgrounds.action.height end,
			set = function(info, value) E.db.dpe.backgrounds.action.height = value; E:GetModule('BackGrounds'):FramesSize() end,
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
			set = function(info, value) E.db.dpe.backgrounds.action.xoffset = value; E:GetModule('BackGrounds'):FramesPositions() end,
		},
		yoffset = {
			order = 7,
			type = "range",
			name = L['Y Offset'],
			desc = L['Sets Y offset of the frame'],
			min = -21, max = E.screenheight, step = 1,
			get = function(info) return E.db.dpe.backgrounds.action.yoffset end,
			set = function(info, value) E.db.dpe.backgrounds.action.yoffset = value; E:GetModule('BackGrounds'):FramesPositions() end,
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
				E:GetModule('BackGrounds'):UpdateTex()
			end,
		},
	},
}

--Datatext panels
E.Options.args.dpe.args.datatext = {
	type = "group",
	name = L["Datatext panels"],
	order = 2,
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
			name = L["Soon™ the description will appear here."]
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
					set = function(info, value) E.db.dpe.datatext.dp1.enabled = value; E:GetModule('DTPanels'):ExtraDataBarSetup() end
				},
				width = {
					order = 2,
					type = "range",
					name = L['Width'],
					desc = L['Sets size of this panel'],
					disabled = function() return not E.db.dpe.datatext.dp1.enabled end,
					min = 100, max = E.screenwidth/2, step = 1,
					get = function(info) return E.db.dpe.datatext.dp1.width end,
					set = function(info, value) E.db.dpe.datatext.dp1.width = value; E:GetModule('DTPanels'):Resize() end,
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
					set = function(info, value) E.db.dpe.datatext.dp2.enabled = value; E:GetModule('DTPanels'):ExtraDataBarSetup() end
				},
				width = {
					order = 2,
					type = "range",
					name = L['Width'],
					desc = L['Sets size of this panel'],
					disabled = function() return not E.db.dpe.datatext.dp2.enabled end,
					min = 100, max = E.screenwidth/2, step = 1,
					get = function(info) return E.db.dpe.datatext.dp2.width end,
					set = function(info, value) E.db.dpe.datatext.dp2.width = value; E:GetModule('DTPanels'):Resize() end,
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
					set = function(info, value) E.db.dpe.datatext.top.width = value; E:GetModule('DTPanels'):Resize() end,
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
					set = function(info, value) E.db.dpe.datatext.dp3.enabled = value; E:GetModule('DTPanels'):ExtraDataBarSetup() end
				},
				width = {
					order = 2,
					type = "range",
					name = L['Width'],
					desc = L['Sets size of this panel'],
					disabled = function() return not E.db.dpe.datatext.dp3.enabled end,
					min = 100, max = E.screenwidth/2, step = 1,
					get = function(info) return E.db.dpe.datatext.dp3.width end,
					set = function(info, value) E.db.dpe.datatext.dp3.width = value; E:GetModule('DTPanels'):Resize() end,
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
					set = function(info, value) E.db.dpe.datatext.dp4.enabled = value; E:GetModule('DTPanels'):ExtraDataBarSetup() end
				},
				width = {
					order = 2,
					type = "range",
					name = L['Width'],
					desc = L['Sets size of this panel'],
					disabled = function() return not E.db.dpe.datatext.dp4.enabled end,
					min = 100, max = E.screenwidth/2, step = 1,
					get = function(info) return E.db.dpe.datatext.dp4.width end,
					set = function(info, value) E.db.dpe.datatext.dp4.width = value; E:GetModule('DTPanels'):Resize() end,
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
					set = function(info, value) E.db.dpe.datatext.dp5.enabled = value; E:GetModule('DTPanels'):ExtraDataBarSetup() end
				},
				width = {
					order = 2,
					type = "range",
					name = L['Width'],
					desc = L['Sets size of this panel'],
					disabled = function() return not E.db.dpe.datatext.dp5.enabled end,
					min = 100, max = E.screenwidth/2, step = 1,
					get = function(info) return E.db.dpe.datatext.dp5.width end,
					set = function(info, value) E.db.dpe.datatext.dp5.width = value; E:GetModule('DTPanels'):Resize() end,
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
					set = function(info, value) E.db.dpe.datatext.bottom.enabled = value; E:GetModule('DTPanels'):ExtraDataBarSetup() end
				},
				width = {
					order = 2,
					type = "range",
					name = L['Width'],
					desc = L['Sets size of this panel'],
					disabled = function() return not E.db.dpe.datatext.bottom.enabled end,
					min = 100, max = E.screenwidth/2, step = 1,
					get = function(info) return E.db.dpe.datatext.bottom.width end,
					set = function(info, value) E.db.dpe.datatext.bottom.width = value; E:GetModule('DTPanels'):Resize() end,
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
					set = function(info, value) E.db.dpe.datatext.dp6.enabled = value; E:GetModule('DTPanels'):ExtraDataBarSetup() end
				},
				width = {
					order = 2,
					type = "range",
					name = L['Width'],
					desc = L['Sets size of this panel'],
					disabled = function() return not E.db.dpe.datatext.dp6.enabled end,
					min = 100, max = E.screenwidth/2, step = 1,
					get = function(info) return E.db.dpe.datatext.dp6.width end,
					set = function(info, value) E.db.dpe.datatext.dp6.width = value; E:GetModule('DTPanels'):Resize() end,
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
					set = function(info, value) E.db.dpe.datatext.chatleft.width = value; E:GetModule('DTPanels'):ChatResize() end,
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
					set = function(info, value) E.db.dpe.datatext.chatright.width = value; E:GetModule('DTPanels'):ChatResize() end,
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
			set = function(info, value) E.db.dpe.raidutil.xpos = value; E:GetModule('RaidUtility'):ButtonCoordinates() end,
		},
		ypos = {
			order = 4,
			type = "range",
			name = L['Y Position'],
			desc = L['Sets Y position of Raid Utility button.'],
			min = 0, max = E.screenwidth, step = 1,
			get = function(info) return E.db.dpe.raidutil.ypos end,
			set = function(info, value) E.db.dpe.raidutil.ypos = value; E:GetModule('RaidUtility'):ButtonCoordinates() end,
		},
	},
}

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