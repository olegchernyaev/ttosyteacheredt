
Процедура ОбработкаПроведения(Отказ, Режим)
	ТаблицаУроки = Занятие.Уроки.Выгрузить();
	Движения.ОплатаЗанятий.Записывать = Истина;
	
	Для Каждого ТекСтрокаУроки Из ТаблицаУроки Цикл
		Движение = Движения.ОплатаЗанятий.Добавить();
		Движение.Период					= ТекущаяДата();
		Движение.Занятие					= Занятие;
		Движение.СуммаОплаты		= ТекСтрокаУроки.Сумма;
	КонецЦикла;

КонецПроцедуры
