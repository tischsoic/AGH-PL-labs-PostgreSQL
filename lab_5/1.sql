-- Napisz zapytanie w języku SQL wyświetlające informacje na temat:


-- łącznej liczby czekoladek w bazie danych,
select count(*) from czekoladki;


-- łącznej liczby czekoladek z nadzieniem (na 2 sposoby) - podpowiedź: count(*), count(nazwaKolumny),
select count(*) from czekoladki
where nadzienie is not null;
-- lub:
select count(nadzienie) from czekoladki;


-- pudełka, w którym jest najwięcej czekoladek (uwaga: konieczne jest użycie LIMIT),
select idpudelka, sum(sztuk) as iloscczekoladek from pudelka
    natural join zawartosc
group by idpudelka
order by iloscczekoladek desc
limit 1;


-- łącznej liczby czekoladek w poszczególnych pudełkach,
select idpudelka, sum(sztuk) as iloscczekoladek from zawartosc
group by idpudelka
order by iloscczekoladek desc;


-- łącznej liczby czekoladek bez orzechów w poszczególnych pudełkach,
select idpudelka, sum(sztuk) as iloscczekoladek from zawartosc
    natural join czekoladki
where czekoladki.orzechy is null
group by idpudelka
order by iloscczekoladek desc;


-- łącznej liczby czekoladek w mlecznej czekoladzie w poszczególnych pudełkach.
select idpudelka, sum(sztuk) as iloscczekoladek from zawartosc
    natural join czekoladki
where czekoladki.czekolada = 'mleczna'
group by idpudelka
order by iloscczekoladek desc;
