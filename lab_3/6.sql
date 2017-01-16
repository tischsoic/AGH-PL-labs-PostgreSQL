-- Napisz zapytanie w języku SQL wyświetlające:

-- identyfikator meczu, sumę punktów zdobytych przez gospodarzy i sumę punktów zdobytych przez gości,
select idmeczu,
    gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0),
    goscie[1] + goscie[2] + goscie[3] + coalesce(goscie[4], 0) + coalesce(goscie[5], 0)
from siatkowka.statystyki;

-- identyfikator meczu, sumę punktów zdobytych przez gospodarzy i sumę punktów zdobytych przez gości,
-- dla meczów, które skończyły się po 5 setach i zwycięzca ostatniego seta zdobył ponad 15 punktów,
select idmeczu,
    gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0),
    goscie[1] + goscie[2] + goscie[3] + coalesce(goscie[4], 0) + coalesce(goscie[5], 0)
from siatkowka.statystyki
where gospodarze[5] > 15 or goscie[5] > 15;

-- identyfikator i wynik meczu w formacie x:y, np. 3:1 (wynik jest pojedynczą kolumną – napisem),
select idmeczu,
    (case when (gospodarze[1] > goscie[1]) then 1 else 0 end +
        case when (gospodarze[2] > goscie[2]) then 1 else 0 end +
        case when (gospodarze[3] > goscie[3]) then 1 else 0 end +
        case when (gospodarze[4] > goscie[4]) then 1 else 0 end +
        case when (gospodarze[5] > goscie[5]) then 1 else 0 end)
    || ':' ||
    (case when (gospodarze[1] < goscie[1]) then 1 else 0 end +
        case when (gospodarze[2] < goscie[2]) then 1 else 0 end +
        case when (gospodarze[3] < goscie[3]) then 1 else 0 end +
        case when (gospodarze[4] < goscie[4]) then 1 else 0 end +
        case when (gospodarze[5] < goscie[5]) then 1 else 0 end)
from siatkowka.statystyki;

-- identyfikator meczu, sumę punktów zdobytych przez gospodarzy i sumę punktów zdobytych przez gości,
-- dla meczów, w których gospodarze zdobyli ponad 100 punktów,
select idmeczu,
    (gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0)) as suma_punktow_gospodarze,
    (goscie[1] + goscie[2] + goscie[3] + coalesce(goscie[4], 0) + coalesce(goscie[5], 0)) as suma_punktow_goscie
from siatkowka.statystyki
where (gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0)) > 100;

-- identyfikator meczu, liczbę punktów zdobytych przez gospodarzy w pierwszym secie,
-- sumę punktów zdobytych w meczu przez gospodarzy, dla meczów, w których pierwiastek
-- kwadratowy z liczby punktów zdobytych w pierwszym secie jest mniejszy niż logarytm
-- o podstawie 2 z sumy punktów zdobytych w meczu. ;)
select idmeczu, gospodarze[1],
    (gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0)) as suma_punktow_gospodarze
from siatkowka.statystyki
where sqrt(gospodarze[1]) < log(2, gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0));
