select idklienta from klienci
	intersect
select idklienta from zamowienia;


select idpudelka from pudelka
	except
select idpudelka from artykuly;


select nazwa from klienci
where nazwa similar to '%(R|r)z%'
	union

select nazwa from czkoladki
where nazwa similar to '%(R|r)z%'
	union
select nazwa from pudelka
where nazwa similar to '%(R|r)z%'


select idczekoladki from czekoladki
	except
select idczekoladki from zawartosc
where idpudelka is not null;

