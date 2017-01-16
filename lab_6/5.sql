-- Napisz instrukcje usuwające z bazy danych informacje o:

-- klientach o nazwisku Matusiak,
delete from klienci
    where nazwa like 'Matusiak %';


-- klientach o identyfikatorze większym niż 91,
delete from klienci
    where idklienta > 91;


-- czekoladkach, których koszt jest większy lub równy 0.45 lub masa jest większa
-- lub równa 36, lub masa jest równa 0.
delete from czekoladki
    where koszt >= 0.45
        or masa >= 36
        or masa = 0;
