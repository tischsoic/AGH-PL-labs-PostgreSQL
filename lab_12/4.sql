-- Udzielenie dostępu:
-- GRANT prawa ON obiekt TO uzytkownik;

-- prawa: select, insert, update, delete, create, all privileges,
-- obiekt: tabela, schemat, baza danych, widok etc.,
-- uzytkownik: nazwa uzytkownika, public (wszyscy).

-- Odbieranie praw:
-- REVOKE prawa ON obiekt FROM uzytkownik;

-- Informacje o prawach dostępu z poziomu psql można uzyskać za pomocą
-- polecenia \z (albo \dp). Domyślnie prawa dostępu są tylko dla właściciela!!!


-- jesli testujemy u siebie lokalnie na localhost musimy najpierw utworzyc uzytkownika:
create role testowa login;
alter role testowa with password 'asdf';
-- tak się logujemy na tego użytkownika:
psql -h localhost -p 5432 -d postgres -U testowa



-- Udziel dostępu do wykonywania zapytań select 2-giej osobie w grupie
-- do tabeli kompozycje (schemat kwiaciarnia); przetestuj.
grant select on kompozycje to testowa;


-- Udziel dostępu do wykonywania zapytań select 2-giej osobie w grupie
-- do schematu firma; przetestuj.
grant usage on schema testy to testowa;
grant select on all tables in schema testy to testowa;


-- Udziel dostępu do dodawania, usuwania, modyfikacji wierszy 2-giej osobie
-- w grupie do tabeli klienci (schemat kwiaciarnia); przetestuj.
grant insert, delete, update on klienci to testowa;


-- Zezwól 2-giej osobie na tworzenie nowych obiektów w schemacie firma; przetestuj.
grant create on schema testy to testowa;


-- Powtórz ćwiczenie zamieniając się rolami.



-- Usuń przyznane prawa. Sprawdź, czy 2-ga osoba może teraz wykonać jakieś operacje.
revoke create on schema testy from testowa;
revoke insert, delete, update on klienci from testowa;
revoke usage on schema testy from testowa;
revoke select on all tables in schema testy from testowa;
revoke select on kompozycje from testowa;
