-- Napisz zapytanie wyświetlające: liczbę porządkową i identyfikator pudełka
-- czekoladek (idpudelka). Identyfikatory pudełek mają być posortowane
-- alfabetycznie, rosnąco. Liczba porządkowa jest z przedziału 1..N, gdzie N jest ilością pudełek.
--
-- Użyj podzapytania w klauzuli select:
--
-- select kolumna1, kolumna2, (select ...) from ...

select (select count(*) + 1
        from pudelka as p
        where p.idpudelka < pudelka.idpudelka
        limit 1
    ), idpudelka
from pudelka
order by pudelka.idpudelka asc;
