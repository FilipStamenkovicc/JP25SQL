drop database if exists dostavna;
create database dostavna character set utf8;
use dostavna;

create table kupac(
    kupac_id int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    ulica varchar(50),
    grad varchar(50),
    postanskibroj nvarchar(50),
    drzava varchar(10),
    brojtelefona varchar(15),
    iban varchar(20),
    OIB char(11),
    email varchar(20)
);

create table narudzba(
    narudzba_id int not null primary key auto_increment,
    kupac_id int not null,
    zaposlenik_id int not null,
    ulica varchar(50),
    grad varchar(50),
    drzava varchar(50),
    postanskibroj nvarchar(50),
    datumnarudzbe datetime,
    datumisporuke datetime,
    nacinplacanja varchar(10),
    kolicina nvarchar(3)
);

create table proizvod(
    proizvod_id int not null primary key auto_increment,
    naziv varchar(50),
    cijena decimal(10.2),
    tip varchar(50)
);

create table detaljinarudzbe(
    narudzba_id int not null,
    proizvod_id int not null,
    kolicina char(10),
    popust varchar(4)
);

create table zaposlenik(
    zaposlenik_id int not null primary key auto_increment,
    ime varchar(10) NOT NULL,
    prezime varchar(18) NOT NULL,
    adresa varchar(20) NOT NULL,
    email varchar(15) NOT NULL,
    iban varchar(20),
    oib char(11)
);

alter table detaljinarudzbe add foreign key (narudzba_id) references narudzba(narudzba_id);
alter table detaljinarudzbe add foreign key (proizvod_id) references proizvod(proizvod_id);
alter table narudzba add foreign key (kupac_id) references kupac(kupac_id);
alter table narudzba add foreign key (zaposlenik_id) references zaposlenik(zaposlenik_id);























