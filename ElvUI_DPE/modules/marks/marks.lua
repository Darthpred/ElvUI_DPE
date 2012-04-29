local E, L, P, G = unpack(ElvUI); --Engine

local mark_menu = CreateFrame("Frame", "Mark_Menu", E.UIParent)
local m1 = CreateFrame("Button", "M1", Mark_Menu, "SecureActionButtonTemplate")
local m2 = CreateFrame("Button", "M2", Mark_Menu, "SecureActionButtonTemplate")
local m3 = CreateFrame("Button", "M3", Mark_Menu, "SecureActionButtonTemplate")
local m4 = CreateFrame("Button", "M4", Mark_Menu, "SecureActionButtonTemplate")
local m5 = CreateFrame("Button", "M5", Mark_Menu, "SecureActionButtonTemplate")
local m6 = CreateFrame("Button", "M6", Mark_Menu, "SecureActionButtonTemplate")
local m7 = CreateFrame("Button", "M7", Mark_Menu, "SecureActionButtonTemplate")
local m8 = CreateFrame("Button", "M8", Mark_Menu, "SecureActionButtonTemplate")

local Msize = 18 --Size of mark buttons. Changing this would change the size of all elements

--Main frame
do
mark_menu:Point('CENTER', E.UIParent, 'CENTER', 0, 0) --Default positon
mark_menu:SetWidth(8 * Msize + 11)
mark_menu:SetHeight(Msize + 4)
mark_menu:SetFrameStrata('LOW');
mark_menu:CreateBackdrop('Default');
mark_menu.backdrop:SetAllPoints();
mark_menu:SetScript('OnShow', function(self)
	E:CreateMover(self, "MarkMover", "Raid Marks")
end)
mark_menu:Hide()
end

--Mark menu
do
--Skull
m1:Point('LEFT', Mark_Menu, 'LEFT', 2, 0) 
m1:Size(Msize)
m1:CreateBackdrop('Default');
m1.backdrop:SetAllPoints();
m1:SetAttribute("type", "macro");
m1:SetAttribute("macrotext",  '/script SetRaidTarget("target",8)');
--texture
m1.tex = m1:CreateTexture(nil, 'OVERLAY')
m1.tex:Point('TOPLEFT', m1, 'TOPLEFT', 2, -2)
m1.tex:Point('BOTTOMRIGHT', m1, 'BOTTOMRIGHT', -2, 2)
m1.tex:SetTexture("INTERFACE/TARGETINGFRAME/UI-RaidTargetingIcon_8")

--Cross
m2:Point('LEFT', m1, 'RIGHT', 1, 0) 
m2:Size(Msize)
m2:CreateBackdrop('Default');
m2.backdrop:SetAllPoints();
m2:SetAttribute("type", "macro");
m2:SetAttribute("macrotext",  '/script SetRaidTarget("target",7)');
--texture
m2.tex = m2:CreateTexture(nil, 'OVERLAY')
m2.tex:Point('TOPLEFT', m2, 'TOPLEFT', 2, -2)
m2.tex:Point('BOTTOMRIGHT', m2, 'BOTTOMRIGHT', -2, 2)
m2.tex:SetTexture("INTERFACE/TARGETINGFRAME/UI-RaidTargetingIcon_7")

--Square
m3:Point('LEFT', m2, 'RIGHT', 1, 0) 
m3:Size(Msize)
m3:CreateBackdrop('Default');
m3.backdrop:SetAllPoints();
m3:SetAttribute("type", "macro");
m3:SetAttribute("macrotext",  '/script SetRaidTarget("target",6)');
--texture
m3.tex = m3:CreateTexture(nil, 'OVERLAY')
m3.tex:Point('TOPLEFT', m3, 'TOPLEFT', 2, -2)
m3.tex:Point('BOTTOMRIGHT', m3, 'BOTTOMRIGHT', -2, 2)
m3.tex:SetTexture("INTERFACE/TARGETINGFRAME/UI-RaidTargetingIcon_6")

--Moon
m4:Point('LEFT', m3, 'RIGHT', 1, 0) 
m4:Size(Msize)
m4:CreateBackdrop('Default');
m4.backdrop:SetAllPoints();
m4:SetAttribute("type", "macro");
m4:SetAttribute("macrotext",  '/script SetRaidTarget("target",5)');
--texture
m4.tex = m4:CreateTexture(nil, 'OVERLAY')
m4.tex:Point('TOPLEFT', m4, 'TOPLEFT', 2, -2)
m4.tex:Point('BOTTOMRIGHT', m4, 'BOTTOMRIGHT', -2, 2)
m4.tex:SetTexture("INTERFACE/TARGETINGFRAME/UI-RaidTargetingIcon_5")

--Triangle
m5:Point('LEFT', m4, 'RIGHT', 1, 0) 
m5:Size(Msize)
m5:CreateBackdrop('Default');
m5.backdrop:SetAllPoints();
m5:SetAttribute("type", "macro");
m5:SetAttribute("macrotext",  '/script SetRaidTarget("target",4)');
--texture
m5.tex = m5:CreateTexture(nil, 'OVERLAY')
m5.tex:Point('TOPLEFT', m5, 'TOPLEFT', 2, -2)
m5.tex:Point('BOTTOMRIGHT', m5, 'BOTTOMRIGHT', -3, 2)
m5.tex:SetTexture("INTERFACE/TARGETINGFRAME/UI-RaidTargetingIcon_4")

--Diamond
m6:Point('LEFT', m5, 'RIGHT', 1, 0) 
m6:Size(Msize)
m6:CreateBackdrop('Default');
m6.backdrop:SetAllPoints();
m6:SetAttribute("type", "macro");
m6:SetAttribute("macrotext",  '/script SetRaidTarget("target",3)');
--texture
m6.tex = m6:CreateTexture(nil, 'OVERLAY')
m6.tex:Point('TOPLEFT', m6, 'TOPLEFT', 2, -2)
m6.tex:Point('BOTTOMRIGHT', m6, 'BOTTOMRIGHT', -2, 2)
m6.tex:SetTexture("INTERFACE/TARGETINGFRAME/UI-RaidTargetingIcon_3")

--Circle
m7:Point('LEFT', m6, 'RIGHT', 1, 0) 
m7:Size(Msize)
m7:CreateBackdrop('Default');
m7.backdrop:SetAllPoints();
m7:SetAttribute("type", "macro");
m7:SetAttribute("macrotext",  '/script SetRaidTarget("target",2)');
--texture
m7.tex = m7:CreateTexture(nil, 'OVERLAY')
m7.tex:Point('TOPLEFT', m7, 'TOPLEFT', 2, -2)
m7.tex:Point('BOTTOMRIGHT', m7, 'BOTTOMRIGHT', -2, 2)
m7.tex:SetTexture("INTERFACE/TARGETINGFRAME/UI-RaidTargetingIcon_2")

--Star
m8:Point('LEFT', m7, 'RIGHT', 1, 0) 
m8:Size(Msize)
m8:CreateBackdrop('Default');
m8.backdrop:SetAllPoints();
m8:SetAttribute("type", "macro");
m8:SetAttribute("macrotext",  '/script SetRaidTarget("target",1)');
--texture
m8.tex = m8:CreateTexture(nil, 'OVERLAY')
m8.tex:Point('TOPLEFT', m8, 'TOPLEFT', 2, -2)
m8.tex:Point('BOTTOMRIGHT', m8, 'BOTTOMRIGHT', -2, 2)
m8.tex:SetTexture("INTERFACE/TARGETINGFRAME/UI-RaidTargetingIcon_1")
end

mark_menu:SetScript("OnEvent", function(self,event,...) 
	mark_menu:Show();
end)
mark_menu:RegisterEvent("PLAYER_ENTERING_WORLD")