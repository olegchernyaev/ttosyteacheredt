
&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	Элементы.Результат.ОтображениеСостояния.Видимость= Ложь;
	Элементы.Результат.ОтображениеСостояния.ДополнительныйРежимОтображения = ДополнительныйРежимОтображения.НеИспользовать;
	
	СформироватьОтчетНаСервере();
	
КонецПроцедуры


&НаСервере
Процедура СформироватьОтчетНаСервере()
    ЭтотОтчет = РеквизитФормыВЗначение("Отчет");
    ЭтотОтчет.СкомпоноватьРезультат(Результат);
КонецПроцедуры 