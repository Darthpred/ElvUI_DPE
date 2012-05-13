local E, L, V, P, G =  unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local UF = E:GetModule('UnitFrames')

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

E.Options.args.dpe.args.unitframes = {
	type = "group",
	name = L["UnitFrames"],
	order = 6,
	args = {
		header = {
			order = 1,
			type = "header",
			name = L["Additional menu with useful buttons"],
		},
		info = {
			order = 2,
			type = "description",
			name = L["Options for customizing unit frames. Please don't change these setting when ElvUI's testing frames for bosses and arena teams are shown. That will make them invisible."],
		},
		health = {
			type = "group",
			name = L["Health Values"],
			order = 3,
			guiInline = true,
			args = {
				normal = {
					order = 1,
					type = "toggle",
					name = L["Full value"],
					desc = L["Enabling this will show exact hp numbers on player, focus, focus target, target of target, party, boss, arena and raid frames."],
					get = function(info) return E.db.dpe.unitframes.normal.health end,
					set = function(info, value) E.db.dpe.unitframes.normal.health = value; UF:Update_AllFrames() end
				},
				reverse = {
					order = 2,
					type = "toggle",
					name = L["Target full value"],
					desc = L["Enabling this will show exact hp numbers on target frame."],
					get = function(info) return E.db.dpe.unitframes.reverse.health end,
					set = function(info, value) E.db.dpe.unitframes.reverse.health = value; UF:Update_AllFrames() end
				},
			},
		},
		resource = {
			type = "group",
			name = L["Power Values"],
			order = 4,
			guiInline = true,
			args = {
				normal = {
					order = 1,
					type = "toggle",
					name = L["Normal Frames"],
					desc = L["Enabling this will show exact power numbers on target of target, focus and focus target frames."],
					get = function(info) return E.db.dpe.unitframes.normal.mana end,
					set = function(info, value) E.db.dpe.unitframes.normal.mana = value; UF:Update_AllFrames() end
				},
				reverse = {
					order = 2,
					type = "toggle",
					name = L["Reversed Frames"],
					desc = L["Enabling this will show exact power numbers on player, boss, arena, party and raid frames."],
					get = function(info) return E.db.dpe.unitframes.reverse.mana end,
					set = function(info, value) E.db.dpe.unitframes.reverse.mana = value; UF:Update_AllFrames() end
				},
			},
		},
		indicators = {
			order = 5,
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
