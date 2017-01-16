-- Napisz skrypt zawierający instrukcje INSERT wstawiające do bazy danych Cukiernia
-- dwa nowe rekordy do tabeli Pudelka oraz odpowiednie rekordy związane z tymi
-- pudełkami do tabeli Zawartosc. Każde z nowych pudełek ma zawierać łącznie
-- co najmniej 10 czekoladek, w co najmniej 4 różnych smakach.

insert into pudelka
    values ('mp1s', 'Moje pudelko 1', 'Opis', 21.00, 21),
            ('mp2s', 'Moje pudelko 2', 'Opis', 42.00, 42);

insert into zawartosc
    select 'mp1s', idczekoladki, 3 from czekoladki where idczekoladki in ('b01', 'b02', 'b03', 'b04');

insert into zawartosc
    select 'mp2s', idczekoladki, 3 from czekoladki where idczekoladki in ('b01', 'b02', 'b03', 'b04');
