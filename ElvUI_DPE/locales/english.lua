-- English localization file for enUS and enGB.
local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L 
if UnitName('player') ~= 'Elv' then
	L = AceLocale:NewLocale("ElvUI", "enUS", true, true);
else
	L = AceLocale:NewLocale("ElvUI", "enUS", true);
end

if not L then return; end

L["Additional options"] = "Additional options"
L["Darth Predator's edit of ElvUI"] = "Darth Predator's edit of ElvUI"
L['DPE_DESC'] = [=[This plugin changes ElvUI according to my personal taste. For maximum and comfortable usage 1920x1080 resolution is recommended.

Plugin doesn't change any files in ElvUI folder so disabling or deleting it wouldn't affect core UI.
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
L["PvP Auto Release by Repooc"] = "PvP Auto Release by Repooc"
L['Automatically release body when killed inside a battleground.'] = "Automatically release body when killed inside a battleground."

--Exp/Rep Text
L["Xp-Rep Mod"] = "Exp/Rep Text"
L["XP-Rep Mod by Benik"] = "Exp/Rep Text and Skin mod by Benik"
L['Show XP-Rep Info on bars'] = "Show exp/rep text"

--Balance Power Frame 
L["Balance Power"] = "Balance Power"
L["Balance Power Frame"] = "Balance Power Frame"
L["A frame with exact number of your Solar/Lunar energy."] = "A frame with exact number of your Solar/Lunar energy."