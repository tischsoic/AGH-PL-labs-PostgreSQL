-- Napisz funkcję zwracającą informacje o zamówieniach złożonych przez klienta,
-- którego identyfikator podawany jest jako argument wywołania funkcji.
-- W/w informacje muszą zawierać: idzamowienia, idpudelka, datarealizacji.
-- Przetestuj działanie funkcji. Uwaga: Funkcja zwraca więcej niż 1 wiersz!
create or replace function zamowieniaKlienta (_idklienta integer)
returns table (
    f_idzamowienia integer,
    f_idpudelka char(4),
    f_datarealizacji date
) as
$$
declare

begin
    return query
        select idzamowienia, idpudelka, datarealizacji
        from zamowienia
        natural join artykuly
        where idklienta = _idklienta;
end;
$$
language plpgsql;

-- Napisz funkcję zwracającą listę klientów z miejscowości, której nazwa podawana
-- jest jako argument wywołania funkcji. Lista powinna zawierać: nazwę klienta
-- i adres. Przetestuj działanie funkcji.
create or replace function zMiejscowosci (_miejscowosc varchar(15))
returns table (
    f_nazwa varchar(130),
    f_ulica varchar(30)
) as
$$
declare

begin
    return query
        select nazwa, ulica
        from klienci
        where miejscowosc = _miejscowosc;
end;
$$
language plpgsql;
