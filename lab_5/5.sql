-- Napisz zapytanie w języku SQL wyświetlające informacje na temat:

-- Uwaga: Upewnij się, że zapytania zwracają sensowne dane, np. liczba zamówień w styczniu niezależnie od roku jest bezsensowna.


-- liczby zamówień na poszczególne kwartały,
select extract(year from datarealizacji) as rok,
    extract(quarter from datarealizacji) as kwartal,
    count(*) as liczba_zamowien_w_kwartale
from zamowienia
group by rok, kwartal;


-- liczby zamówień na poszczególne miesiące,
select extract(year from datarealizacji) as rok,
    extract(month from datarealizacji) as miesiac,
    count(*) as liczba_zamowien_w_miesiacu
from zamowienia
group by rok, miesiac;


-- liczby zamówień do realizacji w poszczególnych tygodniach,
select extract(year from datarealizacji) as rok,
    extract(week from datarealizacji) as tydzien,
    count(*) as liczba_zamowien_w_tygodniu
from zamowienia
group by rok, tydzien;


-- liczby zamówień do realizacji w poszczególnych miejscowościach.
select klienci.miejscowosc, count(*) as liczba_zamowien_na_dana_miejscowosc
from zamowienia
    natural join klienci
group by klienci.miejscowosc;
