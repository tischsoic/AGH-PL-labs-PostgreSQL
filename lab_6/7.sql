-- Polecenie COPY pozwala m.in. kopiowanie danych między bazą danych i standardowym
-- systemem plików. Polecenie COPY FROM kopiuje dane z pliku do wskazanej tabeli.
-- Domyślnie wartości atrybutów są oddzielane tabulatorem, zaś NULL jest oznaczany
-- symbolem \N. Polecenie COPY TO kopiuje dane z bazy danych (cała tabela, wybrane
-- kolumny lub wynik instrukcji SELECT) do pliku. Opcje polecenia pozwalają
-- zdefiniować m.in. separator, oznaczenia wartości null, oznaczenie napisu
-- pustego itp. http://www.postgresql.org/docs/9.1/static/sql-copy.html

-- Napisz skrypt zawierający instrukcje COPY wstawiające do bazy danych cukiernia
-- dwa nowe rekordy do tabeli pudelka oraz odpowiednie rekordy związane z tymi
-- pudełkami do tabeli zawartosc. Każde z nowych pudełek ma zawierać łącznie
-- co najmniej 10 czekoladek, w co najmniej 4 różnych smakach.



-- source of underneath code: https://github.com/zbytspokojna/DB_labs/blob/master/lab6.sql
boreanna=> COPY pudelka from stdin;
Enter data to be copied followed by a newline.
End with a backslash and a period on a line by itself.
>> nice         Najmilej mleczne	Najmilsze czekoladki na świecie.        10.00	200
>> game 	Marzenie gracza         Każdy gracz pragnie je mieć na swoim biurku.	13.13   255
>> \.

boreanna=> copy zawartosc from stdin (delimiter('|'));
Enter data to be copied followed by a newline.
End with a backslash and a period on a line by itself.
>> nice|b01|4
>> nice|b02|4
>> nice|b03|4
>> nice|b04|4
>> nice|b05|4
>> game|w01|3
>> game|w02|3
>> game|w03|3
>> game|w06|3
>> \.
