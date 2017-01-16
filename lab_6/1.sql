-- Napisz i wykonaj zapytanie (użyj INSERT), które dodaje do tabeli czekoladki
-- następujące informacje:
        -- idczekoladki: W98,
        -- nazwa: Biały kieł,
        -- czekolada: biała,
        -- orzechy: laskowe,
        -- nadzienie: marcepan,
        -- opis: Rozpływające się w rękach i kieszeniach,
        -- koszt: 45 gr,
        -- masa: 20 g.
insert into czekoladki
    (idczekoladki, nazwa, czekolada, orzechy, nadzienie, opis, koszt, masa)
values ('W98', 'Biały kieł', 'biała', 'laskowe', 'marcepan', 'Rozpływające się w rękach i kieszeniach', 0.45, 20);


-- Napisz i wykonaj trzy zapytania (użyj INSERT), które dodadzą do tabeli
-- klienci następujące dane osobowe:
        -- idklienta: 90,
        -- nazwa: Matusiak Edward,
        -- ulica: Kropiwnickiego 6/3,
        -- miejscowosc: Leningrad,
        -- kod: 31-471,
        -- telefon: 031 423 45 38,

        -- idklienta: 91,
        -- nazwa: Matusiak Alina,
        -- ulica: Kropiwnickiego 6/3,
        -- miejscowosc: Leningrad,
        -- kod: 31-471,
        -- telefon: 031 423 45 38,

        -- idklienta: 92,
        -- nazwa: Kimono Franek,
        -- ulica: Karateków 8,
        -- miejscowosc: Mistrz,
        -- kod: 30-029,
        -- telefon: 501 498 324.
insert into klienci
    (idklienta, nazwa, ulica, miejscowosc, kod, telefon)
values (90, 'Matusiak Edward', 'Kropiwnickiego 6/3', 'Leningrad', '31-471', '031 423 45 38'),
        (91, 'Matusiak Alina', 'Kropiwnickiego 6/3', 'Leningrad', '31-471', '031 423 45 38'),
        (92, 'Kimono Franek', 'Karateków 8', 'Mistrz', '30-029', '501 498 324');


-- Dodaj do tabeli klienci dane Izy Matusiak (idklienta 93). Pozostałe dane
-- osobowe Izy Matusiak muszą być takie same jak dla Pana Edwarda Matusiaka. Użyj podzapytań.
insert into klienci
    (idklienta, nazwa, ulica, miejscowosc, kod, telefon)
values (94,
    'Matusiak Izabela',
    (select ulica from klienci where nazwa = 'Matusiak Edward'),
    (select miejscowosc from klienci where nazwa = 'Matusiak Edward'),
    (select kod from klienci where nazwa = 'Matusiak Edward'),
    (select telefon from klienci where nazwa = 'Matusiak Edward'));

-- Sprawdź, czy napisane przez Ciebie zapytania odniosły pożądany skutek tj.
-- czy do w/w tabel zostały dodane odpowiednie wiersze, wykorzystaj SELECT.
