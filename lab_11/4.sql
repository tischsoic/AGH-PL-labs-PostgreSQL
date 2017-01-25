-- Napisz bezargumentową funkcję podwyzka, która dokonuje podwyżki kosztów produkcji
-- czekoladek o:



-- 3 gr dla czekoladek, których koszt produkcji jest mniejszy od 20 gr;
-- 4 gr dla czekoladek, których koszt produkcji jest z przedziału 20-29 gr;
-- 5 gr dla pozostałych.
-- Funkcja powinna ponadto podnieść cenę pudełek o tyle o ile zmienił się koszt
-- produkcji zawartych w nich czekoladek.
create or replace function podniesKoszt()
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
    podniesO numeric(7, 2);
begin
    for zic in zawartosc_i_czekoladki_c loop
        if zic.koszt < 20 then
            podniesO := 0.03;
        elseif zic.koszt between 20 and 29 then
            podniesO := 0.04;
        else
            podniesO := 0.05;
        end if;

        update pudelka
            set cena = cena + zic.sztuk * podniesO
            where idpudelka = zic.idpudelka;
    end loop;

    for c in czekoladki_c loop
        if c.koszt < 20 then
            podniesO := 0.03;
        elseif c.koszt between 20 and 29 then
            podniesO := 0.04;
        else
            podniesO := 0.05;
        end if;

        update czekoladki
            set koszt = koszt + podniesO
            where idczekoladki = c.idczekoladki;
    end loop;
end;
$$
language plpgsql;


-- Przed testowaniem działania funkcji wykonaj zapytania, które umieszczą w plikach
-- dane na temat kosztów czekoladek i cen pudełek tak, aby można było później
-- sprawdzić poprawność działania funkcji podwyzka. Przetestuj działanie funkcji.
\i przed_zmianami.sql
