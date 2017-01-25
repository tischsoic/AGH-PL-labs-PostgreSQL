-- Napisz funkcję sumaZamowien obliczającą łączną wartość zamówień złożonych przez
-- klienta, które czekają na realizację (są w tabeli Zamowienia). Funkcja jako
-- argument przyjmuje identyfikator klienta. Przetestuj działanie funkcji.
create or replace function sumaZamowien (idKlienta integer)
returns numeric(7, 2) as
$$
declare
    lacznaSuma numeric(7, 2);
begin

    select sum(sztuk * cena) into lacznaSuma
    from zamowienia
    natural join artykuly
    natural join pudelka
    where datarealizacji > '12.12.2012' -- normalnie byłoby: where datarealizacji > now()
        and zamowienia.idKlienta = $1;

    return lacznaSuma;

end;
$$
language plpgsql;


-- Napisz funkcję rabat obliczającą rabat jaki otrzymuje klient składający
-- zamówienie. Funkcja jako argument przyjmuje identyfikator klienta. Rabat
-- wyliczany jest na podstawie wcześniej złożonych zamówień w sposób następujący:
-- 4 % jeśli wartość zamówień jest z przedziału 101-200 zł;
-- 7 % jeśli wartość zamówień jest z przedziału 201-400 zł;
-- 8 % jeśli wartość zamówień jest większa od 400 zł.
create or replace function obliczRabat(idKlienta integer)
returns float as
$$
declare
    lacznaSuma numeric(7, 2);
begin

    select sum(sztuk * cena) into lacznaSuma
    from zamowienia
    natural join artykuly
    natural join pudelka
    where zamowienia.idKlienta = $1;

    if lacznaSuma between 101 and 200 then
        return 0.04;
    elseif lacznaSuma between 101 and 200 then
        return 0.07;
    elseif lacznaSuma > 400 then
        return 0.08;
    end if;

    return 0.00;

end;
$$
language plpgsql;
