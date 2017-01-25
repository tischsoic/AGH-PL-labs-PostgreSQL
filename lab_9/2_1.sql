-- Zweryfikuj działanie sekwencji. Otwórz dwie sesje z baza danych (dwa emulatoy terminala) A i B. Wykonaj odpowiednio co następuje.
--
-- sesja A: dodaj odbiorcę: Edmund Pasza.
insert into odbiorcy(nazwa, miasto,kod, adres) values('Edmund Pasza', 'Krakow', '31-100', 'add');

-- sesja B: dodaj odbiorcę: Ela Budrys.
insert into odbiorcy(nazwa, miasto,kod, adres) values('Ela Budrys', 'Krakow', '31-100', 'add');

-- sesja A: dodaj zamówienie dla Edmunda Paszy; użyj funkcji currval().
insert into zamowienia(idzamowienia, idklienta, idodbiorcy, idkompozycji, termin)
    values(2903008, 'msowins', currval('odbiorcy_idodbiorcy_seq'), 'buk1', '2007-04-27');

-- sesja B: dodaj zamówienie dla Eli Budrys; użyj funkcji currval().
insert into zamowienia(idzamowienia, idklienta, idodbiorcy, idkompozycji, termin)
    values(2903009, 'msowins', currval('odbiorcy_idodbiorcy_seq'), 'buk1', '2007-04-27');

-- Czy w identyfikatory odbiorcy w tabeli zamowienia są poprawne? Dlaczego?
-- Są poprawne - currval('') jest dla danej sesji

-- int_kwiaciarnia=# select * from zamowienia;
--  idzamowienia | idklienta | idodbiorcy | idkompozycji |   termin   |  cena  | zaplacone |            uwagi
-- --------------+-----------+------------+--------------+------------+--------+-----------+------------------------------
--       2703001 | msowins   |          1 | buk1         | 2007-04-27 |  95.00 | f         | dolaczyc zyczenia urodzinowe
--       2703002 | mbabik    |          1 | buk2         | 2007-04-27 |  75.00 | f         | dolaczyc zyczenia urodzinowe
--       2703003 | mfibak    |          2 | buk3         | 2007-04-27 |  90.00 | t         | dostarczyc po godzinie 17.00
--       2803001 | dniemcz   |          3 | ko1          | 2007-04-28 | 250.00 | t         |
--       2803002 | gurbanik  |          3 | ko2          | 2007-04-29 | 120.00 | t         | dostarczyc na godzine 10.30
--       2803003 | pjurecz   |          5 | ko3          | 2007-04-29 | 250.00 | f         | dolaczyc zyczenia imieninowe
--       2803004 | msrokiew  |          6 | susz         | 2007-04-29 |  70.00 | f         |
--       2803005 | bzameck   |          8 | ko4          | 2007-04-29 |  95.00 | t         | dolaczyc zyczenia imieninowe
--       2903001 | gkiwi     |         10 | ko5          | 2007-04-29 | 110.00 | f         | dolaczyc zyczenia imieninowe
--       2903002 | jkajdeck  |          2 | don1         | 2007-04-30 | 120.00 | t         |
--       2903003 | acygan    |         12 | buk2         | 2007-04-30 |  75.00 | t         |
--       2903004 | ztylutek  |          9 | buk3         | 2007-04-30 |  90.00 | f         | dostarczyc na godzine 10.30
--       2903005 | amanda    |          9 | ko1          | 2007-04-30 | 250.00 | f         | dostarczyc na godzine 12.30
--       2903006 | sp17      |         10 | ko2          | 2007-05-12 | 120.00 | t         | dostarczyc na godzine 10.00
--       2903007 | karolina  |         15 | ko3          | 2007-05-12 | 250.00 | t         | dostarczyc na godzine 11.30
--       2903008 | msowins   |         31 | buk1         | 2007-04-27 |        |           |
--       2903009 | msowins   |         32 | buk1         | 2007-04-27 |        |           |
-- (17 wierszy)
