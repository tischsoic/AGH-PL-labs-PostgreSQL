-- Zakładając, że koszt wytworzenia pudełka czekoladek jest równy kosztowi
-- wytworzenia zawartych w nim czekoladek, napisz zapytanie wyznaczające:


-- zysk ze sprzedaży jednej sztuki poszczególnych pudełek (różnica między ceną pudełka i kosztem jego wytworzenia),
select idpudelka, pudelka.cena - sum(zawartosc.sztuk * czekoladki.koszt)
from pudelka
    natural join zawartosc
    join czekoladki using (idczekoladki)
group by idpudelka;


-- zysk ze sprzedaży zamówionych pudełek,
with ceny_pudelek as(
    select idpudelka, pudelka.cena - sum(zawartosc.sztuk * czekoladki.koszt) as zysk_na_pudelku
    from pudelka
        natural join zawartosc
        join czekoladki using (idczekoladki)
    group by idpudelka
)
select sum(artykuly.sztuk * ceny_pudelek.zysk_na_pudelku)
from artykuly
    join ceny_pudelek using (idpudelka);


-- zysk ze sprzedaży wszystkich pudełek czekoladek w cukierni.
with ceny_pudelek as(
    select idpudelka, pudelka.cena - sum(zawartosc.sztuk * czekoladki.koszt) as zysk_na_pudelku
    from pudelka
        natural join zawartosc
        join czekoladki using (idczekoladki)
    group by idpudelka
)
select sum(pudelka.stan * ceny_pudelek.zysk_na_pudelku)
from pudelka
    join ceny_pudelek using (idpudelka);
