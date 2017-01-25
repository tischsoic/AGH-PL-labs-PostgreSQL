-- baza danych: cukiernia
--
-- Napisz zapytanie wyświetlające informacje na temat klientów (nazwa, ulica, miejscowość),
-- używając odpowiedniego operatora in/not in/exists/any/all, którzy:
--
-- złożyli zamówienia z datą realizacji 12.11.2013,
select nazwa, ulica, miejscowosc
from klienci
where klienci.idklienta in
    (select idklienta from zamowienia where dataRealizacji = '12.11.2013');

-- złożyli zamówienia z datą realizacji w listopadzie 2013,
select nazwa, ulica, miejscowosc
from klienci
where klienci.idklienta in
    (select idklienta
        from zamowienia
        where date_part('year', dataRealizacji) = '2013'
        and date_part('month', dataRealizacji) = '11'
    );

-- zamówili pudełko Kremowa fantazja lub Kolekcja jesienna,
select nazwa, ulica, miejscowosc
from klienci
where klienci.idklienta in
    (select idklienta
        from zamowienia
        natural join artykuly
        natural join pudelka
        where nazwa = 'Kremowa fantazja'
            or nazwa = 'Kolekcja jesienna'
    );

-- zamówili co najmniej 2 sztuki pudełek Kremowa fantazja lub Kolekcja jesienna
-- w ramach jednego zamówienia,
select nazwa, ulica, miejscowosc
from klienci
where klienci.idklienta in
    (select idklienta
        from zamowienia
        natural join artykuly
        natural join pudelka
        where (nazwa = 'Kremowa fantazja' or nazwa = 'Kolekcja jesienna')
            and sztuk >= 2
    );


-- zamówili pudełka, które zawierają czekoladki z migdałami,
select nazwa, ulica, miejscowosc
from klienci
where klienci.idklienta in
    (select idklienta
        from zamowienia
        natural join artykuly
        natural join pudelka
        join zawartosc using(idpudelka)
        join czekoladki using(idczekoladki)
        where orzechy = 'migdały'
    );

-- złożyli przynajmniej jedno zamówienie,
select nazwa, ulica, miejscowosc
from klienci
where klienci.idklienta in
    (select idklienta
        from zamowienia
    );

select nazwa, ulica, miejscowosc
from klienci
where exists
    (select 1
        from zamowienia
        where zamowienia.idklienta = klienci.idklienta
    );

-- nie złożyli żadnych zamówień.
select nazwa, ulica, miejscowosc
from klienci
where not exists
    (select 1
        from zamowienia
        where zamowienia.idklienta = klienci.idklienta
    );
