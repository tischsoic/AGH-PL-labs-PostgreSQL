create table klient (
    idklienta varchar(10) primary key, -- - typ znakowy, maksymalnie 10 znaków (tzn. użyć varchar(10)), klucz główny,
    haslo varchar(10)- typ znakowy, maksymalnie 10 znaków, minimum 4 znaki, wymagane,
    nazwa - typ znakowy, maksymalnie 40 znaków, wymagane,
    miasto - typ znakowy, maksymalnie 40 znaków, wymagane,
    kod - typ znakowy, dokładnie 6 znaków, wymagane,
    adres - typ znakowy, maksymalnie 40 znaków, wymagane,
    email - typ znakowy, maksymalnie 40 znaków,
    telefon - typ znakowy, maksymalnie 16 znaków, wymagane,
    fax - typ znakowy, maksymalnie 16 znaków,
    nip - typ znakowy, dokładnie 13 znaków,
    regon - typ znakowy, dokładnie 9 znaków
)

idkompozycji - typ znakowy, dokładnie 5 znaków (tzn. użyć char(5)), klucz główny,
nazwa - typ znakowy, maksymalnie 40 znaków, wymagane,
opis - typ znakowy, maksymalnie 100 znaków,
cena - typ numeryczny z dokładnością do 2 cyfr po przecinku, minimalna cena to 40.00 zł,
minimum - typ całkowity,
stan - typ całkowity,

idodbiorcy - typ serial, klucz główny,
nazwa - typ znakowy, maksymalnie 40 znaków, wymagane,
miasto - typ znakowy, maksymalnie 40 znaków, wymagane,
kod - typ znakowy, dokładnie 6 znaków, wymagane,
adres - typ znakowy, maksymalnie 40 znaków, wymagane,

idzamowienia - typ całkowity, klucz główny,
idklienta - typ znakowy, maksymalnie 10 znaków, klucz obcy, wymagane,
idodbiorcy - typ całkowity, klucz obcy, wymagane,
idkompozycji - typ znakowy, dokładnie 5 znaków, klucz obcy, wymagane,
termin - data, wymagane,
cena - typ numeryczny z dokładnością do 2 cyfr po przecinku,
zaplacone - typ logiczny,
uwagi - typ znakowy, maksymalnie 200 znaków,

idzamowienia - typ całkowity, klucz główny,
idklienta - typ znakowy, maksymalnie 10 znaków,
idkompozycji - typ znakowy, dokładnie 5 znaków,
cena - typ numeryczny z dokładnością do 2 cyfr po przecinku,
termin - data,

idkompozycji - typ znakowy, dokładnie 5 znaków, klucz główny i klucz obcy,
data - data.
