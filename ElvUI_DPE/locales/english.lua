-- English localization file for enUS and enGB.
local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L 
if UnitName('player') ~= 'Elv' then
	L = AceLocale:NewLocale("ElvUI", "enUS", true, true);
else
	L = AceLocale:NewLocale("ElvUI", "enUS", true);
end

if not L then return; end

--Main config
L["Additional options"] = "Additional options"
L["Darth Predator's edit of ElvUI"] = "Darth Predator's edit of ElvUI"
L['DPE_DESC'] = [=[This plugin changes ElvUI according to my personal taste. For maximum and comfortable usage 1920x1080 resolution is recommended.

Plugin doesn't change any files in ElvUI folder so disabling or deleting it wouldn't affect core UI.
]=]

--Credits
L['ELVUI_DPE_CREDITS'] = "I would like to point out the following people for helping me creating this addon with testing, coding and other stuff."
L['Submodules and coding:'] = "Submodules and coding:"
L['ELVUI_DPE_CODERS'] = [=[Benik - core of exp/rep bars' text
Catok - Test UI feature
Repooc - core of auto release feature
Tukz - helping with oUF
Pvtschlag - Necrotic Strike oUF plugin
Blazeflack - helping hooking, modules and profiles
Camealion - teaching me the art of skining
]=]
L['Other support:'] = "Other support:"
L['ELVUI_DPE_MISC'] = [=[BuG - brining fun to the chat while i was writing this
TheSamaKutra - some good ideas
Allaidia - moral support O_o
]=]

--Datatexts
L["Bottom_Right"] = "Bottom Right"
L["Bottom_Left"] = "Bottom Left"
L["Bottom_Panel"] = "Bottom Center"
L["Top_Center"] = "Top Center"
L["Top_Center_Left"] = "Bottom Left-Center"
L["Top_Center_Right"] = "Bottom Right-Center"
L["Top_Left"] = "Top Left"
L["Top_Right"] = "Top Right"

L["LFR Dragon Soul"] = "LFR Dragon Soul"
L["LFR Lockdown"] = "LFR Lockdown"
L["Show/Hide LFR lockdown info in time datatext's tooltip."] = "Show/Hide LFR lockdown info in time datatext's tooltip."

--PvP auto release
L["PvP Autorelease"] = "PvP Autorelease"
L['Automatically release body when killed inside a battleground.'] = "Automatically release body when killed inside a battleground."

--Exp/Rep Text
L["Xp-Rep Mod"] = "Exp/Rep Text"
L['Show XP-Rep Info on bars'] = "Show exp/rep text"

--Balance Power Frame 
L["Druid"] = "Druid"
L["Druid spesific options"] = "Druid spesific options"
L["Balance Power Frame"] = "Balance Power Frame"
L["Show/hide the frame with exact number of your Solar/Lunar energy."] = "Show/hide the frame with exact number of your Solar/Lunar energy."