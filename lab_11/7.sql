-- Napisz funkcję rabat obliczającą rabat jaki otrzymuje klient kwiaciarni
-- składający zamówienie. Funkcję utwórz w schemacie kwiaciarnia. Rabat wyliczany
-- jest na podstawie zamówień bieżących (tabela zamowienia) i z ostatnich siedmiu
-- dni (tabela historia) w sposób następujący:
--
-- 5 % jeśli wartość zamówień jest większa od 0 lecz nie większa od 100 zł;
-- 10 % jeśli wartość zamówień jest z przedziału 101-400 zł;
-- 15 % jeśli wartość zamówień jest z przedziału 401-700 zł;
-- 20 % jeśli wartość zamówień jest większa od 700 zł.
-- Przetestuj działanie funkcji.
create or replace function rabat (_idklienta varchar(10))
returns float as
$$
declare
    wartoscZamowien numeric(7, 2);
begin
    wartoscZamowien := (
        select sum(cena)
        from zamowienia
        where idklienta = _idklienta
    );

    wartoscZamowien :=
        wartoscZamowien
        + (
            select sum(cena)
            from historia
            where idklienta = _idklienta
                and termin > now() - interval '7 days'
        );

    case
        when wartoscZamowien <= 100 then return 0.05;
        when wartoscZamowien between 100 and 400 then return 0.1;
        when wartoscZamowien between 400 and 700 then return 0.15;
        else return 0.2;
    end case;
end;
$$
language plpgsql;
