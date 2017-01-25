-- Napisz funkcję masaPudelka wyznaczającą masę pudełka jako sumę masy czekoladek
-- w nim zawartych. Funkcja jako argument przyjmuje identyfikator pudełka.
-- Przetestuj działanie funkcji na podstawie prostej instrukcji select.
create or replace function masaPudelka (idPud char(4))
returns integer as
$$
declare
    massOfAll integer;
begin
    select sum(masa) into massOfAll
    from pudelka
    natural join zawartosc
    left join czekoladki using(idczekoladki)
    where idpudelka = idPud;

    return massOfAll;
end;
$$
language plpgsql;


-- Napisz funkcję liczbaCzekoladek wyznaczającą liczbę czekoladek znajdujących
-- się w pudełku. Funkcja jako argument przyjmuje identyfikator pudełka. Przetestuj
-- działanie funkcji na podstawie prostej instrukcji select.
create or replace function liczbaCzekoladek (idPud char(4))
returns integer as
$$
declare
    iloscCzekoladek integer;
begin
    select sum(sztuk) into iloscCzekoladek
    from zawartosc
    where idpudelka = idPud
    group by idpudelka;

    return iloscCzekoladek;
end;
$$
language plpgsql;
