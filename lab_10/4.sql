-- baza danych: cukiernia
--
-- Napisz zapytanie wyświetlające informacje na temat pudełek z czekoladkami
-- (nazwa, opis, cena), używając odpowiedniego operatora,
-- np. in/not in/exists/any/all, które:



-- zawierają czekoladki o wartości klucza głównego D09
select nazwa, opis, cena
from pudelka
where idpudelka in (
        select idpudelka
        from zawartosc
        where idczekoladki = 'd09'
    );

-- zawierają czekoladki Gorzka truskawkowa,
select nazwa, opis, cena
from pudelka
where idpudelka in (
        select idpudelka
        from zawartosc
        natural join czekoladki
        where czekoladki.nazwa = 'Gorzka truskawkowa'
    );

-- zawierają przynajmniej jedną czekoladkę, której nazwa zaczyna się na S,
select nazwa, opis, cena
from pudelka
where idpudelka in (
        select idpudelka
        from zawartosc
        natural join czekoladki
        where czekoladki.nazwa like 'S%'
    );

-- zawierają przynajmniej 4 sztuki czekoladek jednego gatunku
-- (o takim samym kluczu głównym),
select nazwa, opis, cena
from pudelka
where idpudelka in (
        select idpudelka
        from zawartosc
        natural join czekoladki
        group by idczekoladki, idpudelka
        having sum(sztuk) >= 4
    );

-- zawierają co najmniej 3 sztuki czekoladki Gorzka truskawkowa,
select nazwa, opis, cena
from pudelka
where idpudelka in (
        select idpudelka
        from zawartosc
        natural join czekoladki
        where czekoladki.nazwa = 'Gorzka truskawkowa'
        group by idczekoladki, idpudelka
        having sum(sztuk) >= 3
    );

-- zawierają czekoladki z nadzieniem truskawkowym,
select nazwa, opis, cena
from pudelka
where idpudelka in (
        select idpudelka
        from zawartosc
        natural join czekoladki
        where czekoladki.nadzienie = 'truskawki'
    );


-- nie zawierają czekoladek w gorzkiej czekoladzie,
select nazwa, opis, cena
from pudelka
where idpudelka not in (
        select idpudelka
        from zawartosc
        natural join czekoladki
        where czekoladki.czekolada = 'gorzka'
    );


-- nie zawierają czekoladek z orzechami,
select nazwa, opis, cena
from pudelka
where idpudelka not in (
        select idpudelka
        from zawartosc
        natural join czekoladki
        where czekoladki.orzechy is not null
    );


-- zawierają przynajmniej jedną czekoladkę bez nadzienia.
select nazwa, opis, cena
from pudelka
where idpudelka in (
        select idpudelka
        from zawartosc
        natural join czekoladki
        where czekoladki.nadzienie is null
    );
