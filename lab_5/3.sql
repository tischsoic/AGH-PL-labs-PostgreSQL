-- Napisz zapytanie w języku SQL wyświetlające informacje na temat:

-- liczby zamówień na poszczególne dni,
select datarealizacji, count(*)
from zamowienia
group by datarealizacji;


-- łącznej liczby wszystkich zamówień,
select count(*) from zamowienia;


-- łącznej wartości wszystkich zamówień,
select sum(cena * sztuk)
from artykuly
    natural join pudelka;


-- klientów, liczby złożonych przez nich zamówień i łącznej wartości złożonych przez nich zamówień.
select klienci.nazwa, count(idzamowienia), sum(cena * sztuk)
from klienci
    natural join zamowienia
    natural join artykuly
    join pudelka using (idpudelka)
group by idklienta;
