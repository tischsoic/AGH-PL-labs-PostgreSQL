-- Napisz instrukcje aktualizujące dane w bazie cukiernia. Sprawdź za pomocą instrukcji SELECT, czy odpowiednie rekordy zostały zmienione.


-- Zmiana nazwiska Izy Matusiak na Nowak.
update klienci set nazwa = 'Nowak Izabela'
    where nazwa = 'Matusiak Izabela';


-- Obniżenie kosztu czekoladek o identyfikatorach (idczekoladki): W98, M98 i X91, o 10%.
update czekoladki
    set koszt = koszt * 0.9
    where idczekoladki in ('W98', 'M98', 'X91');


-- Ustalenie kosztu czekoladek o nazwie Nieznana Nieznajoma na taką samą jak
-- cena czekoladki o identyfikatorze W98.
update czekoladki
    set koszt = (select koszt from czekoladki where idczekoladki = 'W98')
    where nazwa = 'Nieznana Nieznajoma';


-- Zmiana nazwy z Leningrad na Piotrograd w tabeli klienci.
update klienci
    set miejscowosc = 'Piotrograd'
    where miejscowosc = 'Leningrad';


-- Podniesienie kosztu czekoladek, których dwa ostatnie znaki identyfikatora
-- (idczekoladki) są większe od 90, o 15 groszy.
update czekoladki
    set koszt = koszt + 0.15
    where substr(idczekoladki, length(idczekoladki) - 1, 2)::integer > 90;
-- lub (bo wiemy ile znakow ma idczekoladki):
update czekoladki
    set koszt = koszt + 0.15
    where substr(idczekoladki, 2, 2)::integer > 90;
