select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where orzechy is not null;

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where orzechy is null;

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where orzechy is not null or nadzienie is not null;

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where czekolada in ('mleczna', 'biała') and orzechy is null;

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where czekolada not in ('mleczna', 'biała')
	and (orzechy is not null or nadzienie is not null);

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nadzienie is not null;

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nadzienie is null;

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where orzechy is null and nadzienie is null;

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where czekolada in ('mleczna', 'biała') and nadzienie is null;
