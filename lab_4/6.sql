-- Napisz poniższe zapytania w języku SQL:
--
-- Uwaga: w powyższych zapytaniach należy użyć samozłączeń (złączeń własnych).
--
-- Wskazówka: Zapytanie w punkcie 2 można znacznie uprościć stosując konstrukcję z WITH.



-- Wyświetl wartości kluczy głównych oraz nazwy czekoladek, których koszt jest
-- większy od czekoladki o wartości klucza głównego równej d08.
select czekoladki.koszt, cz_2.koszt
from czekoladki, czekoladki as cz_2
where cz_2.idczekoladki = 'd08'
    and czekoladki.koszt > cz_2.koszt;


-- Kto (nazwa klienta) złożył zamówienia na takie same czekoladki (pudełka)
-- jak zamawiała Górka Alicja.
with pudelka_alicji as (
    select idpudelka
    from klienci
        natural join zamowienia
        natural join artykuly
        join pudelka using (idpudelka)
    where klienci.nazwa = 'Górka Alicja'
)
select klienci.nazwa
from klienci
    natural join zamowienia
    natural join artykuly
    join pudelka using (idpudelka)
where pudelka.idpudelka in (select idpudelka from pudelka_alicji)
group by idklienta;



-- Kto (nazwa klienta, adres) złożył zamówienia na takie same czekoladki
-- (pudełka) jak zamawiali klienci z Katowic.
with pudelka_z_katowic as (
    select idpudelka
    from klienci
        natural join zamowienia
        natural join artykuly
        join pudelka using (idpudelka)
    where klienci.miejscowosc = 'Katowice'
)
select klienci.nazwa
from klienci
    natural join zamowienia
    natural join artykuly
    join pudelka using (idpudelka)
where pudelka.idpudelka in (select idpudelka from pudelka_z_katowic)
group by idklienta;
