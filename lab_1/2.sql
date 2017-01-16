-- proba wczytania danych do DB z pliku schemat_siatkowka.sql powodowal blad:
-- psql:schemat_siatkowka.sql:52: ERROR: character with byte sequence 0x81 in encoding "WIN1250" has no equivalent in encoding "UTF8"
-- rozwiazaniem okazalo sie zmienienie kodowania w programie Notepad++ na ANSI UTF-8, czy cos takiego.

set search_path to siatkowka;
-- \dt
select imie, nazwisko from siatkarki;
set search_path to public;
select imie, nazwisko from siatkarki;
set search_path to siatkowka, public;
-- \dt

