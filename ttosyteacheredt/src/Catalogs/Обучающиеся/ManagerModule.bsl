
Процедура ОбработкаПолученияПолейПредставления(Поля, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	Поля.Добавить("Наименование");
	Поля.Добавить("Родитель");
	
КонецПроцедуры

Процедура ОбработкаПолученияПредставления(Данные, Представление, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	Представление = Данные.Наименование + ?(ЗначениеЗаполнено(Данные.Родитель), " (" + Данные.Родитель.Наименование + ")", "");
	
КонецПроцедуры


