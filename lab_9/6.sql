-- Napisz zapytanie działające na tabelach bazy danych firma, które:
--
-- Wyświetla nazwisko, wiek oraz roczne pobory pracownika posortowane wg poborów
-- oraz nazwiska (pole pobory w tabeli pracownicy określa pobory miesięczne).
-- https://www.postgresql.org/message-id/200105181553.IAA13471@smtp3.tksoft.com
select nazwisko, date_part('year', age(dataUrodzenia)), pobory * 12
from testy.pracownicy
order by pobory, nazwisko;

-- Wyświetla nazwisko, imię, datę urodzenia, stanowisko, dział i pobory
-- pracownika, który pracuje na stanowisku robotnik lub analityk i zarabia
-- więcej niż 2000 miesięcznie.
select nazwisko, imie, date_part('year', age(dataUrodzenia)), stanowisko, dzialy.nazwa, pobory
from testy.pracownicy
natural join testy.dzialy
where pobory > 2000 and stanowisko in ('robotnik', 'analityk');

-- Wyświetla nazwiska i imiona pracowników, którzy zarabiają więcej niż
-- zarabia Adam Kowalik.
select p1.nazwisko, p1.imie
from testy.pracownicy as p1, testy.pracownicy as p2
where p2.nazwisko = 'Kowalik' and p2.imie = 'Adam' and p1.pobory > p2.pobory;


-- Podnosi zarobki o 10% na stanowisku robotnik.
update testy.pracownicy
    set pobory = 1.10 * pobory;

-- Oblicza średnie zarobki oraz ilość pracowników na poszczególnych
-- stanowiskach z wyłączeniem stanowisk kierownik.
select avg(pobory), count(*), dzialy.nazwa
from testy.pracownicy
natural join testy.dzialy
where dzialy.nazwa != 'kierownik'
group by dzialy.nazwa;
