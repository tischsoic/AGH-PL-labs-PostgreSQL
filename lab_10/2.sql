-- baza danych: cukiernia

-- Napisz zapytanie wyświetlające informacje na temat zamówień (dataRealizacji, idzamowienia)
-- używając odpowiedniego operatora in/not in/exists/any/all, które:



-- zostały złożone przez klienta, który ma na imię Antoni,
select idzamowienia, dataRealizacji, nazwa
from zamowienia
    natural join klienci
where klienci.idklienta in (select idklienta from klienci where nazwa like '% Antoni');

select idzamowienia, dataRealizacji, nazwa
from zamowienia
    natural join klienci
where klienci.idklienta = some (select idklienta from klienci where nazwa like '% Antoni');

select idzamowienia, dataRealizacji, nazwa
from zamowienia
    natural join klienci
where klienci.idklienta = any (select idklienta from klienci where nazwa like '% Antoni');


-- zostały złożone przez klientów z mieszkań (zwróć uwagę na pole ulica),
select idzamowienia, dataRealizacji, ulica
from zamowienia
    natural join klienci
where klienci.idklienta in (select idklienta from klienci where ulica like '%/%');


-- zostały złożone przez klienta z Krakowa do realizacji w listopadzie 2013 roku.
select idzamowienia, dataRealizacji, dataRealizacji
from zamowienia
    natural join klienci
where date_part('year', dataRealizacji) = '2013'
    and date_part('month', dataRealizacji) = '11'
    and klienci.idklienta = any (select idklienta from klienci where miejscowosc = 'Kraków');
