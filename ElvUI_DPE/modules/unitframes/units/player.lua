local E, L, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local UF = E:GetModule('UnitFrames');
local LSM = LibStub("LibSharedMedia-3.0");

local abs = math.abs
local _, ns = ...
local ElvUF = ns.oUF

UF.Update_PlayerFrameDPE = UF.Update_PlayerFrame
function UF:Update_PlayerFrame(frame, db)
	self:Update_PlayerFrameDPE(frame, db)
	--[[print(min)
	--UF:GetTextFormat(frame, db)
	
	
	--local function FormatGet(frame, unit, r, g, b, min, max, reverse, type)
	
	local value
	local db = frame.db
	
	--print("Imma worked 1")
	
	if reverse then
		--print("Imma worked res")
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
		--print("Imma worked nonres")
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
			if db.power.text_format == 'current-percent' then
				if min ~= max then
					value = format("%s |cffD7BEA5-|r %d%%", min, floor(min / max * 100))
				else
					value = format("%s", max)
				end
			elseif db.power.text_format == 'current-max' then
				if min == max then
					value = format("%s", E:ShortValue(max))	
				else
					value = format("%s |cffD7BEA5-|r %s", E:ShortValue(min), E:ShortValue(max))
				end
			elseif db.power.text_format == 'current' then
				print("Format spotted")
				value = min --format("%s", min)	
				print(min)
				print(tonumber(value))
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
	--print("Imma text format")
	--return value
	--end
	
	--FormatGet(self)]]
	
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

function UF:UpdatePvPText(frame)
	local unit = frame.unit
	local PvPText = frame.PvPText
	local LowManaText = frame.Power.LowManaText
	
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
	
	PvPText:Point("BOTTOMLEFT", frame.Health, "BOTTOMLEFT", 2, 2)
end

UF:Update_AllFrames()