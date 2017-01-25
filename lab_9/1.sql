create table klienci (
    idklienta varchar(10) primary key,
    haslo varchar(10),
    nazwa varchar(40) not null,
    miasto varchar(40) not null,
    kod char(6) not null,
    adres varchar(40) not null,
    email varchar(40),
    telefon varchar(16) not null,
    fax varchar(16),
    nip char(13),
    regon char(9),
    constraint dlugosc_hasla check (length(haslo) >= 4)
);

create table kompozycje (
    idkompozycji char(5) primary key,
    nazwa varchar(40) not null,
    opis varchar(100),
    cena numeric(7, 2),
    minimum integer,
    stan integer,
    constraint minimalna_cena check (cena >= 40.00)
);

create table odbiorcy (
    idodbiorcy serial primary key,
    nazwa varchar(40) not null,
    miasto varchar(40) not null,
    kod char(6) not null,
    adres varchar(40) not null
);

create table zamowienia (
    idzamowienia integer primary key,
    idklienta varchar(10) not null,
    idodbiorcy integer not null,
    idkompozycji char(5) not null,
    termin date not null,
    cena numeric(7, 2),
    zaplacone boolean,
    uwagi varchar(200),
    foreign key (idklienta) references klienci,
    foreign key (idodbiorcy) references odbiorcy,
    foreign key (idkompozycji) references kompozycje
);

create table historia (
    idzamowienia integer primary key,
    idklienta varchar(10),
    idkompozycji char(5),
    cena numeric(7, 2),
    termin date
);

create table zapotrzebowanie (
    idkompozycji char(5) primary key,
    data date,
    foreign key (idkompozycji) references kompozycje
);

-- Sprawdź jaka jest wartość domyślna w kolumnie odbiorcy.idodbiorcy. Skąd się bierze ta wartość?
select column_name, column_default
from information_schema.columns
where (table_schema, table_name) = ('public', 'odbiorcy')
order by ordinal_position;
