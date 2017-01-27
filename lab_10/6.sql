-- baza danych: cukiernia
--
-- Wyświetl nazwę pudełka oraz ilość czekoladek, dla:
--
-- pudełka o największej liczbie czekoladek (bez użycia klauzuli limit),
select idpudelka, nazwa
from pudelka
where (select sum(sztuk) from zawartosc where zawartosc.idpudelka = pudelka.idpudelka group by zawartosc.idpudelka)
    = all (select max(ff) from (select sum(sztuk) as ff from zawartosc group by zawartosc.idpudelka) as f);

-- pudełka o najmniejszej liczbie czekoladek (bez użycia klauzuli limit),
select idpudelka, nazwa
from pudelka
where (select sum(sztuk) from zawartosc where zawartosc.idpudelka = pudelka.idpudelka group by zawartosc.idpudelka)
    = all (select min(ff) from (select sum(sztuk) as ff from zawartosc group by zawartosc.idpudelka) as f);

-- pudełka, w którym liczba czekoladek jest powyżej średniej.
select idpudelka, nazwa
from pudelka
where (select sum(sztuk) from zawartosc where zawartosc.idpudelka = pudelka.idpudelka group by zawartosc.idpudelka)
    > (select avg(ff) from (select sum(sztuk) as ff from zawartosc group by zawartosc.idpudelka) as f);


-- pudełka o największej lub najmniejszej liczbie czekoladek.
select idpudelka, nazwa
from pudelka
where (select sum(sztuk) from zawartosc where zawartosc.idpudelka = pudelka.idpudelka group by zawartosc.idpudelka)
        = (select min(ff) from (select sum(sztuk) as ff from zawartosc group by zawartosc.idpudelka) as f)
    or (select sum(sztuk) from zawartosc where zawartosc.idpudelka = pudelka.idpudelka group by zawartosc.idpudelka)
        = (select max(ff) from (select sum(sztuk) as ff from zawartosc group by zawartosc.idpudelka) as f);
 -- wersja 2
 select idpudelka, nazwa
 from pudelka
 where (select sum(sztuk) from zawartosc where zawartosc.idpudelka = pudelka.idpudelka)
in ((select min(ff) from (select sum(sztuk) as ff from zawartosc group by zawartosc.idpudelka) as f) , (select max(ff) from (select sum(sztuk) as ff from zawartosc group by zawartosc.idpudelka) as fff));
