local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("ElvUI", "ruRU")
if not L then return; end

--Main config
L["Additional options"] = "Доп. опции"
L["Darth Predator's edit of ElvUI"] = "Редакция ElvUI от Darth Predator'а"
L['DPE_DESC'] = [=[Это плагин для изменения ElvUI в соответствии с моими вкусами. Для максимально полного и комфортного использования желательно наличие разрешения 1920х1080.

Данный плагин не изменяет изначальные фалы ElvUI, так что его отключение или удаление не повлечет за собой никаких последствий для основного аддона.
]=]

--Credits
L['ELVUI_DPE_CREDITS'] = "Я бы хотел отметить следующих людей, которые помогли мне сделать этот аддон посредством тестирования, кода и прочего."
L['Submodules and coding:'] = "Субмодули и кодинг:"
L['ELVUI_DPE_CODERS'] = [[Benik - ядро функции текста полос опыта/репутации
Catok - функция тестирования интерфейса
Repooc - ядро функции автоматического выхода из тела
Tukz - помощь с oUF
Pvtschlag - плагин Necrotic Strike для oUF
Blazeflack - помощь с хуками, модулями и профилями
Camealion - обучение меня созданию скинов
]]
L['Other support:'] = "Прочая поддержка:"
L['ELVUI_DPE_MISC'] = [[BuG - веселье в чате, пока я писал это все
TheSamaKutra - пара хороших идей
Allaidia - моральная поддержка O_o
]]

--Datatexts
L["Bottom_Right"] = "Нижняя правая панель"
L["Bottom_Left"] = "Нижняя левая панель"
L["Bottom_Panel"] = "Нижняя центральная панель"
L["Top_Center"] = "Верхняя центральная панель"
L["Top_Center_Left"] = "Верхняя центр слева"
L["Top_Center_Right"] = "Верхняя центр справа"
L["Top_Left"] = "Верхняя левая панель"
L["Top_Right"] = "Верхняя правая панель"

L["LFR Dragon Soul"] = "Душа Дракона ЛФР"
L['LFR Lockdown'] = "Состояние ЛФР"
L["Show/Hide LFR lockdown info in time datatext's tooltip."] = "Отображать/скрывать информацию о сохранении ЛФР"

--PvP Autorelease
L["PvP Autorelease"] = "Автовыход из тела"
L['Automatically release body when killed inside a battleground.'] = "Автоматически выходить из тела на полях боя."

--Exp/Rep Text
L["Xp-Rep Mod"] = "Текст Опыта/Репутации"
L['Show XP-Rep Info on bars'] = "Показывать значения опыта/репутации на соответствующих полосах."

--Balance Power Frame
L["Druid"] = "Друид"
L["Druid spesific options"] = "Настройки для друидов"
L["Balance Power Frame"] = "Фрейм Энергии Баланса"
L["Show/hide the frame with exact number of your Solar/Lunar energy."] = "Показать/скрыть фрейм с точным значением Лунной/Солнечной энергии."