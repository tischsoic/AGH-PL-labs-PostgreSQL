-- Napisz funkcję zysk obliczającą zysk jaki cukiernia uzyskuje ze sprzedaży jednego
-- pudełka czekoladek, zakładając, że zysk ten jest różnicą między ceną pudełka,
-- a kosztem wytworzenia zawartych w nim czekoladek i kosztem opakowania (0,90 zł
-- dla każdego pudełka). Funkcja jako argument przyjmuje identyfikator pudełka.
-- Przetestuj działanie funkcji na podstawie prostej instrukcji select.
create or replace function zyskNaPudelku (idPud char(4))
returns numeric(7, 2) as
$$
declare
    kosztCzekoladek numeric(7, 2);
    cenaPudelka numeric(7, 2);
begin
    select sum(sztuk * koszt) into kosztCzekoladek
    from zawartosc
    natural join czekoladki
    where idpudelka = idPud;

    select cena into cenaPudelka
    from pudelka
    where idpudelka = idPud;

    return cenaPudelka - kosztCzekoladek - 0.9;
end;
$$
language plpgsql;

-- Napisz instrukcję select obliczającą zysk jaki cukiernia uzyska ze sprzedaży
-- pudełek zamówionych w wybranym dniu.
create or replace function zyskWDniu (dzien date)
returns numeric(7, 2) as
$$
declare
    zysk numeric(7, 2);
begin
    select sum(zyskNaArtykule) into zysk
        from (
            select zyskNaPudelku(idpudelka) * sztuk as zyskNaArtykule
            from zamowienia
            natural join artykuly
            where datarealizacji = dzien
        ) as podZapytanie;

    return zysk;

end;
$$
language plpgsql;
