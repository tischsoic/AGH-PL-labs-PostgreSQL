-- Napisz zapytanie w języku SQL wyświetlające informacje na temat:

-- masy poszczególnych pudełek,
select idpudelka, sum(sztuk * masa) as masa_czekoladek from zawartosc
    natural join czekoladki
group by idpudelka
order by masa_czekoladek desc;


-- pudełka o największej masie,
select idpudelka, sum(sztuk * masa) as masa_czekoladek from zawartosc
    natural join czekoladki
group by idpudelka
order by masa_czekoladek desc
limit 1;


-- średniej masy pudełka w ofercie cukierni,
with masy_pudelek as (
    select sum(sztuk * masa) as masa_czekoladek from zawartosc
        natural join czekoladki
    group by idpudelka
)
select avg(masy_pudelek.masa_czekoladek) from masy_pudelek;


-- średniej wagi pojedynczej czekoladki w poszczególnych pudełkach,
select sum(sztuk * masa) / sum(sztuk) from zawartosc
    natural join czekoladki
group by idpudelka;
