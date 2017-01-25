-- baza danych: firma
--
-- Przygotuj skrypt implementujący bazę danych firma zgodnie z przedstawionym poniżej opisem.
--
-- Uwaga: Baza danych ma zostać umieszczona w schemacie testy (patrz zadanie 1.1).
--
-- Relacja dzialy zawiera atrybuty:
--
-- iddzialu - typ znakowy, dokładnie 5 znaków, klucz główny,
-- nazwa - typ znakowy, maksymalnie 32 znaki, wymagane,
-- lokalizacja - typ znakowy, maksymalnie 24 znaki, wymagane,
-- kierownik - liczba całkowita, klucz obcy odwołujący się do pola idpracownika w relacji pracownicy.
-- Relacja pracownicy zawiera atrybuty:
--
-- idpracownika - liczba całkowita, klucz główny,
-- nazwisko - typ znakowy, maksymalnie 32 znaki, wymagane,
-- imie - typ znakowy, maksymalnie 16 znaków, wymagane,
-- dataUrodzenia - data, wymagane,
-- dzial - typ znakowy, dokładnie 5 znaków, wymagane, klucz obcy odwołujący się do pola iddzialu w relacji dzialy,
-- stanowisko - typ znakowy, maksymalnie 24 znaki,
-- pobory - typ stałoprzecinkowy z dokładnością do 2 miejsc po przecinku.
-- Ponieważ występują cykliczne zależności między relacjami dzialy i pracownicy, klucz obcy w relacji dzialy należy dodać za pomocą polecenia alter table po utworzeniu obu relacji:
--
-- alter table dzialy add constraint dzial_fk foreign key(kierownik)
--   references pracownicy(id_pracownika) on update cascade;

create schema testy;

create table testy.dzialy (
    iddzialu char(5) primary key,
    nazwa varchar(32) not null,
    lokalizacja varchar(24) not null,
    kierownik integer
);

create table testy.pracownicy (
    idpracownika integer primary key,
    nazwisko varchar(32) not null,
    imie varchar(16) not null,
    dataUrodzenia date not null,
    dzial char(5) not null,
    stanowisko varchar(24),
    pobory numeric(7, 2)
);

-- http://stackoverflow.com/questions/15999913/insert-in-tables-with-circular-references-sql
alter table testy.dzialy
    add constraint dzial_fk foreign key(kierownik)
    references testy.pracownicy(idpracownika) on update cascade DEFERRABLE INITIALLY DEFERRED;

alter table testy.pracownicy
    add constraint pracownicy_fk foreign key(dzial)
    references testy.dzialy(iddzialu) on update cascade DEFERRABLE INITIALLY DEFERRED;
