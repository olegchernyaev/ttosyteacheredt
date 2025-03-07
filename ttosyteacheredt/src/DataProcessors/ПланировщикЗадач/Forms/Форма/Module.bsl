
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	НачалоПериода				= НачалоНеделиСервер(ТекущаяДата());
	КонецПериода				= КонецНеделиСервер(ТекущаяДата());	
	ОтступСНачалаШкалы			= Константы.ПланировщикЗадачВремяС.Получить();
	ОтступСКонцаШкалы			= 24 - Константы.ПланировщикЗадачВремяПо.Получить();
	ВыводитьЗаголовок			= Константы.ВыводитьЗаголовокПланировщикаЗадач.Получить();	
	РазмерШрифтаПланировщика	= Константы.РазмерШрифтаТекстаПланировщика.Получить();
	
	Если НЕ ЗначениеЗаполнено(РазмерШрифтаПланировщика) Тогда
		РазмерШрифтаПланировщика = 12;
	КонецЕсли;
	
	Расписание.ШкалаВремени.ЦветФона						= WebЦвета.Зеленый;
	Расписание.ШкалаВремени.ЦветТекста						= WebЦвета.Черный;
	Расписание.ШкалаВремени.ПрозрачныйФон					= Ложь;
	Расписание.ЕдиницаПериодическогоВарианта				= ТипЕдиницыШкалыВремени.Час;
	Расписание.КратностьПериодическогоВарианта				= 24;	
	Расписание.ОтступСНачалаПереносаШкалыВремени			= ОтступСНачалаШкалы;
	Расписание.ОтступСКонцаПереносаШкалыВремени				= ОтступСКонцаШкалы;
	Расписание.ВыравниватьГраницыЭлементовПоШкалеВремени	= Ложь;
	Расписание.НачалоПериодаОтображения						= НачалоПериода;
	Расписание.КонецПериодаОтображения						= КонецПериода;
	Расписание.ФорматПеренесенныхЗаголовковШкалыВремени		= "ДФ='дддд, д ММММ'";
	Расписание.ТекущиеПериодыОтображения.Очистить();
	Расписание.ТекущиеПериодыОтображения.Добавить(НачалоПериода, КонецПериода);
		
	Если ВыводитьЗаголовок Тогда
		ОтображатьЗаголовок = Истина;
		Заголовок = "Расписание занятий " + ПредставлениеПериода(НачалоПериода, КонецПериода);
	Иначе
		ОтображатьЗаголовок = Ложь;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	ЗаполнитьЭлементыПланировщика();
	
КонецПроцедуры

#Область РаботаСКнопкамиНачальнойСтраницы

&НаКлиенте
Процедура СписокОбучающихся(Команда)
	
	ОткрытьФорму("Справочник.Обучающиеся.ФормаСписка");
	
КонецПроцедуры

&НаКлиенте
Процедура КонсольЗапросов(Команда)
	
	ОткрытьФорму("Обработка.КонсольЗапросов.Форма");
	
КонецПроцедуры

&НаКлиенте
Процедура СписокЗанятий(Команда)
	
	ОткрытьФорму("Документ.Занятия.ФормаСписка");
	
КонецПроцедуры

&НаКлиенте
Процедура ТемыЗанятий(Команда)
	
	ОткрытьФорму("Справочник.ТемыПреподователей.ФормаСписка");
	
КонецПроцедуры

&НаКлиенте
Процедура ТемыПоУчебинкам(Команда)
	
	ОткрытьФорму("Справочник.ТемыПоУчебникам.ФормаСписка");
	
КонецПроцедуры

&НаКлиенте
Процедура СписокРодителей(Команда)
	
	ОткрытьФорму("Справочник.РодителиОбучающихся.ФормаСписка");
	
КонецПроцедуры

&НаКлиенте
Процедура Пользователи(Команда)
	
	ОткрытьФорму("Справочник.Пользователи.ФормаСписка");
	
КонецПроцедуры

&НаКлиенте
Процедура УстановкаЦенЗанятий(Команда)
	
	ОткрытьФорму("Документ.УстановкаЦенЗанятий.Форма.ФормаСписка");
	
КонецПроцедуры

&НаКлиенте
Процедура ГрафикЗанятий(Команда)
	
	ОткрытьФорму("Отчет.ГрафикЗанятий.Форма.ФормаОтчета");
	
КонецПроцедуры

&НаКлиенте
Процедура ПанельАдминистратора(Команда)
	
	ОткрытьФорму("Обработка.ПанельАдминистратора.Форма.Форма");
	
КонецПроцедуры

&НаКлиенте
Процедура Продажи(Команда)
	
	ОткрытьФорму("Отчет.Продажи.Форма.ФормаОтчета");
	
КонецПроцедуры

&НаКлиенте
Процедура СписокПросроченныхЗанятий(Команда)
	
	ОткрытьФорму("ОбщаяФорма.ЗанятияБезПодтверждения");
	
КонецПроцедуры

#КонецОбласти

&НаСервере
Процедура ЗаполнитьЭлементыПланировщика()
	
    Расписание.ТекущиеПериодыОтображения.Очистить();
	Расписание.ТекущиеПериодыОтображения.Добавить(НачалоПериода, КонецПериода);
	Заголовок = "Расписание занятий " + ПредставлениеПериода(НачалоПериода, КонецПериода); 
    ЭлементыПланировщика = Расписание.Элементы;
    ЭлементыПланировщика.Очистить();
	
	Запрос = Новый Запрос ("ВЫБРАТЬ
	                       |	ЕСТЬNULL(РасписаниеЗанятий.Период, ДАТАВРЕМЯ(1, 1, 1)) КАК ДатаНачала,
	                       |	ДОБАВИТЬКДАТЕ(ЕСТЬNULL(РасписаниеЗанятий.Период, ДАТАВРЕМЯ(1, 1, 1)), МИНУТА, РасписаниеЗанятий.Длительность.ЗначениеМинут) КАК ДатаКонца,
	                       |	РасписаниеЗанятий.Регистратор.Ссылка КАК Занятие,
	                       |	РасписаниеЗанятий.Дисциплина,
	                       |	РасписаниеЗанятий.Обучающийся,
	                       |	ЕСТЬNULL(СтатусыЗанятий.СтатусЗанятия, ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.НеПодтверждено)) КАК СтатусЗанятия,
	                       |	ВЫБОР
	                       |		КОГДА ЕСТЬNULL(СтатусыЗанятий.СтатусЗанятия, ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.НеПодтверждено)) = ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.НеПодтверждено)
	                       |			ТОГДА ""ТусклоРозовый""
	                       |		КОГДА ЕСТЬNULL(СтатусыЗанятий.СтатусЗанятия, ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.НеПодтверждено)) = ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.Подтверждено)
	                       |			ТОГДА ""СветлоЗолотистый""
	                       |		КОГДА ЕСТЬNULL(СтатусыЗанятий.СтатусЗанятия, ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.НеПодтверждено)) = ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.ПроведеноИОплачено)
	                       |			ТОГДА ""СветлоЗеленый""
	                       |		КОГДА ЕСТЬNULL(СтатусыЗанятий.СтатусЗанятия, ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.НеПодтверждено)) = ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.Отменено)
	                       |			ТОГДА ""СеребристоСерый""
	                       |		КОГДА ЕСТЬNULL(СтатусыЗанятий.СтатусЗанятия, ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.НеПодтверждено)) = ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.Перенесено)
	                       |			ТОГДА ""Белый""
	                       |		КОГДА ЕСТЬNULL(СтатусыЗанятий.СтатусЗанятия, ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.НеПодтверждено)) = ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.Проведено)
	                       |				ИЛИ ЕСТЬNULL(СтатусыЗанятий.СтатусЗанятия, ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.НеПодтверждено)) = ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.Оплачено)
	                       |			ТОГДА ""Лазурный""
	                       |	КОНЕЦ КАК ЦветФона,
	                       |	ВЫБОР
	                       |		КОГДА ЕСТЬNULL(СтатусыЗанятий.СтатусЗанятия, ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.НеПодтверждено)) = ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.ПроведеноИОплачено)
	                       |				ИЛИ ЕСТЬNULL(СтатусыЗанятий.СтатусЗанятия, ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.НеПодтверждено)) = ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.Оплачено)
	                       |			ТОГДА ""Оплачено""
	                       |		КОГДА ЕСТЬNULL(СтатусыЗанятий.СтатусЗанятия, ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.НеПодтверждено)) = ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.Отменено)
	                       |				ИЛИ ЕСТЬNULL(СтатусыЗанятий.СтатусЗанятия, ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.НеПодтверждено)) = ЗНАЧЕНИЕ(Перечисление.СтатусыЗанятий.Перенесено)
	                       |			ТОГДА ""Пустая""
	                       |		ИНАЧЕ ""НеОплачено""
	                       |	КОНЕЦ КАК Картинка
	                       |ИЗ
	                       |	РегистрСведений.РасписаниеЗанятий КАК РасписаниеЗанятий
	                       |		ЛЕВОЕ СОЕДИНЕНИЕ РегистрСведений.СтатусыЗанятий КАК СтатусыЗанятий
	                       |		ПО РасписаниеЗанятий.Регистратор = СтатусыЗанятий.Занятие
	                       |ГДЕ
	                       |	РасписаниеЗанятий.Период МЕЖДУ &НачалоПериода И &КонецПериода
	                       |	И РасписаниеЗанятий.Преподаватель = &Преподаватель");
	
	Запрос.УстановитьПараметр("НачалоПериода",	НачалоПериода);
	Запрос.УстановитьПараметр("КонецПериода",	КонецПериода);
	Запрос.УстановитьПараметр("Преподаватель",	ПараметрыСеанса.ТекущийПользователь);
	Результат = Запрос.Выполнить().Выгрузить();
	                                                        
	Для каждого СтрРезультат Из Результат Цикл
		
		НовыйЭлемент = ЭлементыПланировщика.Добавить(Формат(СтрРезультат.ДатаНачала,"ДЛФ=ДВ"),Формат(СтрРезультат.ДатаКонца,"ДЛФ=ДВ"));
		
		НовыйЭлемент.Текст		= "" + СтрРезультат.Обучающийся;
		НовыйЭлемент.ЦветФона	= WebЦвета[СтрРезультат.ЦветФона];
		НовыйЭлемент.Картинка	= БиблиотекаКартинок[СтрРезультат.Картинка];
		НовыйЭлемент.Значение	= СтрРезультат.Занятие;
		НовыйЭлемент.Шрифт		= Новый Шрифт(НовыйЭлемент.Шрифт, "Times new roman", РазмерШрифтаПланировщика);
		
	КонецЦикла;
	
КонецПроцедуры

#Область РаботаСмПланировщиком 

&НаКлиенте
Процедура ПланировщикПередНачаломБыстрогоРедактирования(Элемент, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
	СсылкаНаЗанятие = Элемент.ВыделенныеЭлементы[0].Значение;
	
	Если СсылкаНаЗанятие = Неопределено Тогда 
		Возврат; 
	КонецЕсли;
	
	ПараметрыФормы = Новый Структура("Ключ", СсылкаНаЗанятие);
	ОписаниеОповещения = Новый ОписаниеОповещения("СозданиеРедактированиеЗанятияЗавершение", ЭтаФорма);
	
	ОткрытьФорму("Документ.Занятия.Форма.ФормаДокумента", ПараметрыФормы, , , , , ОписаниеОповещения)
	
КонецПроцедуры

&НаКлиенте
Процедура ПланировщикПередСозданием(Элемент, Начало, Конец, Значения, Текст, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;	
	СоздатьЗанятиеНаКлиенте(Начало);
	
КонецПроцедуры

&НаКлиенте
Процедура РасписаниеПриОкончанииРедактирования(Элемент, НовыйЭлемент, ОтменаРедактирования)
	
	ОтменаРедактирования = Истина;
	
КонецПроцедуры

&НаКлиенте
Процедура РасписаниеВыбор(Элемент, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
КонецПроцедуры

&НаКлиенте
Процедура РасписаниеПередНачаломРедактирования(Элемент, НовыйЭлемент, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
КонецПроцедуры

#КонецОбласти

&НаКлиенте
Процедура СледующаяНеделя(Команда)	
	
	НачалоПериода	= НачалоПериода + 86400*7;
	КонецПериода	= КонецПериода + 86400*7;
	ЗаполнитьЭлементыПланировщика();	
	
КонецПроцедуры

&НаКлиенте
Процедура ПредыдущаяНеделя(Команда)
	
	НачалоПериода	= НачалоПериода - 86400*7;
	КонецПериода	= КонецПериода - 86400*7;
	ЗаполнитьЭлементыПланировщика();
	
КонецПроцедуры

&НаКлиенте
Процедура Сегодня(Команда)
	
	НачалоПериода	= НачалоНеделиСервер(ТекущаяДата());
	КонецПериода	= КонецНеделиСервер(ТекущаяДата());
	ЗаполнитьЭлементыПланировщика();
	
КонецПроцедуры

&НаКлиенте
Процедура СоздатьЗанятиеНаКлиенте(ДатаНачалаЗанятия)
	
	Ученик = Неопределено;
	Дисциплина = Неопределено;
	ДлительностьЗанятия = 0;
	
	ПараметрыФормы = Новый Структура;
	ПараметрыФормы.Вставить("МножественныйВыбор", Ложь);
	ПараметрыФормы.Вставить("ВыборГруппИЭлементов", ИспользованиеГруппИЭлементов.Элементы);
	
	ДополнительныеПараметры = Новый Структура("ДатаНачалаЗанятия", ДатаНачалаЗанятия);
	
	ОписаниеОповещения = Новый ОписаниеОповещения("ВыборУченикаЗавершение", ЭтаФорма, ДополнительныеПараметры);	
	ОткрытьФорму("Справочник.Обучающиеся.ФормаВыбора", ПараметрыФормы, ЭтаФорма, ЭтаФорма.УникальныйИдентификатор, , , ОписаниеОповещения);
	
КонецПроцедуры

&НаКлиенте
Процедура ВыборУченикаЗавершение(ВыбранноеЗначение, ДополнительныеПараметры) Экспорт
	
	Если ВыбранноеЗначение = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	ДополнительныеПараметры.Вставить("Ученик", ВыбранноеЗначение);
	
	ВыборДисциплины(ДополнительныеПараметры);
	
КонецПроцедуры

&НаКлиенте
Процедура ВыборДисциплины(ДополнительныеПараметры)
	
	ОписаниеОповещения = Новый ОписаниеОповещения("ВыборДисциплиныЗавершение", ЭтаФорма, ДополнительныеПараметры);
	
	ПоказатьВводЗначения(ОписаниеОповещения, 
						 ПредопределенноеЗначение("Перечисление.ДисциплиныЗанятий.ПустаяСсылка"), 
						 "Выберите дисциплину", 
						 Новый ОписаниеТипов("ПеречислениеСсылка.ДисциплиныЗанятий"));
	
КонецПроцедуры

&НаКлиенте
Процедура ВыборДисциплиныЗавершение(ВыбранноеЗначение, ДополнительныеПараметры) Экспорт
	
	Если ВыбранноеЗначение = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	ДополнительныеПараметры.Вставить("Дисциплина", ВыбранноеЗначение);
	
	ВыборДлительностиЗанятия(ДополнительныеПараметры);
	
КонецПроцедуры

&НаКлиенте
Процедура ВыборДлительностиЗанятия(ДополнительныеПараметры)
	
	ПараметрыФормы = Новый Структура;
	ПараметрыФормы.Вставить("МножественныйВыбор", Ложь);
	ПараметрыФормы.Вставить("ВыборГруппИЭлементов", ИспользованиеГруппИЭлементов.Элементы);
	
	ОписаниеОповещения = Новый ОписаниеОповещения("ВыборДлительностиЗанятияЗавершение", ЭтаФорма, ДополнительныеПараметры);	
	ОткрытьФорму("Справочник.ДлительностьЗанятий.ФормаВыбора", ПараметрыФормы, ЭтаФорма, ЭтаФорма.УникальныйИдентификатор, , , ОписаниеОповещения);
		
КонецПроцедуры

&НаКлиенте
Процедура ВыборДлительностиЗанятияЗавершение(ВыбранноеЗначение, ДополнительныеПараметры) Экспорт
	
	Если ВыбранноеЗначение = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	ДополнительныеПараметры.Вставить("ДлительностьЗанятия", ВыбранноеЗначение);
	
	ПараметрыФормы = Новый Структура;
	ПараметрыФормы.Вставить("ДатаНачалаЗанятия",	ДополнительныеПараметры.ДатаНачалаЗанятия);
	ПараметрыФормы.Вставить("Обучающийся",			ДополнительныеПараметры.Ученик);
	ПараметрыФормы.Вставить("ДлительностьЗанятия",	ДополнительныеПараметры.ДлительностьЗанятия);
	ПараметрыФормы.Вставить("Дисциплина",			ДополнительныеПараметры.Дисциплина);
	
	ОписаниеОповещения = Новый ОписаниеОповещения("СозданиеРедактированиеЗанятияЗавершение", ЭтаФорма);
	
	ОткрытьФорму("Документ.Занятия.Форма.ФормаДокумента", ПараметрыФормы, ЭтаФорма, , , , ОписаниеОповещения , РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);
	
КонецПроцедуры

&НаКлиенте
Процедура СозданиеРедактированиеЗанятияЗавершение(ВыбранноеЗначение, ДополнительныеПараметры) Экспорт

	ЗаполнитьЭлементыПланировщика();
	
КонецПроцедуры
	
#Область РаботаСоСтатусом

&НаКлиенте
Процедура Проведено(Команда)
	
	Если Элементы.Расписание.ВыделенныеЭлементы.Количество() = 0 Тогда 
		Возврат; 
	Конецесли;
	
	Занятие = Элементы.Расписание.ВыделенныеЭлементы[0].Значение;
	
	СтатусЗанятия = ПредопределенноеЗначение("Перечисление.СтатусыЗанятий.Проведено");
	
	РаботаСДокументамиВызовСервера.СменитьСтатусЗанятия(Занятие, СтатусЗанятия);
	
	ЗаполнитьЭлементыПланировщика();
	
КонецПроцедуры

&НаКлиенте
Процедура Подтвердить(Команда)
	
	Если Элементы.Расписание.ВыделенныеЭлементы.Количество() = 0 Тогда 
		Возврат; 
	Конецесли;
	
	Занятие = Элементы.Расписание.ВыделенныеЭлементы[0].Значение;
	
	СтатусЗанятия = ПредопределенноеЗначение("Перечисление.СтатусыЗанятий.Подтверждено");
	
	РаботаСДокументамиВызовСервера.СменитьСтатусЗанятия(Занятие, СтатусЗанятия);
	
	ЗаполнитьЭлементыПланировщика();
	
КонецПроцедуры

&НаКлиенте
Процедура Перенести(Команда)
	
	Если Элементы.Расписание.ВыделенныеЭлементы.Количество() = 0 Тогда 
		Возврат; 
	Конецесли;
	
	ДатаНовогоЗанятия = Дата(1,1,1);
	Занятие = Элементы.Расписание.ВыделенныеЭлементы[0];
	СтатусЗанятия = ПолучитьСтатусЗанятия(Занятие.Значение);
	Продолжительность = Занятие.Конец - Занятие.Начало;
	
	Если СтатусЗанятия = ПредопределенноеЗначение("Перечисление.СтатусыЗанятий.Перенесено") Тогда 
		ПоказатьПредупреждение(, "Занятие уже было перенесено!");
		Возврат; 
	КонецЕсли;
	
	Если СтатусЗанятия = ПредопределенноеЗначение("Перечисление.СтатусыЗанятий.Проведено") Тогда
		ПоказатьПредупреждение(, "Нельзя переносить проведенные занятия!");
		Возврат;
	КонецЕсли;
		
	Если СтатусЗанятия = ПредопределенноеЗначение("Перечисление.СтатусыЗанятий.ПроведеноИОплачено") Тогда
		ПоказатьПредупреждение(, "Занятие проведено и оплачено, перенос невозможен");
		Возврат;
	КонецЕсли;

	ДополнительныеПараметры = Новый Структура;
	ДополнительныеПараметры.Вставить("ЗанятиеСсылка", Занятие.Значение);
	ДополнительныеПараметры.Вставить("Продолжительность", Продолжительность);
	
	ОписаниеОповещения = Новый ОписаниеОповещения("ПеренестиЗавершение", ЭтаФорма, ДополнительныеПараметры);
	ДатаНовогоЗанятия = ОткрытьФорму("ОбщаяФорма.ВвестиДатуФормат", , ЭтаФорма, , , , ОписаниеОповещения, РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);
		
КонецПроцедуры

&НаКлиенте
Процедура ПеренестиЗавершение(ДатаНовогоЗанятия, ДополнительныеПараметры) Экспорт
	
	Если Не ЗначениеЗаполнено(ДатаНовогоЗанятия) Тогда 
		Возврат; 
	КонецЕсли;
	
	ЗанятиеСсылка = ДополнительныеПараметры.ЗанятиеСсылка;
	Продолжительность = ДополнительныеПараметры.Продолжительность;
	ДатаОкончанияЗанятия = ДатаНовогоЗанятия + Продолжительность;
	
	Преподаватель = ПолучитьПреподавателяЗанятия(ЗанятиеСсылка);
	
	СообщениеОПересечении = РаботаСДокументамиВызовСервера.НайтиПересечениеВремениЗанятий(
															ЗанятиеСсылка, 
															ДатаНовогоЗанятия, 
															ДатаОкончанияЗанятия, 
															Преподаватель, 
															Продолжительность);
															
	Если СообщениеОПересечении <> "" Тогда
		ПоказатьПредупреждение(, СообщениеОПересечении);
		Возврат;
	КонецЕсли;
	
	
	ТекстВопроса = "Вы уверены, что хотите перенести занятие?" 
					+ Символы.ПС 
					+ "Новая дата занятия - " 
					+ Формат(ДатаНовогоЗанятия,"ДФ='dddd, dd MMM yyyy HH:mm:ss'");
					
	ДополнительныеПараметры.Вставить("ДатаНовогоЗанятия", ДатаНовогоЗанятия);				
					
	ОписаниеОповещения = Новый ОписаниеОповещения("ПеренестиЗавершениеОтветНаВопрос", ЭтаФорма, ДополнительныеПараметры);	
	
	ПоказатьВопрос(ОписаниеОповещения, ТекстВопроса, РежимДиалогаВопрос.ДаНет, , КодВозвратаДиалога.Да, "Внимание!");
		
КонецПроцедуры

&НаКлиенте
Процедура ПеренестиЗавершениеОтветНаВопрос(Ответ, ДополнительныеПараметры) Экспорт
	
	Если Ответ <> КодВозвратаДиалога.Да Тогда
		Возврат;
	КонецЕсли;
	
	ЗанятиеСсылка = ДополнительныеПараметры.ЗанятиеСсылка;
	ДатаНовогоЗанятия = ДополнительныеПараметры.ДатаНовогоЗанятия;
	
	СтатусЗанятия = ПредопределенноеЗначение("Перечисление.СтатусыЗанятий.Перенесено");
	
	ЕстьОплатаЗанятия = РаботаСДокументамиВызовСервера.ЕстьОплатаЗанятия(ЗанятиеСсылка);
	
	РаботаСДокументамиВызовСервера.СменитьСтатусЗанятия(ЗанятиеСсылка, СтатусЗанятия);
	
	РаботаСДокументамиВызовСервера.СоздатьНовоеЗанятиеПоИсходному(ЗанятиеСсылка, ДатаНовогоЗанятия, ЕстьОплатаЗанятия);
		
	ЗаполнитьЭлементыПланировщика();
	
КонецПроцедуры

&НаКлиенте
Процедура Отменить(Команда)
	
	Если Элементы.Расписание.ВыделенныеЭлементы.Количество() = 0 Тогда Возврат; Конецесли;
	
	Занятие = Элементы.Расписание.ВыделенныеЭлементы[0].Значение;
	СтатусЗанятия = ПредопределенноеЗначение("Перечисление.СтатусыЗанятий.Отменено");
	
	РаботаСДокументамиВызовСервера.СменитьСтатусЗанятия(Занятие, СтатусЗанятия);
	
	ЗаполнитьЭлементыПланировщика();
	
КонецПроцедуры

&НаКлиенте
Процедура ПодтвердитьОплату(Команда)
	
	Если Элементы.Расписание.ВыделенныеЭлементы.Количество() = 0 Тогда Возврат; Конецесли;
	
	Занятие = Элементы.Расписание.ВыделенныеЭлементы[0].Значение;
	СтатусЗанятия = ПредопределенноеЗначение("Перечисление.СтатусыЗанятий.Оплачено");
	
	РаботаСДокументамиВызовСервера.СменитьСтатусЗанятия(Занятие, СтатусЗанятия);
	
	ЗаполнитьЭлементыПланировщика();
	
КонецПроцедуры

&НаСервере
Функция ПолучитьСтатусЗанятия(Занятие)
	Возврат РегистрыСведений.СтатусыЗанятий.ПолучитьСтатусЗанятия(Занятие);	
КонецФункции

#КонецОбласти

&НаСервере
Функция ПолучитьПреподавателяЗанятия(Занятие)
	
	Преподаватель = Справочники.Пользователи.ПустаяСсылка();
	
	Запрос = Новый Запрос("ВЫБРАТЬ
	                      |	Занятия.Преподаватель
	                      |ИЗ
	                      |	Документ.Занятия КАК Занятия
	                      |ГДЕ
	                      |	Занятия.Ссылка = &Ссылка");
	
	Запрос.УстановитьПараметр("Ссылка", Занятие);
	
	Результат = Запрос.Выполнить();
	
	Если Результат.Пустой() Тогда
		Возврат Преподаватель;
	КонецЕсли;
	
	Выборка = Результат.Выбрать();
	Выборка.Следующий();
	
	Преподаватель = Выборка.Преподаватель;
	
	Возврат Преподаватель;
	
КонецФункции

&НаКлиенте
Процедура РасписаниеОбработкаФормированияКоманд(Элемент, Параметры, Команды, КомандаПоУмолчанию)
	Если Элементы.Расписание.ВыделенныеЭлементы.Количество() = 0 Тогда
		Элементы.Расписание.КонтекстноеМеню.ПодчиненныеЭлементы.грРаботаСДокументом.Доступность = Ложь;
		Возврат;
	Иначе
		Элементы.Расписание.КонтекстноеМеню.ПодчиненныеЭлементы.грРаботаСДокументом.Доступность = Истина;
	КонецЕсли;
	
	Занятие = Элементы.Расписание.ВыделенныеЭлементы[0];
	СтатусЗанятия = ПолучитьСтатусЗанятия(Занятие.Значение);
	Если СтатусЗанятия = ПредопределенноеЗначение("Перечисление.СтатусыЗанятий.Перенесено") Тогда
		Элементы.Расписание.КонтекстноеМеню.ПодчиненныеЭлементы.грРаботаСДокументом.Доступность = Ложь;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПовторитьЗанятие(Команда)
	
	// dev??
	//СообщениеОПересечении = РаботаСДокументамиВызовСервера.НайтиПересечениеВремениЗанятий(Занятие.Значение, ДатаНовогоЗанятия, ДатаНовогоЗанятия+Продолжительность, Преподаватель);

	//Если СообщениеОПересечении <> "" Тогда
	//	Ответ = Вопрос(СообщениеОПересечении + Символы.ПС + "Продолжить операцию?", РежимДиалогаВопрос.ДаНет,, КодВозвратаДиалога.Нет);
	//	Если Ответ = КодВозвратаДиалога.Нет Тогда
	//		Возврат;
	//	КонецЕсли;
	//КонецЕсли;
	
	Если Элементы.Расписание.ВыделенныеЭлементы.Количество() = 0 Тогда 
		Возврат; 
	Конецесли;
	
	Занятие = Элементы.Расписание.ВыделенныеЭлементы[0].Значение;
	
	ДополнительныеПараметры = Новый Структура;
	ДополнительныеПараметры.Вставить("Занятие", Занятие);
	
	ОписаниеОповещения = Новый ОписаниеОповещения("ПовторитьЗанятиеЗавершение", ЭтаФорма, ДополнительныеПараметры);
	
	ПоказатьВводЗначения(ОписаниеОповещения, 
						 ПредопределенноеЗначение("Перечисление.ТипыПродленияЗанятий.ПустаяСсылка"),
						 "На какой срок продлить занятия?",
						 Новый ОписаниеТипов("ПеречислениеСсылка.ТипыПродленияЗанятий"));
						 
КонецПроцедуры

&НаКлиенте
Процедура ПовторитьЗанятиеЗавершение(ТипПродления, ДополнительныеПараметры) Экспорт
	
	Если ТипПродления = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	Занятие = ДополнительныеПараметры.Занятие;
	
	КоличествоПродлений = РаботаСДокументамиВызовСервера.ПолучитьКоличествоЗанятийПоТипуПродления(ТипПродления, Занятие);
	
	Если КоличествоПродлений <= 0 Тогда 
		Сообщить("Занятия не были продлены (количество для продлений 0)"); 
		Возврат; 
	КонецЕсли;
	
	ТекстПредупреждения = РаботаСДокументамиВызовСервера.ПовторитьЗанятиеНаСервере(Занятие, КоличествоПродлений);
	
	ПоказатьПредупреждение(, ТекстПредупреждения,, "Отчет о создании занятий");
	
КонецПроцедуры
					 
&НаСервере
Функция НачалоНеделиСервер(Дата)
	
	Возврат НачалоНедели(Дата);
	
КонецФункции

&НаСервере
Функция КонецНеделиСервер(Дата)
	
	Возврат КонецНедели(Дата);
	
КонецФункции