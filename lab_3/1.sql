select idzamowienia, datarealizacji from zamowienia
where datarealizacji between '2013-11-12' and '2013-11-20';

select idzamowienia, datarealizacji from zamowienia
where datarealizacji between '2013-12-1' and '2013-12-6'
	or datarealizacji between '2013-12-15' and '2013-12-20';

select idzamowienia, datarealizacji from zamowienia
where extract (year from datarealizacji) = '2013'
	and extract (month from datarealizacji) = '11';	

select idzamowienia, datarealizacji from zamowienia
where extract (year from datarealizacji) = '2013'
	and extract (month from datarealizacji) in ('11', '12');

select idzamowienia, datarealizacji from zamowienia
where extract (day from datarealizacji) in ('17', '18', '19');

select idzamowienia, datarealizacji from zamowienia
where extract (week from datarealizacji) in ('46', '47');

