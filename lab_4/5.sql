-- Napisz zapytanie w języku SQL wyświetlające informacje na temat pudełek
-- z czekoladkami (nazwa, opis, cena), które (uwaga: może być konieczne użycie
-- konstrukcji z poprzednich laboratoriów):

-- W każdym zapytaniu należy dodać dodatkowe pola (poza danymi o pudełkach), które pozwolą sprawdzić, czy wynik jest poprawny.
--
-- Uwaga: Zdania: “Pudełko nie zawiera czekoladek w gorzkiej czekoladzie.” i “Pudełko zawiera jakieś czekoladki, które nie są w gorzkiej czekoladzie” nie oznaczają tego samego ;)
--
-- Wskazówka: W punktach 5 i 7 można wykorzystać operator EXCEPT.



-- zawierają czekoladki o wartości klucza głównego d09
select pudelka.nazwa, pudelka.opis, string_agg(czekoladki.idczekoladki::text, ', ')
from pudelka
    natural join zawartosc
    left join czekoladki using (idczekoladki)
where czekoladki.idczekoladki = 'd09'
group by idpudelka;


-- zawierają przynajmniej jedną czekoladkę, której nazwa zaczyna się na S,
select pudelka.nazwa, pudelka.opis, string_agg(czekoladki.idczekoladki::text, ', '), string_agg(czekoladki.nazwa::text, ', ')
from pudelka
    natural join zawartosc
    left join czekoladki using (idczekoladki)
where czekoladki.nazwa like 'S%'
group by idpudelka;


-- zawierają przynajmniej 4 sztuki czekoladek jednego gatunku (o takim samym kluczu głównym),
select pudelka.nazwa, pudelka.opis, string_agg(czekoladki.idczekoladki::text, ', '), string_agg(zawartosc.sztuk::text, ', ')
from pudelka
    natural join zawartosc
    left join czekoladki using (idczekoladki)
where zawartosc.sztuk >= 4
group by idpudelka;


-- zawierają czekoladki z nadzieniem truskawkowym,
select pudelka.nazwa, pudelka.opis, string_agg(czekoladki.idczekoladki::text, ', '), string_agg(czekoladki.nadzienie::text, ', ')
from pudelka
    natural join zawartosc
    left join czekoladki using (idczekoladki)
where czekoladki.nadzienie = 'truskawki'
group by idpudelka;


-- nie zawierają czekoladek w gorzkiej czekoladzie,
select pudelka.nazwa, pudelka.opis
from pudelka
    natural join zawartosc
    left join czekoladki using (idczekoladki)
group by idpudelka
    except
select pudelka.nazwa, pudelka.opis
from pudelka
    natural join zawartosc
    left join czekoladki using (idczekoladki)
where czekoladki.czekolada = 'gorzka'
group by idpudelka;


-- zawierają co najmniej 3 sztuki czekoladki Gorzka truskawkowa,
select pudelka.nazwa, pudelka.opis, string_agg(czekoladki.nazwa::text, ', '), string_agg(zawartosc.sztuk::text, ', ')
from pudelka
    natural join zawartosc
    left join czekoladki using (idczekoladki)
where zawartosc.sztuk >= 3
    and czekoladki.nazwa = 'Gorzka truskawkowa'
group by idpudelka;


-- nie zawierają czekoladek z orzechami,
select pudelka.nazwa, pudelka.opis
from pudelka
    natural join zawartosc
    left join czekoladki using (idczekoladki)
group by idpudelka
    except
select pudelka.nazwa, pudelka.opis
from pudelka
    natural join zawartosc
    left join czekoladki using (idczekoladki)
where czekoladki.orzechy is not null
group by idpudelka;


-- zawierają czekoladki Gorzka truskawkowa,
select pudelka.nazwa, pudelka.opis, string_agg(czekoladki.nazwa::text, ', '), string_agg(zawartosc.sztuk::text, ', ')
from pudelka
    natural join zawartosc
    left join czekoladki using (idczekoladki)
where zawartosc.sztuk >= 1
    and czekoladki.nazwa = 'Gorzka truskawkowa'
group by idpudelka;


-- zawierają przynajmniej jedną czekoladkę bez nadzienia.
select pudelka.nazwa, pudelka.opis, string_agg(czekoladki.nadzienie::text, ', '), string_agg(zawartosc.sztuk::text, ', ')
from pudelka
    natural join zawartosc
    left join czekoladki using (idczekoladki)
where zawartosc.sztuk >= 1
    and czekoladki.nadzienie is null
group by idpudelka;
