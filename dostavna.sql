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
    brojtelefona varchar(50)
);

create table narudzba(
    brojnarudzbe int not null primary key auto_increment,
    kupac_id int not null,
    ulica varchar(50),
    grad varchar(50),
    drzava varchar(50),
    postanskibroj nvarchar(50),
    datumnarudzbe datetime,
    datumisporuke datetime,
    kolicina nvarchar(100),
    proizvod_id int not null
);

create table proizvod(
    proizvod_id int not null primary key auto_increment,
    naziv varchar(50),
    cijena decimal(18.2),
    tip varchar(50),
    brojnarudzbe int not null
);


alter table narudzba add foreign key (kupac_id) references kupac(kupac_id);
alter table proizvod add foreign key (brojnarudzbe) references narudzba(brojnarudzbe);























