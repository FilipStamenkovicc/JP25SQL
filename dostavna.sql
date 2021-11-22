drop database if exists dostavna;
create database dostavna character set utf8;
use dostavna;

create table kupac(
    kupac int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    ulica varchar(50),
    grad varchar(50),
    postanskibroj nvarchar(50),
    brojtelefona varchar(50)
);

create table narudzba(
    brojnarudzbe int not null primary key auto_increment,
    kupac int not null,
    ulica varchar(50),
    grad varchar(50),
    drzava varchar(50),
    postanskibroj nvarchar(50),
    datumisporuke datetime,
    proizvod int not null
);

create table proizvod(
    proizvod int not null primary key auto_increment,
    kolicina nvarchar(100),
    tip varchar(50)
);


create table isporuka(
    isporuka int not null primary key auto_increment,
    proizvod int not null,
    brojnarudzbe int not null,
    datumisporuke datetime
);

alter table narudzba add foreign key (kupac) references kupac(kupac);
alter table narudzba add foreign key (proizvod) references proizvod(proizvod);
alter table isporuka add foreign key (proizvod) references proizvod(proizvod);
alter table isporuka add foreign key (brojnarudzbe) references narudzba(brojnarudzbe);
























