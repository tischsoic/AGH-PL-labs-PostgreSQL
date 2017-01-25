\o do_porownania_przed_czekoladki.txt
select * from czekoladki;


\o do_porownania_przed_zawartosc.txt
select * from zawartosc;


\o do_porownania_przed_pudelka.txt
select * from pudelka;

\o do_porownania_przed_zysk_na_pudelku.txt
select idpudelka, zyskNaPudelku(idpudelka) from pudelka;


-- by zakonczyc wypisywanie do ostatnio podanego pliku poprzez komędę \o
\o ;
