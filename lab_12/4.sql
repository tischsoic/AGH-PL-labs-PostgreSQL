-- Udzielenie dostępu:
-- GRANT prawa ON obiekt TO uzytkownik;

-- prawa: select, insert, update, delete, create, all privileges,
-- obiekt: tabela, schemat, baza danych, widok etc.,
-- uzytkownik: nazwa uzytkownika, public (wszyscy).

-- Odbieranie praw:
-- REVOKE prawa ON obiekt FROM uzytkownik;

-- Informacje o prawach dostępu z poziomu psql można uzyskać za pomocą
-- polecenia \z (albo \dp). Domyślnie prawa dostępu są tylko dla właściciela!!!

-- Udziel dostępu do wykonywania zapytań select 2-giej osobie w grupie
-- do tabeli kompozycje (schemat kwiaciarnia); przetestuj.


-- Udziel dostępu do wykonywania zapytań select 2-giej osobie w grupie
-- do schematu firma; przetestuj.



-- Udziel dostępu do dodawania, usuwania, modyfikacji wierszy 2-giej osobie
-- w grupie do tabeli klienci (schemat kwiaciarnia); przetestuj.



-- Zezwól 2-giej osobie na tworzenie nowych obiektów w schemacie firma; przetestuj.



-- Powtórz ćwiczenie zamieniając się rolami.



-- Usuń przyznane prawa. Sprawdź, czy 2-ga osoba może teraz wykonać jakieś operacje.
