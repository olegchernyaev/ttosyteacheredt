
Процедура ОбработкаПолученияПолейПредставления(Поля, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	Поля.Добавить("Наименование");
	Поля.Добавить("Родитель");
	
КонецПроцедуры

Процедура ОбработкаПолученияПредставления(Данные, Представление, СтандартнаяОбработка)

	СтандартнаяОбработка = Ложь; // Почему ложь?
	Представление = Данные.Description + ?(ЗначениеЗаполнено(Данные.parent), " (" + Данные.parent.Наименование + ")", "");
  
КонецПроцедуры


