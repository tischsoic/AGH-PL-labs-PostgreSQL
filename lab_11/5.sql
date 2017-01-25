-- Napisz funkcję obnizka odwracająca zmiany wprowadzone w poprzedniej funkcji.
-- Przetestuj działanie funkcji.
create or replace function obnizKoszt()
returns void as
$$
declare
    zawartosc_i_czekoladki_c cursor for
        select *
        from zawartosc
        natural join czekoladki;
    czekoladki_c cursor for
        select *
        from czekoladki;
    obnizO numeric(7, 2);
begin
    for zic in zawartosc_i_czekoladki_c loop
        if zic.koszt < 20.03 then
            obnizO := 0.03;
        elseif zic.koszt between 20.04 and 29.04 then
            obnizO := 0.04;
        else
            obnizO := 0.05;
        end if;

        update pudelka
            set cena = cena - zic.sztuk * obnizO
            where idpudelka = zic.idpudelka;
    end loop;

    for c in czekoladki_c loop
        if c.koszt < 20.03 then
            obnizO := 0.03;
        elseif c.koszt between 20.04 and 29.04 then
            obnizO := 0.04;
        else
            obnizO := 0.05;
        end if;

        update czekoladki
            set koszt = koszt - obnizO
            where idczekoladki = c.idczekoladki;
    end loop;
end;
$$
language plpgsql;
