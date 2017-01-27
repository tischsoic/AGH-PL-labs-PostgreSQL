-- Utwórz wyzwalacz modyfikujący (przy wstawianiu i aktualizacji rekordów
-- w tabeli pudelka) pole cena w tabeli pudelka, jeżeli cena jest mniejsza niż 105%
-- kosztów wytworzenia danego pudełka czekoladek
-- (koszt wytworzenia czekoladek + koszt pudełka 0,90 zł). W takim przypadku cenę
-- należy ustawić na kwotę 105% kosztów wytworzenia.
create or replace function fn_przed_aktualizacja_pudelek ()
    returns trigger as
    $$
    declare
        kosztCzekoladek numeric(7, 2);
    begin
        select sum(sztuk * koszt) into kosztCzekoladek
        from zawartosc
        natural join czekoladki
        where idpudelka = new.idpudelka;

        kosztCzekoladek := kosztCzekoladek + 0.9;

        if new.cena < 1.05 * kosztCzekoladek then
            new.cena := 1.05 * kosztCzekoladek;
        end if;

        return new;
    end;
    $$
language plpgsql;

create trigger tr_przed_aktualizacja_pudelek
    before insert or update
    on pudelka
    for each row execute procedure fn_przed_aktualizacja_pudelek();

-- Utwórz wyzwalacz modyfikujący (przy wstawianiu i aktualizacji rekordów w tabeli
-- zawartosc) pole cena w tabeli pudelka, jeżeli cena jest mniejsza niż 105% kosztów
-- wytworzenia danego pudełka czekoladek (koszt wytworzenia czekoladek + koszt pudełka 0,90 zł).
-- W takim przypadku cenę należy ustawić na kwotę 105% kosztów wytworzenia.
create or replace function fn_normalizuj_cene_pudelka (idPud char(4))
    returns void as
    $$
    declare
        kosztCzekoladek numeric(7, 2);
        cenaPudelka numeric(7, 2);
    begin
        select sum(sztuk * koszt) into kosztCzekoladek
        from zawartosc
        natural join czekoladki
        where idpudelka = idPud;

        kosztCzekoladek := kosztCzekoladek + 0.9;
        raise notice 'kosztCzekoladek: %.', kosztCzekoladek;

        select cena into cenaPudelka
        from pudelka
        where idpudelka = idPud;
        raise notice 'cenaPudelka: %.', cenaPudelka;

        if cenaPudelka < 1.05 * kosztCzekoladek then
            update pudelka
                set cena = 1.05 * kosztCzekoladek
                where idpudelka = idPud;
        end if;
    end;
    $$
language plpgsql;

create or replace function fn_po_zmianie_zawartosci ()
    returns trigger as
    $$
    declare

    begin
        -- z 'select fn_normalizuj_cene_pudelka' nie zadziala
        perform fn_normalizuj_cene_pudelka(new.idpudelka);

        if old.idpudelka != null
            and new.idpudelka != old.idpudelka then
            perform fn_normalizuj_cene_pudelka(old.idpudelka);
        end if;

-- pamietaj o returnach!!!
        return null;
    end;
    $$
language plpgsql;

create trigger tr_po_aktualizacji_zawartosci
    after insert or update
    on zawartosc
    for each row execute procedure fn_po_zmianie_zawartosci();


-- Utwórz wyzwalacz modyfikujący (przy aktualizacji rekordów w tabeli czekoladki)
-- pole cena w tabeli pudelka, jeżeli cena jest mniejsza niż 105% kosztów wytworzenia
-- danego pudełka czekoladek (koszt wytworzenia czekoladek + koszt pudełka 0,90 zł).
-- W takim przypadku cenę należy ustawić na kwotę 105% kosztów wytworzenia.
create or replace function fn_po_zamianie_czekoladki ()
    returns trigger as
    $$
    declare
        idPud char(4);
    begin
        if new.koszt = old.koszt then
            return null;
        end if;

        for idPud in (
            select idpudelka
            from zawartosc
            where idczekoladki = new.idczekoladki
                or idczekoladki = old.idczekoladki
            group by idpudelka
        ) loop
            perform fn_normalizuj_cene_pudelka(idPud);
        end loop;

        return null;

    end;
    $$
language plpgsql;

create trigger tr_po_zamianie_czekoladki
    after insert or update
    on czekoladki
    for each row execute procedure fn_po_zamianie_czekoladki();
