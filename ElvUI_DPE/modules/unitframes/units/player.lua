local E, L, V, P, G =  unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local UF = E:GetModule('UnitFrames');
local LSM = LibStub("LibSharedMedia-3.0");

local classbar_xoffset = 0
local classbar_yoffset = 0
local classbar_enable = false

--Classbar offset
P['classoffset'] = {
	['enable'] = false,
	['xoffset'] = 0,
	['yoffset'] = 0,
}

local abs = math.abs
local _, ns = ...
local ElvUF = ns.oUF

--Function to move damn combat indicator to topright part of the frame. Maybe i should create an option to make it placeble everywhere.
function UF:Update_CombatIndicator()
	local CombatText = ElvUF_Player.Combat
	
	local x, y = self:GetPositionOffset(E.db.dpe.combatico.pos)
	CombatText:ClearAllPoints()
	CombatText:Point(E.db.dpe.combatico.pos, ElvUF_Player.Health, E.db.dpe.combatico.pos, x, x)
end

UF.Update_PlayerFrameDPE = UF.Update_PlayerFrame
function UF:Update_PlayerFrame(frame, db)
	UF:Update_PlayerFrameDPE(frame, db)
	
	local power = frame.Power
			
	--Text
	if db.power.text then
		power.value:Show()
		
		local x, y = self:GetPositionOffset(db.power.position)
		power.value:ClearAllPoints()
		power.value:Point(db.power.position, frame.Power, db.power.position, x, y)			
	else
		power.value:Hide()
	end
	
	frame:UpdateAllElements()
end

function UF:ClassbarMove(frame, db)
	local BORDER = E:Scale(2)
	local SPACING = E:Scale(1)
	local UNIT_WIDTH = E.db.unitframe.units.player.width
	local UNIT_HEIGHT = E.db.unitframe.units.player.height
	
	local USE_POWERBAR = E.db.unitframe.units.player.power.enable
	local USE_MINI_POWERBAR = E.db.unitframe.units.player.power.width ~= 'fill' and USE_POWERBAR
	local USE_POWERBAR_OFFSET = E.db.unitframe.units.player.power.offset ~= 0 and USE_POWERBAR
	local POWERBAR_OFFSET = E.db.unitframe.units.player.power.offset
	local POWERBAR_HEIGHT = E.db.unitframe.units.player.power.height
	local POWERBAR_WIDTH = E.db.unitframe.units.player.width - (BORDER*2)
	
	local USE_CLASSBAR = E.db.unitframe.units.player.classbar.enable and CAN_HAVE_CLASSBAR
	local USE_MINI_CLASSBAR = E.db.unitframe.units.player.classbar.fill == "spaced" and USE_CLASSBAR
	local CLASSBAR_HEIGHT = E.db.unitframe.units.player.classbar.height
	local CLASSBAR_WIDTH = E.db.unitframe.units.player.width - (BORDER*2)
	
	local USE_PORTRAIT = E.db.unitframe.units.player.portrait.enable
	local USE_PORTRAIT_OVERLAY = E.db.unitframe.units.player.portrait.overlay and USE_PORTRAIT
	local PORTRAIT_WIDTH = E.db.unitframe.units.player.portrait.width
	
	if E.db.classoffset.enable then
		
	--Resource Bars
	do
		--[[if E.myclass == "PALADIN" then
			local bars = frame.HolyPower
			bars:ClearAllPoints()
			if USE_MINI_CLASSBAR then
				bars:Point("CENTER", frame.Health.backdrop, "TOP", -(BORDER*3 + 6), -SPACING)
				bars:SetFrameStrata("MEDIUM")
			else
				bars:Point("BOTTOMLEFT", frame.Health.backdrop, "TOPLEFT", BORDER, BORDER+SPACING)
				bars:SetFrameStrata("LOW")
			end
			bars:Width(CLASSBAR_WIDTH)
			bars:Height(CLASSBAR_HEIGHT - (BORDER*2))
		
			for i = 1, MAX_HOLY_POWER do
				bars[i]:SetHeight(bars:GetHeight())	
				bars[i]:SetWidth(E:Scale(bars:GetWidth() - 2)/MAX_HOLY_POWER)	
				bars[i]:GetStatusBarTexture():SetHorizTile(false)
				bars[i]:ClearAllPoints()
				if i == 1 then
					bars[i]:SetPoint("LEFT", bars)
				else
					if USE_MINI_CLASSBAR then
						bars[i]:Point("LEFT", bars[i-1], "RIGHT", SPACING+(BORDER*2)+8, 0)
					else
						bars[i]:Point("LEFT", bars[i-1], "RIGHT", SPACING, 0)
					end
				end
			
				if not USE_MINI_CLASSBAR then
					bars[i].backdrop:Hide()
				else
					bars[i].backdrop:Show()
				end
			end
	
			if not USE_MINI_CLASSBAR then
				bars.backdrop:Show()
			else
				bars.backdrop:Hide()			
			end		
				
			if USE_CLASSBAR and not frame:IsElementEnabled('HolyPower') then
				frame:EnableElement('HolyPower')
				bars:Show()
			elseif not USE_CLASSBAR and frame:IsElementEnabled('HolyPower') then
				frame:DisableElement('HolyPower')	
				bars:Hide()
			end		
			
		elseif E.myclass == "WARLOCK" then
			local bars = frame.SoulShards
			bars:ClearAllPoints()
			if USE_MINI_CLASSBAR then
				bars:Point("CENTER", frame.Health.backdrop, "TOP", -(BORDER*3 + 6), -SPACING)
				bars:SetFrameStrata("MEDIUM")
			else
				bars:Point("BOTTOMLEFT", frame.Health.backdrop, "TOPLEFT", BORDER, BORDER+SPACING)
				bars:SetFrameStrata("LOW")
			end
			bars:Width(CLASSBAR_WIDTH)
			bars:Height(CLASSBAR_HEIGHT - (BORDER*2))
		
			for i = 1, SHARD_BAR_NUM_SHARDS do
				bars[i]:SetHeight(bars:GetHeight())	
				bars[i]:SetWidth(E:Scale(bars:GetWidth() - 2)/SHARD_BAR_NUM_SHARDS)	
				bars[i]:ClearAllPoints()
				if i == 1 then
					bars[i]:SetPoint("LEFT", bars)
				else
					if USE_MINI_CLASSBAR then
						bars[i]:Point("LEFT", bars[i-1], "RIGHT", SPACING+(BORDER*2)+8, 0)
					else
						bars[i]:Point("LEFT", bars[i-1], "RIGHT", SPACING, 0)
					end
				end
			
				if not USE_MINI_CLASSBAR then
					bars[i].backdrop:Hide()
				else
					bars[i].backdrop:Show()
				end				
			end
			
			if not USE_MINI_CLASSBAR then
				bars.backdrop:Show()
			else
				bars.backdrop:Hide()			
			end
		
			if USE_CLASSBAR and not frame:IsElementEnabled('SoulShards') then
				frame:EnableElement('SoulShards')
				bars:Show()
			elseif not USE_CLASSBAR and frame:IsElementEnabled('SoulShards') then
				frame:DisableElement('SoulShards')
				bars:Hide()
			end	]]				
		--else
		if E.myclass == "DEATHKNIGHT" then
			local runes = ElvUF_Player.Runes
			runes:ClearAllPoints()
			if USE_MINI_CLASSBAR then
				CLASSBAR_WIDTH = CLASSBAR_WIDTH * 3/2 --Multiply by reciprocal to reset previous setting
				CLASSBAR_WIDTH = CLASSBAR_WIDTH * 4/5
				runes:Point("CENTER", ElvUF_Player.Health.backdrop, "TOP", -(BORDER*3 + 8) + E.db.classoffset.xoffset, -SPACING)
				runes:SetFrameStrata("MEDIUM")
			else
				runes:Point("BOTTOMLEFT", ElvUF_Player.Health.backdrop, "TOPLEFT", BORDER + E.db.classoffset.xoffset, BORDER+SPACING)
				runes:SetFrameStrata("LOW")
			end
			runes:Width(CLASSBAR_WIDTH)
			runes:Height(CLASSBAR_HEIGHT - (BORDER*2))			
			
			for i = 1, 6 do
				runes[i]:SetHeight(runes:GetHeight())
				runes[i]:SetWidth(E:Scale(runes:GetWidth() - 5) / 6)	
				if USE_MINI_CLASSBAR then
					runes[i].backdrop:Show()
				else
					runes[i].backdrop:Hide()	
				end
				
				runes[i]:ClearAllPoints()
				if i == 1 then
					runes[i]:SetPoint("LEFT", runes)
				else
					if USE_MINI_CLASSBAR then
						runes[i]:Point("LEFT", runes[i-1], "RIGHT", SPACING+(BORDER*2)+2, 0)
					else
						runes[i]:Point("LEFT", runes[i-1], "RIGHT", SPACING, 0)
					end
				end	
			
				if not USE_MINI_CLASSBAR then
					runes[i].backdrop:Hide()
				else
					runes[i].backdrop:Show()
				end					
			end
		
			if not USE_MINI_CLASSBAR then
				runes.backdrop:Show()
			else
				runes.backdrop:Hide()
			end		
				if USE_CLASSBAR and not ElvUF_Player:IsElementEnabled('Runes') then
				ElvUF_Player:EnableElement('Runes')
				runes:Show()
			elseif not USE_CLASSBAR and ElvUF_Player:IsElementEnabled('Runes') then
				ElvUF_Player:DisableElement('Runes')	
				runes:Hide()
				RuneFrame.Show = RuneFrame.Hide
				RuneFrame:Hide()				
			end
		runes:Show() --It seems that runes bar is hiding if offset is on without this thing
		--[[elseif E.myclass == "SHAMAN" then
			local totems = frame.TotemBar
		
			totems:ClearAllPoints()
			if not USE_MINI_CLASSBAR then
				totems:Point("BOTTOMLEFT", frame.Health.backdrop, "TOPLEFT", BORDER, BORDER+SPACING)
				totems:SetFrameStrata("LOW")
			else
				CLASSBAR_WIDTH = CLASSBAR_WIDTH * 3/2 --Multiply by reciprocal to reset previous setting
				CLASSBAR_WIDTH = CLASSBAR_WIDTH * 4/5
				totems:Point("CENTER", frame.Health.backdrop, "TOP", -(BORDER*3 + 6), -SPACING)
				totems:SetFrameStrata("MEDIUM")			
			end
			
			totems:Width(CLASSBAR_WIDTH)
			totems:Height(CLASSBAR_HEIGHT - (BORDER*2))

			for i=1, 4 do
				totems[i]:SetHeight(totems:GetHeight())
				totems[i]:SetWidth(E:Scale(totems:GetWidth() - 3) / 4)	

				if USE_MINI_CLASSBAR then
					totems[i].backdrop:Show()
				else
					totems[i].backdrop:Hide()
				end	
				
				totems[i]:ClearAllPoints()
				if i == 1 then
					totems[i]:SetPoint("LEFT", totems)
				else
					if USE_MINI_CLASSBAR then
						totems[i]:Point("LEFT", totems[i-1], "RIGHT", SPACING+(BORDER*2)+4, 0)
					else
						totems[i]:Point("LEFT", totems[i-1], "RIGHT", SPACING, 0)
					end
				end		

				if not USE_MINI_CLASSBAR then
					totems[i].backdrop:Hide()
				else
					totems[i].backdrop:Show()
				end						
			end
			
			if not USE_MINI_CLASSBAR then
				totems.backdrop:Show()
			else
				totems.backdrop:Hide()
			end		

			if USE_CLASSBAR and not frame:IsElementEnabled('TotemBar') then
				frame:EnableElement('TotemBar')
				totems:Show()
			elseif not USE_CLASSBAR and frame:IsElementEnabled('TotemBar') then
				frame:DisableElement('TotemBar')	
				totems:Hide()
			end					
		elseif E.myclass == "DRUID" then
			local eclipseBar = frame.EclipseBar

			eclipseBar:ClearAllPoints()
			if not USE_MINI_CLASSBAR then
				eclipseBar:Point("BOTTOMLEFT", frame.Health.backdrop, "TOPLEFT", BORDER, BORDER+SPACING)
				eclipseBar:SetFrameStrata("LOW")
			else		
				CLASSBAR_WIDTH = CLASSBAR_WIDTH * 3/2 --Multiply by reciprocal to reset previous setting
				CLASSBAR_WIDTH = CLASSBAR_WIDTH * 2/3			
				eclipseBar:Point("LEFT", frame.Health.backdrop, "TOPLEFT", (BORDER*2 + 4), 0)
				eclipseBar:SetFrameStrata("MEDIUM")						
			end

			eclipseBar:Width(CLASSBAR_WIDTH)
			eclipseBar:Height(CLASSBAR_HEIGHT - (BORDER*2))	
			
			--?? Apparent bug fix for the width after in-game settings change
			eclipseBar.LunarBar:SetMinMaxValues(0, 0)
			eclipseBar.SolarBar:SetMinMaxValues(0, 0)
			eclipseBar.LunarBar:Size(CLASSBAR_WIDTH, CLASSBAR_HEIGHT - (BORDER*2))			
			eclipseBar.SolarBar:Size(CLASSBAR_WIDTH, CLASSBAR_HEIGHT - (BORDER*2))	
			
			if USE_CLASSBAR and not frame:IsElementEnabled('EclipseBar') then
				frame:EnableElement('EclipseBar')
				eclipseBar:Show()
			elseif not USE_CLASSBAR and frame:IsElementEnabled('EclipseBar') then
				frame:DisableElement('EclipseBar')	
				eclipseBar:Hide()
			end]]					
		end
	end
	
	end
end

UF:Update_AllFrames()
UF:ClassbarMove()