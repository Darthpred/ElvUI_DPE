local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("ElvUI", "ruRU")
if not L then return; end

--Main config--
---------------
L["Additional options"] = "Доп. опции"
L["Darth Predator's edit of ElvUI"] = "Редакция ElvUI от Darth Predator'а"
L['DPE_DESC'] = [=[Это плагин для изменения ElvUI в соответствии с моими вкусами. Для максимально полного и комфортного использования желательно наличие разрешения 1920х1080.

Данный плагин не изменяет изначальные фалы ElvUI, так что его отключение или удаление не повлечет за собой никаких последствий для основного аддона.
]=]

--LFR Lockdown
L["LFR Dragon Soul"] = "Душа Дракона ЛФР"
L['LFR Lockdown'] = "Состояние ЛФР"
L["Show/Hide LFR lockdown info in time datatext's tooltip."] = "Отображать/скрывать информацию о сохранении ЛФР"

--PvP Autorelease
L["PvP Autorelease"] = "Автовыход из тела"
L['Automatically release body when killed inside a battleground.'] = "Автоматически выходить из тела на полях боя."

--Auras
L['Aura Size'] = "Размер баффов"
L['Sets size of auras.\n|cffFF0000This is global setting and will affect all your profiles.|r'] = [=[Устанавливает размер баффов в фрейме Blizzard.
|cffFF0000Это глобальная настройка, она распространяется на все ваши профили.|r]=]

--Skada
L["Skada Backdrop"]= "Фон Skada"
L['Show/hide Skada backdrop.'] = "Показать/скрыть фон окон аддона Skada."

--Player Frame Indicators
L["Player Frame Indicators"] = "Индикаторы игрока"
L["PvP text on mouse over"] = "ПвП текст при наведении"
L['Show PvP text on mouse over player frame.'] = "Отображать ПвП текст при наведении мыши на фрейм игрока. При отключении будет отображаться всегда."
L["PvP Position"] = "Позизия PvP"
L['Set the point to show pvp text'] = "Устанавливает позицию индикатора ПвП."
L["Combat Position"] = "Иконка боя"
L['Set the point to show combat icon'] = "Устанавливает позицию индикатора боя."

--Raid Marks
L["Marks"] = "Метки"
L["Show/Hide raid marks."] = "Показать/скрыть фрейм рейдовых меток."
L['Sets size of buttons'] = "Устанавливает размер кнопок"
L["Direction"] = "Направление"
L['Change the direction of buttons growth from "skull" mark'] = 'Изменяет направление роста кнопок от метки "череп".'

--Quest Tracker
L["Quest Tracker"] = "Слежение за заданиями"
L['Quest Tracker Backdrop'] = "Фон слежения"
L['Attaches a backdrop frame behind the quest tracker.'] = "Создает фон для фрейма слежения за заданиями."
L["Sets size of quest tracker's font"] = "Устанавливает размер шрифта во фрейме слежения"

--Exp/Rep Text--
----------------
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

--Backgrounds--
---------------
L["Backgrounds"] = "Фоновые фреймы"
L["Additional Background Panels"] = "Дополнительные фреймы для фонов"
L["BG_DESC"] = "Модуль для создания дополнительных фреймов, которые могут использоваться в качестве фонов для чего-нибудь."
L["Bottom BG"] = "Нижний фон"
L["Left BG"] = "Левый фон"
L["Right BG"] = "Правый фон"
L["Actionbar BG"] = "Верхний фон"
L['Show/Hide this frame.'] = "Показать/скрыть этот фрейм."
L['Sets width of the frame'] = "Устанавливает ширину фрейма"
L['Sets height of the frame'] = "Устанавливает высоту фрейма"
L['Sets X offset of the frame'] = "Устанавливает смещение по оси X"
L['Sets Y offset of the frame'] = "Устанавливает смещение по оси Y"
L["Texture"] = "Текстура"
L["Set texture to use in this frame. Requirements are the same as for the chat textures."] = "Устанавливает текстуру этого фрейма. Требования к текстуре такие же, как для текстур чата."

--Datatexts--
-------------
L["Datatext panels"] = "Панели инфо-текстов"
L["Additional Datatext Panels"] = "Дополнительные панели инфо-текстов"
L["DP_DESC"] = [=[Дополнительные панели под информационные тексты.
Всего здесь 8 дополнительных панелей и 20 дополнительных слотов под инфо-тексты.
Верхнюю панель отключить нельзя, ровно как и панели на чатах.]=]
L["DP_1"] = "Панель 1"
L["DP_2"] = "Панель 2"
L["Top_Center"] = "Верхняя панель"
L["DP_3"] = "Панель 3"
L["DP_4"] = "Панель 4"
L["DP_5"] = "Панель 5"
L["Bottom_Panel"] = "Нижняя панель"
L["DP_6"] = "Панель 6"
L['Show/Hide this panel.'] = "Показать/скрыть эту панель."
L['Sets size of this panel'] = "Установить ширину панели"

--Raid Utility--
----------------
L["Raid Utility"] = "Управление рейдом"
L["Raid Utility coordinates"] = "Позиция Управления Рейдом"
L["RU_DESC"] = [=[Эти опции позволяют вам свободно перемещать кнопку Управления Рейдом.
К сожалению, после перемещения кнопки старым способом, нажатие на нее вызывает ошибку.
Это не критическая ошибка, но при активном и длительном использовании Управления Рейдом возможны проблемы с производительностью.]=]
L['X Position'] = "Позиция X"
L['Sets X position of Raid Utility button.'] = "Задает координаты Управления рейдом по оси X."
L['Y Position'] = "Позиция Y"
L['Sets Y position of Raid Utility button.'] = "Задает координаты Управления рейдом по оси Y."

--UI Buttons--
--------------
L["UI Buttons"] = "Меню интерфейса"
L["Additional menu with useful buttons"] = "Дополнительное меню с полезными кнопками"
L["Show/Hide UI buttons."] = "Показать/скрыть меню"
L["Mouse over"] = "При наведении"
L["Show on mouse over."] = "Отображать при наведении мыши."
L["Buttons position"] = "Положение кнопок"
L["Layout for UI buttons."] = "Режим положения кнопок"

L["ElvUI Config"] = "Настройка ElvUI"
L["Click to toggle config window"] = "Нажмите для отображения окна настроек"
L["Reload UI"] = "Перезагрузить интерфейс"
L["Click to reload your interface"] = "Нажмите для перезагрузки интерфейса"
L["Move UI"] = "Разблокировать элементы"
L["Click to unlock moving ElvUI elements"] = "Нажмите для входа в режим перемещения элементов"
L["Boss Mod"] = "Босс мод"
L["Click to toogle the Configuration/Option Window from the Bossmod (DXE, DBM or Bigwigs) you have enabled."] = "Нажмите для отображения окна настроек включенного босс мода. Поддерживаются DXE, DBM, Bigwigs."
L["AddOns Manager"] = "Менеджер аддонов"
L["Click to toogle the AddOn Managerframe (stAddOnManager or ACP) you have enabled."] = "Нажмите для отображения окна менеджера аддонов. Поддерживаются stAddOnManager, ACP"

--Microbar--
------------
L["2 rows"] = "В 2 ряда"
L["3 rows"] = "В 3 ряда"
L["4 rows"] = "В 4 ряда"
L["6 rows"] = "В 6 рядов"
L["Change the positioning of buttons on Microbar."] = "Изменяет позиционирование кнопок в микроменю."
L["Hide in Combat"] = "Скрывать в бою"
L["Hide Microbar in combat."] = "Скрывать микроменю в бою."
L["Hide microbar unless you mouse over it."] = "Показывать меню при наведении курсора."
L["Microbar"] = "Микроменю"
L["Microbar Layout"] = "Вид Микроменю"
L["Module for adding micromenu to ElvUI."] = "Модуль для добавления микроменю в ElvUI."
L["On Mouse Over"] = "При наведении"
L["Positioning"] = "Позиционирование"
L["Set Alpha"] = "Прозрачность"
L["Sets alpha of the microbar"] = "Устанавливает прозрачность меню"
L["Set Scale"] = "Масштаб"
L["Sets Scale of the microbar"] = "Устанавливает масштаб микроменю"
L["Sets X offset for microbar buttons"] = "Устанавливает отступ кнопок микроменю по оси Х"
L["Sets Y offset for microbar buttons"] = "Устанавливает отступ кнопок микроменю по оси Y"
L["Show backdrop for micromenu"] = "Показывать фон микроменю"
L["Your version of ElvUI is older than recommended to use with Microbar addon. Please, download the latest version from tukui.org."] = "Ваша версия ElvUI старее, чем рекомендуемая для использования с Микроменю. Пожалуйста, скачайте последнюю версию с tukui.org."

--Balance Power Frame--
-----------------------
L["Druid"] = "Друид"
L["Druid spesific options"] = "Настройки для друидов"
L["Balance Power Frame"] = "Фрейм Энергии Баланса"
L["Show/hide the frame with exact number of your Solar/Lunar energy."] = "Показать/скрыть фрейм с точным значением Лунной/Солнечной энергии."

--Credits--
-----------
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
L["DPE_AUTHOR_INFO"] = "Редакция от Darth Predator (Дартпредатор - Свежеватель Душ)"
L["DPE_CONTACTS"] = [=[При возникновении вопросов или желании подогнать сборку под себя обращаться:
- Игровая почта
- Личное сообщение на форуме TukUI, ник Darth Predator
- Личное сообщение на Curse, ник Darth_Predator
- Сайт Shadowmage.ru]=]





