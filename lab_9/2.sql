-- Wykonaj skrypt tworzący relacje w bazie danych kwiaciarnia.
alter table  historia
    add foreign key (idzamowienia) references zamowienia,
    add foreign key (idklienta) references klienci;


-- Przygotuj odpowiednio dane z pliku kwiaciarnia2dane-tekst.txt i zaimportuj
-- je do bazy danych.
\connect int_klienci -- by w psql w konsoli przejść do operowania na innej bazie danych
alter sequence odbiorcy_idodbiorcy_seq restart with 1; -- jeśli coś źle wgramy i chcemy ustawić sequence z powrotem na 1
truncate historia cascade; -- opróżnianie tabeli
alter table historia drop constraint historia_idzamowienia_fkey; -- usuwanie niepotrzebnego klucza obcego

-- Sprawdź (np. wykonując zapytania), czy wszystkie dane zostały zaimportowane
-- do bazy danych.

-- Jak sprawdzić wartość klucza głównego dla ostatnio dodanego rekodu do tabeli
-- odbiorcy w ramach tej samej sesji?
select currval('odbiorcy_idodbiorcy_seq');
