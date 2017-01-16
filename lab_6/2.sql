-- Napisz i wykonaj zapytanie, które doda do tabeli czekoladki następujące pozycje, wykorzystaj wartości NULL w poleceniu INSERT:
        -- IDCzekoladki: X91,
        -- Nazwa: Nieznana Nieznajoma,
        -- Opis: Niewidzialna czekoladka wspomagajaca odchudzanie.,
        -- Koszt: 26 gr,
        -- Masa: 0g,

        -- IDCzekoladki: M98,
        -- Nazwa: Mleczny Raj,
        -- Czekolada: Mleczna,
        -- Opis: Aksamitna mleczna czekolada w ksztalcie butelki z mlekiem.,
        -- Koszt: 26 gr,
        -- Masa: 36 g,
insert into czekoladki
    (idczekoladki, nazwa, czekolada, orzechy, nadzienie, opis, koszt, masa)
values ('X91', 'Nieznana Nieznajoma', null, null, null, 'Niewidzialna czekoladka wspomagajaca odchudzanie.', 0.26, 0),
        ('M98', 'Mleczny Raj', 'mleczna', null, null, 'Aksamitna mleczna czekolada w ksztalcie butelki z mlekiem.', 0.26, 36);

-- Sprawdź, czy napisane przez Ciebie zapytania odniosły pożądany skutek tj. czy do w/w tabel zostały dodane odpowiednie wiersze, wykorzystaj SELECT.
