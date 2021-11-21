drop database if exists doktorskaordinacija;
create database doktorskaordinacija character set utf8;
use doktorskaordinacija;

create table doktor(
    sifra int not null primary key auto_increment,
    osoba int not null,
    iban varchar(50),
    sestra int not null
);

create table lijeci(
    doktor int not null,
    datum datetime,
    diagnoza varchar(50),
    pacjent int not null
);

create table pacjent(
    sifra int not null primary key auto_increment,
    osoba int not null,
    datumdolaska datetime
);

create table pomaze(
    sestra int not null,
    doktor int not null,
    metoda varchar(50)
);

create table sestra(
    sifra int not null primary key auto_increment,
    osoba int not null,
    iban varchar(50),
    pomaze int not null
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char(11)
);

alter table doktor add foreign key (sestra) references sestra(sifra);
alter table pomaze add foreign key (sestra) references sestra(sifra);
alter table lijeci add foreign key (doktor) references doktor(sifra);
alter table lijeci add foreign key (pacjent) references pacjent(sifra);
alter table doktor add foreign key (osoba) references osoba(sifra);
alter table pacjent add foreign key (osoba) references osoba(sifra);
alter table sestra add foreign key (osoba) references osoba(sifra);


























