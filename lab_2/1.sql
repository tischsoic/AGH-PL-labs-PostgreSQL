select nazwa, ulica, miejscowosc from klienci order by nazwa;

select * from klienci order by miejscowosc desc, nazwa asc;

select * from klienci
where miejscowosc in ('Kraków', 'Warszawa')
order by miejscowosc desc, nazwa asc;

select * from klienci
where miejscowosc = 'Kraków' or miejscowosc = 'Warszawa'
order by miejscowosc desc, nazwa asc;

select * from klienci order by miejscowosc desc;

select * from klienci
where miejscowosc = 'Kraków'
order by nazwa asc;
