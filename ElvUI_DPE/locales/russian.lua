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
L["DP_1"] = "Панель 1"
L["DP_2"] = "Панель 2"
L["Top_Center"] = "Верхняя панель"
L["DP_3"] = "Панель 3"
L["DP_4"] = "Панель 4"
L["DP_5"] = "Панель 5"
L["Bottom_Panel"] = "Нижняя панель"
L["DP_6"] = "Панель 6"

L["LFR Dragon Soul"] = "Душа Дракона ЛФР"
L['LFR Lockdown'] = "Состояние ЛФР"
L["Show/Hide LFR lockdown info in time datatext's tooltip."] = "Отображать/скрывать информацию о сохранении ЛФР"

L["DPE_AUTHOR_INFO"] = "Редакция от Darth Predator (Дартпредатор - Свежеватель Душ)"
L["DPE_CONTACTS"] = [=[При возникновении вопросов или желании подогнать сборку под себя обращаться:
- Игровая почта
- Личное сообщение на форуме TukUI, ник Darth Predator
- Личное сообщение на Curse, ник Darth_Predator
- Сайт Shadowmage.ru]=]

--PvP Autorelease
L["PvP Autorelease"] = "Автовыход из тела"
L['Automatically release body when killed inside a battleground.'] = "Автоматически выходить из тела на полях боя."

--Exp/Rep Text
L["Xp-Rep Text"] = "Текст Опыта/Репутации"
L["XP-Rep Text mod by Benik"] = "Мод текста опыта/репутации от Benik"
L['Show/Hide XP-Rep Info.'] = "Показать/скрыть текст на полосах."
L['Detailed'] = "Подробно"
L['More XP-Rep Info. Shown only when bars are on top.'] = "Более подробная информация в тексте. Отображается только при нахождении полос в верху экрана."
L["Detailed options"] = "Опции подробного текста"
L['Reaction Name'] = "Реакция"
L['Show/Hide Reaction status on bar.'] = "Отображает статус реакции на полосе в виде текста."
L['Rested Value'] = "Бодрость"
L['Show/Hide Rested value.'] = "Показать/скрыть значение бодрости."

--Raid Utility
L["Raid Utility"] = "Управление рейдом"
L["Raid Utility coordinates"] = "Позиция Управления Рейдом"
L["RU_DESC"] = [=[Эти опции позволяют вам свободно перемещать кнопку Управления Рейдом.
К сожалению, после перемещения кнопки старым способом, нажатие на нее вызывает ошибку.
Это не критическая ошибка, но при активном и длительном использовании Управления Рейдом погут возникнуть проблемы с производительностью.]=]
L['X Position'] = "Позиция X"
L['Sets X position of Raid Utility button.'] = "Задает координаты Управления рейдом по оси X."
L['Y Position'] = "Позиция Y"
L['Sets Y position of Raid Utility button.'] = "Задает координаты Управления рейдом по оси Y."

--Raid Marks
L["Marks"] = "Метки"
L["Show/Hide raid marks."] = "Показать/скрыть фрейм рейдовых меток."
L['Sets size of buttons'] = "Устанавливает размер кнопок"
L["Direction"] = "Направление"
L['Change the direction of buttons growth from "skull" mark'] = 'Изменяет направление роста кнопок от метки "череп".'

--Balance Power Frame
L["Druid"] = "Друид"
L["Druid spesific options"] = "Настройки для друидов"
L["Balance Power Frame"] = "Фрейм Энергии Баланса"
L["Show/hide the frame with exact number of your Solar/Lunar energy."] = "Показать/скрыть фрейм с точным значением Лунной/Солнечной энергии."