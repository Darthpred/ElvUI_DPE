local E, L, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB

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
				xprepinfo = {
					order = 1,
					type = "toggle",
					name = L["Xp-Rep Mod"],
					desc = L['Show XP-Rep Info on bars'],
					get = function(info) return E.db.skins.xprepinfo end,
					set = function(info, value) E.db.skins.xprepinfo = value; StaticPopup_Show("CONFIG_RL") end
				},	
				pvpautorelease = {
					order = 2,
					type = "toggle",
					name = L["PvP Autorelease"],
					desc = L['Automatically release body when killed inside a battleground.'],
					get = function(info) return E.db.general.pvpautorelease end,
					set = function(info, value) E.db.general.pvpautorelease = value; StaticPopup_Show("CONFIG_RL") end
				},
			},
		},
	},
}

if E.myclass == "DRUID" then
E.Options.args.dpe.args.druid = {
	order = 1,
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
					set = function(info, value) E.db.general.bpenable = value; StaticPopup_Show("CONFIG_RL") end
				},
			},
		},
	},
}
end

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
					set = function(info, value) E.db.general.necrostrike = value; end
				},
			},
		},
	},
}
end

E.Options.args.dpe.args.credits = {
	order = 5,
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
			name = L['ELVUI_DPE_CREDITS']..'\n\n\n'..L['Submodules:']..'\n\n'..L['ELVUI_DPE_CODERS']..'\n\n'..L['Other support:']..'\n\n\n'..L['ELVUI_DPE_MISC'],
		},
	},
}