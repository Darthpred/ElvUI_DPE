local E, L, V, P, DF, G =  unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB

--Datatexts
P.datatexts.panels.Top_Center = 'Version'
P.datatexts.panels.Bottom_Panel = 'System'
P.datatexts.panels.DP_1 = {
		left = 'Swatter',
		middle = 'Skada',
		right = 'MrtWoo',
}
P.datatexts.panels.DP_2 = {
		left = 'Altoholic',
		middle = 'TellMeWhen',
		right = 'AtlasLoot',
}
P.datatexts.panels.DP_3 = {
		left = 'Notes',
		middle = 'DBM-LDB',
		right = 'WIM',
}
P.datatexts.panels.DP_4 = {
		left = '',
		middle = '',
		right = '',
}
P.datatexts.panels.DP_5 = {
		left = 'Bags',
		middle = 'Gold',
		right = 'Armor',
}
P.datatexts.panels.DP_6 = {
		left = 'Spell/Heal Power',
		middle = 'Haste',
		right = 'Crit Chance',
}

P['dpe'] = {
	--Background frames
	['backgrounds'] = {
		['bottom'] = {
			['enabled'] = false,
			['trans'] = false,
			['texture'] = "",
			['width'] = E.screenwidth/4 + 32,
			['height'] = E.screenheight/6 - 13,
			['xoffset'] = 0,
			['yoffset'] = 0,
		},
		['left'] = {
			['enabled'] = false,
			['trans'] = false,
			['texture'] = "",
			['width'] = E.screenwidth/10 - 4,
			['height'] = E.screenheight/5 + 11,
			['xoffset'] = 0,
			['yoffset'] = 0,
		},
		['right'] = {
			['enabled'] = false,
			['trans'] = false,
			['texture'] = "",
			['width'] = E.screenwidth/10 - 4,
			['height'] = E.screenheight/5 + 11,
			['xoffset'] = 0,
			['yoffset'] = 0,
		},
		['action'] = {
			['enabled'] = false,
			['trans'] = false,
			['texture'] = "",
			['width'] = E.screenwidth/4 + 32,
			['height'] = E.screenheight/20 + 5,
			['xoffset'] = 0,
			['yoffset'] = 0,
		},
	},
	
	--Raid marks
	['marks'] = {
		['enabled'] = true,
		['growth'] = "RIGHT",
		['size'] = 18,
	},
	
	--Auto release
	['pvpautorelease'] = true,
	
	--Datatexts panels
	['datatext'] = {
		['dp1'] = {
			['enabled'] = false,
			['width'] = E.screenwidth/5,
		},	
		['dp2'] = {
			['enabled'] = false,
			['width'] = E.screenwidth/5,
		},
		['top'] = {
			['enabled'] = true,
			['width'] = E.screenwidth/5 - 4,
		},
		['dp3'] = {
			['enabled'] = false,
			['width'] = E.screenwidth/5,
		},
		['dp4'] = {
			['enabled'] = false,
			['width'] = E.screenwidth/5,
		},	
		['dp5'] = {
			['enabled'] = false,
			['width'] = E.screenwidth/4 - 60,
		},	
		['bottom'] = {
			['enabled'] = false,
			['width'] = E.screenwidth/10 - 4,
		},
		['dp6'] = {
			['enabled'] = false,
			['width'] = E.screenwidth/4 - 60,
		},
		['chatleft'] = {
			['enabled'] = true,
			['width'] = E.db.general.panelWidth,
		},
		['chatright'] = {
			['enabled'] = true,
			['width'] = E.db.general.panelWidth,
		},
	},
	
	--Raid Utility
	['raidutil'] = {
		['xpos'] = E.screenwidth/3,
		['ypos'] = E.screenheight - 30,
	},
	
	--Exp/Rep info
	['xprepinfo'] = {
		['enabled'] = true,
		['xprepdet'] = false,
		['repreact'] = false,
		['xprest'] = false,
	},
	
	--Skada Backdrop
	['skadaback'] = true,
	
	--PvP indicator
	['pvp'] = {
		['pos'] = 'BOTTOMLEFT',
		['mouse'] = true,
	},
	
	--Combat Icon
	['combatico'] = {
		['pos'] = 'TOPRIGHT',
	},
}


