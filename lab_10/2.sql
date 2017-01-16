-- baza danych: cukiernia

-- Napisz zapytanie wyświetlające informacje na temat zamówień (dataRealizacji, idzamowienia) używając odpowiedniego operatora in/not in/exists/any/all, które:

-- zostały złożone przez klienta, który ma na imię Antoni,
select idzamowienia, dataRealizacji
from zamowienia
    natural join klienci
where klienci.nazwa in any (select nazwa from klienci where nazwa like '% Antoni');


-- zostały złożone przez klientów z mieszkań (zwróć uwagę na pole ulica),



-- zostały złożone przez klienta z Krakowa do realizacji w listopadzie 2013 roku.
