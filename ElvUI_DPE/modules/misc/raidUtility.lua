local E, L, V, P, G =  unpack(ElvUI); -- Import Functions/Constants, Config, Locales
local RU = E:GetModule('RaidUtility');

E.RaidUtility = RU

--Moved RU down cause of top datatext panels
function RU:MoveButton()
	ShowButton:ClearAllPoints()
	ShowButton:Point("CENTER", E.UIParent, "BOTTOMLEFT", E.db.dpe.raidutil.xpos, E.db.dpe.raidutil.ypos)
end

ShowButton:RegisterForDrag("") --Unregister any buttons for dragging. 