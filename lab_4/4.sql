-- Napisz zapytanie w języku SQL wyświetlające informacje na temat pudełek
-- i ich zawartości (nazwa, opis, nazwa czekoladki, opis czekoladki):



-- wszystkich pudełek,
select pudelka.nazwa, pudelka.opis, string_agg(czekoladki.nazwa::text, ', '), string_agg(czekoladki.nazwa::text, ', ')
from pudelka
    natural join zawartosc
    left join czekoladki using (idczekoladki)
group by idpudelka;


-- pudełka o wartości klucza głównego heav,
select pudelka.idpudelka, pudelka.nazwa, pudelka.opis, string_agg(czekoladki.nazwa::text, ', '), string_agg(czekoladki.nazwa::text, ', ')
from pudelka
    natural join zawartosc
    left join czekoladki using (idczekoladki)
where pudelka.idpudelka = 'heav'
group by idpudelka;


-- pudełek, których nazwa zawiera słowo Kolekcja.
select pudelka.nazwa, pudelka.opis, string_agg(czekoladki.nazwa::text, ', '), string_agg(czekoladki.nazwa::text, ', ')
from pudelka
    natural join zawartosc
    left join czekoladki using (idczekoladki)
where pudelka.nazwa like '%Kolekcja%'
group by idpudelka;
