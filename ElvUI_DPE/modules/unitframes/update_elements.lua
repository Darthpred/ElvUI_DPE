local E, L, V, P, G =  unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local UF = E:GetModule('UnitFrames');
local LSM = LibStub("LibSharedMedia-3.0");

--Replacement of text formats on unitframes.
function UF:GetInfoText(frame, unit, r, g, b, min, max, reverse, type)
	local value
	local db = frame.db

	if not db or not db[type] then return '' end

	if db[type].text_format == 'blank' then
		return '';
	end
	
	if reverse then
		if type == 'health' then
			if db[type].text_format == 'current-percent' then
				if min ~= max then
					value = format("|cff%02x%02x%02x%.1f%%|r |cffD7BEA5-|r |cffAF5050%s|r", r * 255, g * 255, b * 255, format("%.1f", min / max * 100), E:ShortValue(min))
				else
					value = format("|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, E:ShortValue(max))	
				end
			elseif db[type].text_format == 'current-max' then
				if min == max then
					value = format("|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, E:ShortValue(max))	
				else
					value = format("|cff%02x%02x%02x%s|r |cffD7BEA5-|r |cffAF5050%s|r", r * 255, g * 255, b * 255, E:ShortValue(max), E:ShortValue(min))
				end
			elseif db[type].text_format == 'current' then
				value = format("|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, E:ShortValue(min))	
			elseif db[type].text_format == 'percent' then
				value = format("|cff%02x%02x%02x%.1f%%|r", r * 255, g * 255, b * 255, format("%.1f", min / max * 100))
			elseif db[type].text_format == 'deficit' then
				if min == max then
					value = ""
				else			
					value = format("|cffAF5050-|r|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, E:ShortValue(max - min))
				end
			end	
		else
			if db[type].text_format == 'current-percent' then
				if min ~= max then
					value = format("%d%% |cffD7BEA5-|r %s", floor(min / max * 100), min)
				else
					value = format("%s", max)	
				end
			elseif db[type].text_format == 'current-max' then
				if min == max then
					value = format("%s", E:ShortValue(max))	
				else
					value = format("%s |cffD7BEA5-|r %s", E:ShortValue(max), E:ShortValue(min))
				end
			elseif db[type].text_format == 'current' then
				value = format("%s", min)	
			elseif db[type].text_format == 'percent' then
				value = format("%d%%", floor(min / max * 100))
			elseif db[type].text_format == 'deficit' then
				if min == max then
					value = ""
				else			
					value = format("|cffAF5050-|r%s", E:ShortValue(max - min))
				end
			end			
		end
	else
		if type == 'health' then
			if db[type].text_format == 'current-percent' then
				if min ~= max then
					value = format("|cffAF5050%s|r |cffD7BEA5-|r |cff%02x%02x%02x%.1f%%|r", min, r * 255, g * 255, b * 255, format("%.1f", min / max * 100))
				else
					value = format("|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, max)
				end
			elseif db[type].text_format == 'current-max' then
				if min == max then
					value = format("|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, E:ShortValue(max))	
				else
					value = format("|cffAF5050%s|r |cffD7BEA5-|r |cff%02x%02x%02x%s|r", E:ShortValue(min), r * 255, g * 255, b * 255, E:ShortValue(max))
				end
			elseif db[type].text_format == 'current' then
				value = format("|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, E:ShortValue(min))	
			elseif db[type].text_format == 'percent' then
				value = format("|cff%02x%02x%02x%.1f%%|r", r * 255, g * 255, b * 255, format("%.1f", min / max * 100))
			elseif db[type].text_format == 'deficit' then
				if min == max then
					value = ""
				else			
					value = format("|cffAF5050-|r|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, E:ShortValue(max - min))
				end
			end
		else
			if db[type].text_format == 'current-percent' then
				if min ~= max then
					value = format("%s |cffD7BEA5-|r %d%%", min, floor(min / max * 100))
				else
					value = format("%s", max)
				end
			elseif db[type].text_format == 'current-max' then
				if min == max then
					value = format("%s", E:ShortValue(max))	
				else
					value = format("%s |cffD7BEA5-|r %s", E:ShortValue(min), E:ShortValue(max))
				end
			elseif db[type].text_format == 'current' then
				value = format("%s", min)	
			elseif db[type].text_format == 'percent' then
				value = format("%d%%", floor(min / max * 100))
			elseif db[type].text_format == 'deficit' then
				if min == max then
					value = ""
				else			
					value = format("|cffAF5050-|r%s", E:ShortValue(max - min))
				end
			end		
		end
	end
	
	return value
end

--Replacemant to move pvp indicator
function UF:UpdatePvPText(frame)
	local unit = frame.unit
	local PvPText = frame.PvPText
	local LowManaText = frame.Power.LowManaText
	local health = frame.Health
	
	if E.db.dpe.pvp.mouse then
		if PvPText and frame:IsMouseOver() then
			PvPText:Show()
				if LowManaText and LowManaText:IsShown() then LowManaText:Hide() end
		
				local time = GetPVPTimer()
				local min = format("%01.f", floor((time / 1000) / 60))
				local sec = format("%02.f", floor((time / 1000) - min * 60)) 
		
					if(UnitIsPVPFreeForAll(unit)) then
						if time ~= 301000 and time ~= -1 then
							PvPText:SetText(PVP.." ".."("..min..":"..sec..")")
						else
							PvPText:SetText(PVP)
						end
					elseif UnitIsPVP(unit) then
						if time ~= 301000 and time ~= -1 then
							PvPText:SetText(PVP.." ".."("..min..":"..sec..")")
						else
							PvPText:SetText(PVP)
						end
					else
						PvPText:SetText("")
					end
		elseif PvPText then
			PvPText:Hide()
			if LowManaText and not LowManaText:IsShown() then LowManaText:Show() end
		end
	else
		PvPText:Show()
		if LowManaText and LowManaText:IsShown() then LowManaText:Hide() end

		local time = GetPVPTimer()
		local min = format("%01.f", floor((time / 1000) / 60))
		local sec = format("%02.f", floor((time / 1000) - min * 60)) 

		if(UnitIsPVPFreeForAll(unit)) then
			if time ~= 301000 and time ~= -1 then
				PvPText:SetText(PVP.." ".."("..min..":"..sec..")")
			else
				PvPText:SetText(PVP)
			end
		elseif UnitIsPVP(unit) then
			if time ~= 301000 and time ~= -1 then
				PvPText:SetText(PVP.." ".."("..min..":"..sec..")")
			else
				PvPText:SetText(PVP)
			end
		else
			PvPText:SetText("")
		end
	end
	
	local x, y = self:GetPositionOffset(E.db.dpe.pvp.pos)
	PvPText:ClearAllPoints()
	PvPText:Point(E.db.dpe.pvp.pos, health, E.db.dpe.pvp.pos, x, y)
end