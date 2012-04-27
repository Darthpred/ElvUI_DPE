local E, L, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local A = E:GetModule('Auras');

function A:StyleBuffs(buttonName, index, debuff)
	local buff = _G[buttonName..index]
	local icon = _G[buttonName..index.."Icon"]
	local border = _G[buttonName..index.."Border"]
	local duration = _G[buttonName..index.."Duration"]
	local count = _G[buttonName..index.."Count"]
	if icon and not buff.backdrop then
		icon:SetTexCoord(unpack(E.TexCoords))
		icon:Point("TOPLEFT", buff, 2, -2)
		icon:Point("BOTTOMRIGHT", buff, -2, 2)
		
		buff:Size(24)
				
		duration:ClearAllPoints()
		duration:Point("BOTTOM", 0, -13)
		duration:FontTemplate(nil, nil, 'OUTLINE')
		
		count:ClearAllPoints()
		count:Point("TOPLEFT", 1, -2)
		count:FontTemplate(nil, nil, 'OUTLINE')
		
		buff:CreateBackdrop('Default')
		buff.backdrop:SetAllPoints()
		
		local highlight = buff:CreateTexture(nil, "HIGHLIGHT")
		highlight:SetTexture(1,1,1,0.45)
		highlight:SetAllPoints(icon)
	end
	if border then border:Hide() end
end