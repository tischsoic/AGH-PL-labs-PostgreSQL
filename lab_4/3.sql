-- Napisz zapytanie w języku SQL wyświetlające informacje na temat klientów (nazwa, ulica, miejscowość), którzy:


-- złożyli zamówienia z datą realizacji nie starszą niż sprzed pięciu lat,
select nazwa, ulica, miejscowosc, datarealizacji from klienci
natural join zamowienia
where datarealizacji >= now() - '5 years'::interval;


-- zamówili pudełko Kremowa fantazja lub Kolekcja jesienna,
select klienci.nazwa, ulica, miejscowosc, pudelka.nazwa from klienci
natural join zamowienia
natural join artykuly
join pudelka using (idpudelka)
where pudelka.nazwa in ('Kremowa fantazja', 'Kolekcja jesienna');


-- złożyli przynajmniej jedno zamówienie,
select distinct on (idklienta) idklienta, nazwa, ulica, miejscowosc, idzamowienia from klienci
natural join zamowienia
where idzamowienia is not null;
-- distinct sprawia, że brany jest ostatni ze zduplikowanych wierszy.


-- nie złożyli żadnych zamówień,
select idklienta, nazwa, ulica, miejscowosc, idzamowienia from klienci
left join zamowienia using (idklienta)
where idzamowienia is null;
-- lub
-- na outer joinie .......


-- złożyli zamówienia z datą realizacji w listopadzie 2013,
select nazwa, ulica, miejscowosc, string_agg(datarealizacji::text, ', ') from klienci
natural join zamowienia
where extract(month from datarealizacji) = 11
		and extract(year from datarealizacji) = 2013
group by idklienta;


-- zamówili co najmniej 2 sztuki pudełek Kremowa fantazja lub Kolekcja jesienna w ramach jednego zamówienia,
select nazwa, ulica, miejscowosc, string_agg(datarealizacji::text, ', ') from klienci
	natural join zamowienia
	natural join artykuly
	join pudelka using (idpudelka)
where extract(month from datarealizacji) = 11
		and extract(year from datarealizacji) = 2013
group by idklienta;
-- u góry nie dokończone, poniżej autora Patrika Taslera:
select k.nazwa, k.ulica, k.miejscowosc, a.sztuk, p.nazwa
from artykuly a
    join zamowienia using(idzamowienia)
    join klienci k using(idklienta)
    join pudelka p using(idpudelka)
where a.sztuk >= 2
    and p.nazwa in ('Kremowa fantazja','Kolekcja jesienna');

-- zamówili pudełka, które zawierają czekoladki z migdałami.
select klienci.nazwa, ulica, miejscowosc, string_agg(orzechy::text, ', ')
from klienci
	natural join zamowienia
	natural join artykuly
	join pudelka using (idpudelka)
	join zawartosc using (idpudelka)
	join czekoladki using (idczekoladki)
where orzechy = 'migdały'
group by idklienta;
