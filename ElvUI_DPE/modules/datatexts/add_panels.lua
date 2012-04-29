local E, L, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local LO = E:GetModule('Layout');

--Defaults
P['datatexts'] = {
	['panels'] = {
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
		['Bottom_Panel'] = 'System',
		['Top_Center'] = 'Version',
	},
}

--Added function to create new panels
LO.InitializeDPE = LO.Initialize
function LO:Initialize()
	LO.InitializeDPE(self)
	LO:CreateDataPanels()
end


-- New panels
function LO:CreateDataPanels()
	--bottom right
	local bottom_bar = CreateFrame('Frame', "Bottom_Right", E.UIParent)
	bottom_bar:SetTemplate('Default', true)
	bottom_bar:SetFrameStrata('LOW')
	bottom_bar:Point("BOTTOM", E.UIParent, "BOTTOM", 305, 0); 
	bottom_bar:SetScript('OnShow', function(self) 
		self:Size(420, 20);
	end)
	E:GetModule('DataTexts'):RegisterPanel(Bottom_Right, 3, 'ANCHOR_BOTTOM', 0, -4)
	bottom_bar:Hide()
	
	--bottom left
	local top_bar = CreateFrame('Frame', 'Bottom_Left', E.UIParent)
	top_bar:SetTemplate('Default', true)
	top_bar:SetFrameStrata('LOW')
	top_bar:Point("BOTTOM", E.UIParent, "BOTTOM", -305, 0); 
	top_bar:SetScript('OnShow', function(self) 
		self:Size(420, 20);
	end)
	E:GetModule('DataTexts'):RegisterPanel(Bottom_Left, 3, 'ANCHOR_BOTTOM', 0, -4)
	top_bar:Hide()
	
	--bottom center
	local map = CreateFrame('Frame', 'Bottom_Panel', E.UIParent)
	map:SetTemplate('Default', true)
	map:SetFrameStrata('LOW')
	map:Point("BOTTOM", E.UIParent, "BOTTOM", 0, 0); 
	map:SetScript('OnShow', function(self) 
		self:Size(188, 20)
	end)
	E:GetModule('DataTexts'):RegisterPanel(Bottom_Panel, 1, 'ANCHOR_BOTTOM', 0, -4)
	map:Hide()
	
	--the most left top panel
	local top_left_bar = CreateFrame('Frame', "Top_Left", E.UIParent)
	top_left_bar:SetTemplate('Default', true)
	top_left_bar:SetFrameStrata('LOW')
	top_left_bar:SetScript('OnShow', function(self) 
		self:Point("TOPLEFT", E.UIParent, "TOPLEFT", 0, 0); 
		self:Size(E.UIParent:GetWidth()/5, 20);
	end)
	E:GetModule('DataTexts'):RegisterPanel(Top_Left, 3, 'ANCHOR_BOTTOM', 0, -4)
	top_left_bar:Hide()
	
	--the most right top panel
	local top_right_bar = CreateFrame('Frame', "Top_Right", E.UIParent)
	top_right_bar:SetTemplate('Default', true)
	top_right_bar:SetFrameStrata('LOW')
	top_right_bar:SetScript('OnShow', function(self) 
		self:Point("TOPRIGHT", E.UIParent, "TOPRIGHT", 0, 0); 
		self:Size(E.UIParent:GetWidth()/5, 20);
	end)
	E:GetModule('DataTexts'):RegisterPanel(Top_Right, 3, 'ANCHOR_BOTTOM', 0, -4)
	top_right_bar:Hide()
	
	--top right
	local top_center_right_bar = CreateFrame('Frame', "Top_Center_Right", E.UIParent)
	top_center_right_bar:SetTemplate('Default', true)
	top_center_right_bar:SetFrameStrata('LOW')
	top_center_right_bar:SetScript('OnShow', function(self) 
		self:Point("TOPRIGHT", Top_Right, "TOPLEFT", -1, 0); 
		self:Size(E.UIParent:GetWidth()/5, 20);
	end)
	E:GetModule('DataTexts'):RegisterPanel(Top_Center_Right, 3, 'ANCHOR_BOTTOM', 0, -4)
	top_center_right_bar:Hide()
	
	--top left
	local top_center_left_bar = CreateFrame('Frame', "Top_Center_Left", E.UIParent)
	top_center_left_bar:SetTemplate('Default', true)
	top_center_left_bar:SetFrameStrata('LOW')
	top_center_left_bar:SetScript('OnShow', function(self) 
		self:Point("TOPLEFT", Top_Left, "TOPRIGHT", 1, 0); 
		self:Size(E.UIParent:GetWidth()/5, 20);
	end)
	E:GetModule('DataTexts'):RegisterPanel(Top_Center_Left, 3, 'ANCHOR_BOTTOM', 0, -4)
	top_center_left_bar:Hide()
	
	--top center
	local top_center_bar = CreateFrame('Frame', "Top_Center", E.UIParent)
	top_center_bar:SetTemplate('Default', true)
	top_center_bar:SetFrameStrata('LOW')
	top_center_bar:SetScript('OnShow', function(self) 
		self:Point("TOP", E.UIParent, "TOP", 0, 0); 
		self:Size((E.UIParent:GetWidth()/5) - 4, 20);
	end)
	E:GetModule('DataTexts'):RegisterPanel(Top_Center, 1, 'ANCHOR_BOTTOM', 0, -4)
	top_center_bar:Hide()
end

--Showing panels
function ExtraDataBarSetup()
Bottom_Left:Show()
Bottom_Right:Show()
Bottom_Panel:Show()
Top_Left:Show()
Top_Right:Show()
Top_Center_Right:Show()
Top_Center_Left:Show()
Top_Center:Show()
end

--Renew panels after loading screens
function LO:PLAYER_ENTERING_WORLD(...)
ExtraDataBarSetup()
self:UnregisterEvent("PLAYER_ENTERING_WORLD");
end
LO:RegisterEvent('PLAYER_ENTERING_WORLD')