drop database if exists frizerskisalon;
create database frizerskisalon character set utf8;
use frizerskisalon;

create table frizerskisalon(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null, 
    adresa varchar(50) not null, 
    djelatnik int not null
);

create table djelatnik(
    sifra int not null primary key auto_increment,
    osoba int not null,
    placa varchar(50) not null,
    iban varchar(50) null,
    usluga int not null
);

create table usluga(
    sifra int not null primary key auto_increment,
    korisnik int not null,
    vrsta varchar(50),
    cijena decimal(18,2)
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null, 
    prezime varchar(50) not null,
    oib char(11) 
);

create table korisnik(
    sifra int not null primary key auto_increment,
    osoba int not null
);

alter table frizerskisalon add foreign key (djelatnik) references djelatnik(sifra);
alter table djelatnik add foreign key (osoba) references osoba(sifra);
alter table djelatnik add foreign key (usluga) references usluga(sifra);
alter table usluga add foreign key (korisnik) references korisnik(sifra);
alter table korisnik add foreign key (osoba) references osoba(sifra);

# 1
insert into osoba(sifra,ime,prezime,oib) values
(null,'Ivan','Ivić','25469875846');

# 2 - 10
insert into osoba(sifra,ime,prezime,oib) values
(null,'Marko','Ivić','25469875846'),
(null,'Marija','Ivić','25469875846'),
(null,'Toni','Ivić','25469875846'),
(null,'Samir','Ivić','25469875846'),
(null,'Kristijan','Ivić','25469875846'),
(null,'Josip','Ivić','25469875846'),
(null,'Zlatko','Ivić','25469875846'),
(null,'Mirna','Ivić','25469875846'),
(null,'Mirta','Ivić','25469875846');

# 2 - 10
insert into korisnik(sifra,osoba) values
(null,2),
(null,3),
(null,4),
(null,5),
(null,6),
(null,7),
(null,8),
(null,9),
(null,10);

# 1 - 5
insert into usluga(sifra,korisnik,vrsta,cijena) values
(null,2,'šišanje','80.00'),
(null,3,'šišanje','80.00'),
(null,4,'pramenovi','150.00'),
(null,5,'bojanje','100.00'),
(null,6,'šišanje','80.00');




















