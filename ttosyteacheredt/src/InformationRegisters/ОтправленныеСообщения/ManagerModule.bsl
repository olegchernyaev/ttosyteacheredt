Процедура ЗафиксироватьОтправку(КлиентСсылка, ТемаРассылки, Отправлено) Экспорт
	
	МЗ = РегистрыСведений.ОтправленныеСообщения.СоздатьМенеджерЗаписи();
	МЗ.Клиент = КлиентСсылка;
	МЗ.ТемаРассылки = ТемаРассылки;
	МЗ.Отправлено	= Отправлено;	
	МЗ.Записать();
	
КонецПроцедуры