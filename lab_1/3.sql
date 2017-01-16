SELECT * FROM public.czekoladki
WHERE czekolada='mleczna'
ORDER BY idczekoladki
ASC

SELECT * FROM public.czekoladki
WHERE czekolada='mleczna'
and orzechy='laskowe'
ORDER BY idczekoladki
ASC

SELECT * FROM public.czekoladki
WHERE czekolada in ('mleczna', 'gorzka')
ORDER BY idczekoladki
ASC

SELECT * FROM public.czekoladki
WHERE masa > 25
ORDER BY idczekoladki
ASC


SELECT * FROM public.klienci
WHERE miejscowosc in ('Gdansk', 'Krakow', 'Warszawa')
ORDER BY idklienta
ASC

SELECT * FROM public.klienci
WHERE miejscowosc not in ('Gdansk')
ORDER BY idklienta
ASC

SELECT * FROM public.klienci
WHERE ulica like 'Akacjowa__%'
ORDER BY idklienta
ASC
