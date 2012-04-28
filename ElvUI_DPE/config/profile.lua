local E, L, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB

--Core
--[[P['general'] = {
	['pvpautorelease'] = true,
};]]

P['dpe'] = {
	['xprepinfo'] = true,
}

--Datatexts
P['datatexts'] = {
	['panels'] = {
		['LeftChatDataPanel'] = {
			['left'] = 'Armor',
			['middle'] = 'Durability',
			['right'] = 'Avoidance',
		},
		['RightChatDataPanel'] = {
			['left'] = 'System',
			['middle'] = 'Time',	
			['right'] = 'Gold',
		},
		['Bottom_Right'] = {
		['left'] = 'Spell/Heal Power',
		['middle'] = 'Haste',
		['right'] = 'Crit Chance',
		},
		['Bottom_Left'] = {
		['left'] = 'Bags',
		['middle'] = 'Gold',
		['right'] = 'Armor',
		},	
		['Top_Left'] = {
		['left'] = 'Swatter',
		['middle'] = 'Skada',
		['right'] = 'MrtWoo',
		},	
		['Top_Right'] = {
		['left'] = '',
		['middle'] = '',
		['right'] = '',
		},	
		['Top_Center_Left'] = {
		['left'] = 'Altoholic',
		['middle'] = 'TellMeWhen',
		['right'] = 'AtlasLoot',
		},
		['Top_Center_Right'] = {
		['left'] = 'Notes',
		['middle'] = 'DBM-LDB',
		['right'] = 'WIM',
		},
		['LeftMiniPanel'] = 'Time',
		['RightMiniPanel'] = 'Guild',
		['Bottom_Panel'] = 'System',
		['Top_Center'] = 'Version',
	},
}