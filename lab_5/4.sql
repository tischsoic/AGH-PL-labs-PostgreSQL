-- Napisz zapytanie w języku SQL wyświetlające informacje na temat:

-- czekoladki, która występuje w największej liczbie pudełek,
select idczekoladki, count(idpudelka) as ilosc_w_pudelku
from czekoladki
    natural join zawartosc
    join pudelka using (idpudelka)
group by idczekoladki
order by ilosc_w_pudelku desc
limit 1;


-- pudełka, które zawiera najwięcej czekoladek bez orzechów,
select idpudelka, sum(zawartosc.sztuk) as ilosc_w_pudelku
from pudelka
    natural join zawartosc
    join czekoladki using (idczekoladki)
where czekoladki.orzechy is null
group by idpudelka
order by ilosc_w_pudelku desc
limit 1;


-- czekoladki, która występuje w najmniejszej liczbie pudełek,
select idczekoladki, count(idpudelka) as ilosc_w_pudelku
from czekoladki
    natural join zawartosc
    join pudelka using (idpudelka)
group by idczekoladki
order by ilosc_w_pudelku asc
limit 1;


-- pudełka, które jest najczęściej zamawiane przez klientów.
select idpudelka, sum(sztuk) as ilosc_zamowionych_pudelek
from artykuly
group by idpudelka
order by ilosc_zamowionych_pudelek desc
limit 1;
