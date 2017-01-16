-- Napisz instrukcję UDPATE, która dla pudełek dodanych w poprzednich dwóch
-- zadaniach, zwiększa o 1 liczbę czekoladek każdego smaku, które w nich występują.
update zawartosc
    set sztuk = sztuk + 1
    where idpudelka in ('mp1s', 'mp2s');


-- Napisz skrypt zawierający instrukcje UPDATE, które modyfikują tabelę czekoladki
-- zastępując w kolumnach: czekolada, orzechy i nadzienie wartości
-- Null wartością “brak”.
update czekoladki
    set czekolada = case
                        when czekolada is null then 'brak'
                        else czekolada
                    end,
        orzechy = case
                        when orzechy is null then 'brak'
                        else orzechy
                    end,
        nadzienie = case
                        when nadzienie is null then 'brak'
                        else nadzienie
                    end;


-- Napisz skrypt zawierający instrukcje UPDATE, które anulują zmiany wprowadzone
-- w poprzednim punkcie.
update czekoladki
    set czekolada = case
                        when czekolada = 'brak' then null
                        else czekolada
                    end,
        orzechy = case
                        when orzechy = 'brak' then null
                        else orzechy
                    end,
        nadzienie = case
                        when nadzienie = 'brak' then null
                        else nadzienie
                    end;
