select nazwa, masa from czekoladki
where masa > 20;

select nazwa, masa, koszt from czekoladki
where masa > 20 and koszt > 0.25;

select nazwa, masa, koszt * 100 from czekoladki
where masa > 20 and koszt > 0.25;

select nazwa, czekolada, nadzienie, orzechy from czekoladki
where (czekolada = 'mleczna' and nadzienie = 'maliny') 
	or (czekolada = 'mleczna' and nadzienie = 'maliny')
	or (czekolada != 'gorzka' and orzechy is not null);

select nazwa, koszt from czekoladki
where koszt > 0.25;

select nazwa, czekolada from czekoladki
where czekolada = 'mleczna' or czekolada = 'bia³a'; 

