
#Область ОбработчикиСобытий

Процедура ПриКомпоновкеРезультата(ДокументРезультат, ДанныеРасшифровки, СтандартнаяОбработка)
	
	СхемаЗапроса = Новый СхемаЗапроса;
	ПакетЗапроса = СхемаЗапроса.ПакетЗапросов[0];
	
	Для Каждого Документ Из Метаданные.Документы Цикл
		
		Оператор = ПакетЗапроса.Операторы.Добавить();
		ТаблицаДокумента = Оператор.Источники.Добавить(Документ.ПолноеИмя(), "Док" + Документ.Имя);
		
		ПолеСсылка = ДобавитьПолеСхемыЗапроса(Оператор, ТаблицаДокумента, "Ссылка", 0);
		ПолеДата = ДобавитьПолеСхемыЗапроса(Оператор, ТаблицаДокумента, "Дата", 1);
		ПолеНомер = ДобавитьПолеСхемыЗапроса(Оператор, ТаблицаДокумента, "Номер", 2);
		ПолеПроведен = ДобавитьПолеСхемыЗапроса(Оператор, ТаблицаДокумента, "Проведен", 3);
		ПолеКоличество = ДобавитьПолеСхемыЗапроса(Оператор, ТаблицаДокумента, "ДокКоличество", 4, Ложь);
		
	КонецЦикла;
	
	ПакетЗапроса.Операторы.Удалить(0);
	
	СхемаКомпоновкиДанных.НаборыДанных.НаборДанных1.Запрос = СхемаЗапроса.ПолучитьТекстЗапроса();		
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ДобавитьПолеСхемыЗапроса(Оператор, ТаблицаДокумента, ИмяПоля, ИндексКолонки, ЭтоПолеТаблицы = Истина)
	
	ДопустимоеПоле = Неопределено;
	
	Если ЭтоПолеТаблицы Тогда 
		ДопустимоеПоле = ТаблицаДокумента.Источник.ДоступныеПоля.Найти(ИмяПоля);
	КонецЕсли;
	
	Если ДопустимоеПоле = Неопределено Тогда
		Поле = Оператор.ВыбираемыеПоля.Добавить("&" + ИмяПоля, ИндексКолонки);
	Иначе
		Поле = Оператор.ВыбираемыеПоля.Добавить(ДопустимоеПоле, ИндексКолонки);
	КонецЕсли;
	
	Возврат Поле;
	
КонецФункции

#КонецОбласти

