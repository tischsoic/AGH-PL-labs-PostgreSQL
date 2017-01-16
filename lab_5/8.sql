-- Napisz zapytanie wyświetlające: liczbę porządkową i identyfikator pudełka
-- czekoladek (idpudelka). Identyfikatory pudełek mają być posortowane alfabetycznie,
-- rosnąco. Liczba porządkowa jest z przedziału 1..N, gdzie N jest ilością pudełek.

-- Uwaga: Można zastosować samozłączenie.

select (select count(*) from pudelka p2 where p1.idpudelka >= p2.idpudelka) as liczba_porzadkowa, p1.idpudelka
from pudelka p1
order by p1.idpudelka;
--or easy way
select row_number() over (order by idpudelka) as liczba_porzadkowa, idpudelka
from pudelka;
