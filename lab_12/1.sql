-- Utwórz (i przetestuj działanie) wyzwalacz (w schemacie kwiaciarnia),
-- który przy złożeniu zamówienia przez klienta:

-- oblicza rabat dla sprzedającego (użyj funkcji z zadania 11.7)
-- i modyfikuje pole cena w dodawanym rekordzie,

-- zmniejsza liczbę dostępnych kompozycji w tabeli kompozycje,

-- dodaje rekord do tabeli zapotrzebowanie, jeśli stan danej kompozycji
-- spada poniżej stanu minimalnego.

create or replace function fn_przy_skladaniu_zamowienia()
    returns trigger as
    $$
    declare
        _rabat float = rabat(new.idklienta);
        _stan integer;
        _minimum integer;
    begin
        new.cena := new.cena * (1 - _rabat);

        update kompozycje
        set stan = stan - 1
        where idkompozycji = new.idkompozycji;

-- http://dba.stackexchange.com/questions/54011/postgres-function-assign-query-results-to-multiple-variables
        select stan, minimum into _stan, _minimum
        from kompozycje
        where idkompozycji = new.idkompozycji;

        if _stan < _minimum then
            insert into zapotrzebowanie values(new.idkompozycji, now());
        end if;

        return new;
    end;
    $$
language plpgsql;

create trigger tr_przy_skladaniu_zamowienia before insert on zamowienia
    for each row execute procedure fn_przy_skladaniu_zamowienia();

drop trigger tr_przy_skladaniu_zamowienia on zamowienia;


-- Utwórz wyzwalacz (w schemacie kwiaciarnia), który automatycznie usuwa rekordy
-- z tabeli zapotrzebowanie, jeżeli po dostawie (after update) wzrasta stan danej
-- kompozycji powyżej minimum. Przetestuj działanie wyzwalacza.

create or replace function fn_po_dostawie()
    returns trigger as
    $$
    declare
        _stan integer;
        _minimum integer;
    begin

        select stan, minimum into _stan, _minimum
        from kompozycje
        where idkompozycji = new.idkompozycji;

        if _stan >= _minimum then
            delete from zapotrzebowanie
                where idkompozycji = new.idkompozycji;
        end if;

        return null;
    end;
    $$
language plpgsql;

create trigger tr_po_dostawie after update on kompozycje
    for each row execute procedure fn_po_dostawie();
