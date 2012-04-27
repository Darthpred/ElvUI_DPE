local E, L, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local UF = E:GetModule('UnitFrames');
local LSM = LibStub("LibSharedMedia-3.0");

--Damn lot of crap. Keeping this just for the time i'll be able to hool text formats <_<

local abs = math.abs
local _, ns = ...
local ElvUF = ns.oUF
--assert(ElvUF, "ElvUI was unable to locate oUF.")

--GetInfoTextDPE = GetInfoText
function UF:GetTextFormat(frame, unit, r, g, b, min, max, reverse, type)
	local value
	local db = frame.db
	
	--[[if not db or not db[type] then return '' end

	if db[type].text_format == 'blank' then
		return '';
	end]]
	
	print("Imma worked")
	
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
			if db.power.text_format == 'current-percent' then
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
	print("Imma text format")
	return value
	--print("Imma text format")
end

local function GetInfoTextDPE(frame, unit, r, g, b, min, max, reverse, type)
	--GetInfoText(self)
	local value
	local db = frame.db
	
	if not db or not db[type] then return '' end

	if db[type].text_format == 'blank' then
		return '';
	end
	
	print("Imma worked")
	
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

UF.PostUpdatePowerDPE = UF.PostUpdatePower
function UF:PostUpdatePower(unit, min, max)
	UF:PostUpdatePowerDPE(self)

	print("Imma new power update")
	--[[local dead, ghost = UnitIsDead(unit), UnitIsGhost(unit)
	if min == 0 then 
		self.value:SetText() 
	else
		if (not UnitIsPlayer(unit) and not UnitPlayerControlled(unit) and not UnitIsConnected(unit)) then
			power.value:SetText()
		elseif dead or ghost then
			self.value:SetText()
		else
			if pType == 0 then
				local reverse
				if unit == "player" then
					reverse = true
				end
				
				self.value:SetText(GetInfoText(self:GetParent(), unit, nil, nil, nil, min, max, reverse, 'power'))
			else
				self.value:SetText(max - (max - min))
			end
		end
	end]]
end

--[[
function UF:PostUpdatePower(unit, min, max)
	print("Imma a power update")
	local pType, pToken, altR, altG, altB = UnitPowerType(unit)
	local color
	if pToken then
		color = ElvUF['colors'].power[pToken]
	else
	
	end
	local perc
	if max == 0 then
		perc = 0
	else
		perc = floor(min / max * 100)
	end
	
	if not self.value or self.value and not self.value:IsShown() then return end		

	if color then
		self.value:SetTextColor(color[1], color[2], color[3])
	else
		self.value:SetTextColor(altR, altG, altB, 1)
	end	
	
	local dead, ghost = UnitIsDead(unit), UnitIsGhost(unit)
	if min == 0 then 
		self.value:SetText() 
	else
		if (not UnitIsPlayer(unit) and not UnitPlayerControlled(unit) and not UnitIsConnected(unit)) then
			power.value:SetText()
		elseif dead or ghost then
			self.value:SetText()
		else
			if pType == 0 then
				local reverse
				if unit == "player" then
					reverse = true
				end
				
				self.value:SetText(GetInfoText(self:GetParent(), unit, nil, nil, nil, min, max, reverse, 'power'))
			else
				self.value:SetText(max - (max - min))
			end
		end
	end

	local db = self:GetParent().db
	
	if self.LowManaText and db then
		if pToken == 'MANA' then
			if perc <= db.lowmana and not dead and not ghost then
				self.LowManaText:SetText(LOW..' '..MANA)
				E:Flash(self.LowManaText, 0.6)
			else
				self.LowManaText:SetText()
				E:StopFlash(self.LowManaText)
			end
		else
			self.LowManaText:SetText()
			E:StopFlash(self.LowManaText)
		end
	end
	
	if db and db['power'].hideonnpc then
		UF:PostNamePosition(self:GetParent(), unit)
	end	
end]]

--GetInfoText()
