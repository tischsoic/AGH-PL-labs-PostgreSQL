select nazwa, koszt, masa from czekoladki
where masa between 15 and 24
	or koszt between 0.15 and 0.24;

select nazwa, koszt, masa from czekoladki
where (masa between 15 and 24
	and koszt between 0.15 and 0.24)
	or (masa between 25 and 35
	and koszt between 0.15 and 0.24);
-- what is the same as:
select nazwa, koszt, masa from czekoladki
where (masa between 15 and 24
	or masa between 25 and 35)
	and koszt between 0.15 and 0.24;

select nazwa, koszt, masa from czekoladki
where masa between 15 and 24
	and koszt between 0.15 and 0.24;


select nazwa, koszt, masa from czekoladki
where masa between 25 and 35
	and koszt not between 0.15 and 0.24;


select nazwa, koszt, masa from czekoladki
where masa between 25 and 35
	and koszt not between 0.15 and 0.24
	and koszt not between 0.25 and 0.35;


