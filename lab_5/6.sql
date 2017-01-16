-- Napisz zapytanie w języku SQL wyświetlające informacje na temat:


-- łącznej masy wszystkich pudełek czekoladek znajdujących się w cukierni,
select sum(pudelka.stan * zawartosc.sztuk * czekoladki.masa)
from pudelka
    natural join zawartosc
    join czekoladki using(idczekoladki);


-- łącznej wartości wszystkich pudełek czekoladek znajdujących się w cukierni.
select sum(pudelka.stan * pudelka.cena)
from pudelka;
