-- baza danych: cukiernia
--
-- Napisz poniższe zapytania w języku SQL (używając odpowiedniego operatora,
-- np. in/not in/exists/any/all):


-- Wyświetl wartości kluczy głównych oraz nazwy czekoladek, których koszt
-- jest większy od czekoladki o wartości klucza głównego równej D08.
select idczekoladki, nazwa
from czekoladki
where koszt > (select koszt from czekoladki where idczekoladki = 'd08');

-- Kto (nazwa klienta) złożył zamówienia na takie same czekoladki (pudełka)
-- jak zamawiała Gorka Alicja.



-- Kto (nazwa klienta, adres) złożył zamówienia na takie same czekoladki (pudełka)
-- jak zamawiali klienci z Katowic.
