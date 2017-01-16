select idczekoladki, nazwa, masa, koszt from czekoladki
where masa between 15 and 24
	union
select idczekoladki, nazwa, masa, koszt from czekoladki
where koszt between 0.15 and 0.24;


select idczekoladki, nazwa, masa, koszt from czekoladki
where masa between 25 and 35
	except
select idczekoladki, nazwa, masa, koszt from czekoladki
where koszt between 0.25 and 0.35;


(select idczekoladki, nazwa, masa, koszt from czekoladki
where masa between 15 and 24
	intersect
select idczekoladki, nazwa, masa, koszt from czekoladki
where koszt between 0.15 and 0.24)
	union
(select idczekoladki, nazwa, masa, koszt from czekoladki
where masa between 25 and 35
	intersect
select idczekoladki, nazwa, masa, koszt from czekoladki
where koszt between 0.25 and 0.35)


select idczekoladki, nazwa, masa, koszt from czekoladki
where masa between 15 and 24
	intersect
select idczekoladki, nazwa, masa, koszt from czekoladki
where koszt between 0.15 and 0.24;


select idczekoladki, nazwa, masa, koszt from czekoladki
where masa between 25 and 35
	except
select idczekoladki, nazwa, masa, koszt from czekoladki
where koszt between 0.15 and 0.24
	except
select idczekoladki, nazwa, masa, koszt from czekoladki
where koszt between 0.29 and 0.35;
