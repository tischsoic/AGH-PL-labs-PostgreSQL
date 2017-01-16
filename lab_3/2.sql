select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa like 'S%';

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa like 'S%i';

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa like 'S% m%';

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa similar to '(A|B|C)%';

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa similar to '%(O|o)rzech%';

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa like 'S%m%';

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa similar to '%(maliny|truskawki)%';

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa not like '^[D-K|S|T].*';

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa like '^Slod%';

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa ~ '^[[:alnum:]]$';


