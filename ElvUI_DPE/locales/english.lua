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
L["DP_1"] = "DT Panel 1"
L["DP_2"] = "DT Panel 2"
L["Top_Center"] = "Top Panel"
L["DP_3"] = "DT Panel 3"
L["DP_4"] = "DT Panel 4"
L["DP_5"] = "DT Panel 5"
L["Bottom_Panel"] = "Bottom Panel"
L["DP_6"] = "DT Panel 6"

L["LFR Dragon Soul"] = "LFR Dragon Soul"
L["LFR Lockdown"] = "LFR Lockdown"
L["Show/Hide LFR lockdown info in time datatext's tooltip."] = "Show/Hide LFR lockdown info in time datatext's tooltip."

L["DPE_AUTHOR_INFO"] = "Darth Predator's edit (Дартпредатор@Свежеватель Душ(Soulflyer) - EU)"
L["DPE_CONTACTS"] = [=[Bug reports, suggestions and other stuff accepted via:
- In-game mail
- Private Massage on TukUI.org to Darth Predator
- Private Massage on Curse to Darth_Predator
- Shadowmage.ru]=]

--PvP auto release
L["PvP Autorelease"] = "PvP Autorelease"
L['Automatically release body when killed inside a battleground.'] = "Automatically release body when killed inside a battleground."

--Exp/Rep Text
L["Xp-Rep Text"] = "Exp/Rep Text"
L["XP-Rep Text mod by Benik"] = "XP-Rep Text mod by Benik."
L['Show/Hide XP-Rep Info.'] = "Show/Hide XP-Rep Info"
L['Detailed'] = "Detailed"
L['More XP-Rep Info. Shown only when bars are on top.'] = "More XP-Rep Info. Shown only when bars are on top."
L["Detailed options"] = "Detailed options"
L['Reaction Name'] = "Reaction Name"
L['Show/Hide Reaction status on bar.'] = "Show/Hide Reaction status on bar."
L['Rested Value'] = "Rested Value"
L['Show/Hide Rested value.'] = "Show/Hide Rested value."

--Raid Utility
L["Raid Utility"] = "Raid Utility"
L["Raid Utility coordinates"] = "Raid Utility coordinates"
L["RU_DESC"] = [=[This config group allows you to freely move your Raid Utility button starting position.
Unfortunately movement of this buttom with mouse will produse errors after clicking on the moved button.
Those errors are not critical but may cause perfomance issues in case of long and active RU usage.]=]
L['X Position'] = "X Position"
L['Sets X position of Raid Utility button.'] = "Sets X position of Raid Utility button."
L['Y Position'] = "Y Position"
L['Sets Y position of Raid Utility button.'] = "Sets Y position of Raid Utility button."

--Raid Marks
L["Marks"] = "Marks"
L["Show/Hide raid marks."] = "Show/Hide raid marks."
L['Sets size of buttons'] = "Sets size of buttons"
L["Direction"] = "Direction"
L['Change the direction of buttons growth from "skull" mark'] = 'Change the direction of buttons growth from "skull" mark'

--Balance Power Frame 
L["Druid"] = "Druid"
L["Druid spesific options"] = "Druid spesific options"
L["Balance Power Frame"] = "Balance Power Frame"
L["Show/hide the frame with exact number of your Solar/Lunar energy."] = "Show/hide the frame with exact number of your Solar/Lunar energy."