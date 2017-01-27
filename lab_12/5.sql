-- Utwórz widok (perspektywę), który zwraca: identyfikator zamówienia,
-- datę realizacji, nazwę i adres klienta dla każdego zamówienia - zapytanie takie
-- może być używane np. przez dział wysyłki.

create view zamowienia_z_klientami as
    select idzamowienia, datarealizacji, nazwa, ulica || miejscowosc
    from zamowienia
    natural join klienci;


-- Udostępnij widok z poprzedniego zadania innemu użytkownikowi do odczytu
-- (pracownikowi działu zamówień ;))
grant select on zamowienia_z_klientami to testowa;
