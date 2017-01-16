-- Napisz zapytanie w języku SQL wyświetlające informacje na temat zamówień (data realizacji, idzamowienia), które:

-- zostały złożone przez klienta, który ma na imię Antoni,
select datarealizacji, idzamowienia, nazwa from zamowienia
natural join klienci
where nazwa like '% Antoni%';

-- zostały złożone przez klientów z mieszkań (zwróć uwagę na pole ulica),
select datarealizacji, idzamowienia, ulica from zamowienia
natural join klienci
where ulica not like '%/%';

-- zostały złożone przez klienta z Krakowa do realizacji w listopadzie 2013 roku.
select datarealizacji, idzamowienia, datarealizacji, miejscowosc from zamowienia
natural join klienci
where miejscowosc = 'Kraków'
	and extract(month from datarealizacji) = 11;
