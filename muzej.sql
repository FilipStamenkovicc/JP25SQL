drop database if exists muzej;
create database muzej character set utf8;
use muzej;

create table izlozba(
    sifra int not null primary key auto_increment, 
    djela int not null,
    vrijeme varchar(50) not null,
    sponzor int not null,
    kustos int not null
);

create table kustos(
    sifra int not null primary key auto_increment,
    osoba int not null,
    iban varchar(50)
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11)
);

create table djela(
    sifra int not null primary key auto_increment,
    vrsta varchar(50) not null,
    vrijednost decimal(18,2)
);

create table sponzor(
    sifra int not null primary key auto_increment,
    vrsta varchar(50) not null,
    budget decimal(25,2)
);

create table klijent(
    sifra int not null primary key auto_increment,
    osoba int not null,
    budget decimal(25,2),
    datumdolaska datetime
);

alter table izlozba add foreign key (kustos) references kustos(sifra);
alter table kustos add foreign key (osoba) references osoba(sifra);
alter table izlozba add foreign key (sponzor) references sponzor(sifra);
alter table izlozba add foreign key (djela) references djela(sifra);
alter table klijent add foreign key (osoba) references osoba(sifra);

# 2 - 5
insert into osoba(sifra,ime,prezime,oib) values
(null,'Ivica','Ivić','25469845213'),
(null,'Marica','Mirić','12546854125'),
(null,'Marko','Buzina','25468789548'),
(null,'Ivan','Kuštić','25648795681');

# 2
insert into klijent(sifra,osoba,budget,datumdolaska) values
(null,3,56879.26,2024-06-27);


# 1
insert into osoba(sifra,ime,prezime,oib) values
(null,'Kristijan','Tonković','52648535148');

insert into kustos(sifra,osoba,iban) values
(null,1,12548796);

























