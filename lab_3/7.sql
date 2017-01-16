-- Napisz skrypt składający się z poleceń psql, który wykona zapytanie
-- (użyj dowolnego zapytania z zadania 3.6) oraz zwróci jego wynik jako dokument
-- HTML (nie zapomnij o znacznikach html, body itd.), gdzie odpowiedź serwera
-- będzie tabelą HTML.
--
-- UWAGA: Przydatne polecenia: \H \echo \T \pset

\f ' '  -- field separator
\H      -- Turn on HTML tabular output. This is equivalent to \pset format html or the \H command.
\o zapytanie1.html  -- Put all query output into file filename. This is equivalent to the command \o.

-- uwaga zapytanie zostanie zapisane do pliku, ktory zostanie umieszczony w folderze w ktorym byl terminal w trakcie wywolywania psql-a
select idmeczu,
    gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0),
    goscie[1] + goscie[2] + goscie[3] + coalesce(goscie[4], 0) + coalesce(goscie[5], 0)
from siatkowka.statystyki;

\o ;
\a      -- If the current table output format is unaligned, it is switched to aligned.
        -- If it is not unaligned, it is set to unaligned. This command is kept for
        -- backwards compatibility. See \pset for a more general solution.
