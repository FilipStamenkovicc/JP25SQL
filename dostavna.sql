drop database if exists dostavna;
create database dostavna character set utf8;
use dostavna;

create table kupac(
    kupac_id int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    adresa varchar(50) not null,
    grad varchar(50) not null,
    postanskibroj nvarchar(50) not null,
    drzava varchar(10),
    brojtelefona varchar(15) not null,
    iban varchar(20),
    OIB char(11),
    email varchar(20) not null
);

create table narudzba(
    narudzba_id int not null primary key auto_increment,
    kupac_id int not null,
    zaposlenik_id int not null,
    datumnarudzbe datetime,
    datumisporuke datetime,
    nacinplacanja varchar(10)
);

create table proizvod(
    proizvod_id int not null primary key auto_increment,
    naziv varchar(50),
    cijena decimal(10,2),
    tip varchar(15)
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

insert into zaposlenik (zaposlenik_id,ime,prezime,adresa,email,iban,oib) values
(null,'Goran','Perić','Šumarska 4','gogzii91@gmail.com','HR451246944','29547256023'),
(null,'Zvonimir','Zlatarić','Omladinska 14','zvone55@gmail.com','HR1123455478','28461332547'),
(null,'Kornelija','Kos','Biljska 7','kornelija88@gmail.com','HR3762459878','45923538547'),
(null,'Kristina','Liović','Vezna 17','kristina.liovic@gmail.com','HR2956759768','29456131147'),
(null,'Sanela','Koški','Vjenac Dinare 6','slaja18@gmail.com','HR29464596578','12385132247'),
(null,'Ivan','Ivić','Nordijska 55','ivan55@gmail.com','HR429539578','54845123457'),
(null,'Marko','Perica','Omladinska 85','markic@gmail.com','HR2349854278','55555344472');

insert into kupac (kupac_id,ime,prezime,adresa,grad,postanskibroj,drzava,brojtelefona,iban,oib,email) values
(null,'Matko','Masoničić','Vjenac Lipa 2','Osijek','31000','Hrvatska','097/762-6151','HR65787412965','45126548745','nebuloz75@gmail.com'),
(null,'Milan','Badelj','Vjenac Dinare 2','Osijek','31000','Hrvatska','097/772-6121','HR56368412965','45126548745','zezalica55@gmail.com'),
(null,'Tihomir','Petrović','Sljemenska 4','Osijek','31000','Hrvatska','097/552-6561','HR52357412965','45126548745','masina91@gmail.com'),
(null,'Filip','Filipćić','Vukovarska 13','Osijek','31000','Hrvatska','097/762-6161','HR56486782965','45126548745','kaos92@gmail.com'),
(null,'Josip','Kos','Papina 4','Osijek','31000','Hrvatska','097/482-5561','HR56487415545','45126548745','mirni8@gmail.com'),
(null,'Ivan','Rusan','Jablanska 60','Osijek','31000','Hrvatska','097/672-6161','HR56555412965','45126548745','vrazic66@gmail.com'),
(null,'Zorica','Rukavina','Likvidatorska 28','Osijek','31000','Hrvatska','097/762-6161','HR56666412965','45126548745','luca92@gmail.com'),
(null,'Ivana','Horvat','Kolodvorska 2','Osijek','31000','Hrvatska','097/762-6161','HR56487415675','45126548745','mazrh8@gmail.com'),
(null,'Mihaela','Soničić','Sjenjak 45','Osijek','31000','Hrvatska','097/762-6161','HR564874156785','45126548745','nordin55@gmail.com'),
(null,'Marija','Oničić','Frankopanska 14','Osijek','31000','Hrvatska','091/662-6161','HR56485674965','45126548745','mrakdude36@gmail.com'),
(null,'Zvonimir','Mason','Dalmatinska 4','Osijek','31000','Hrvatska','097/762-6551','HR56487567565','45126548745','zivka@gmail.com');

insert into proizvod (proizvod_id,naziv,cijena,tip) values
(null,'Naslonjač','669.99','Namještaj'),
(null,'Tabure','199.99','Namještaj'),
(null,'Radni Stol','800.99','Namještaj'),
(null,'Krevet','1999.99','Namještaj'),
(null,'Regal','2500.00','Namještaj'),
(null,'Slika','200.00','Namještaj'),
(null,'Ukrasni Jastuk','99.99','Namještaj'),
(null,'Komoda','1250.58','Namještaj'),
(null,'Stol Za Računalo','500.00','Namještaj'),
(null,'Vrtna sjedalica','999.99','Namještaj'),
(null,'Odvijač','45.00','Alat'),
(null,'Ključ','20.00','Alat'),
(null,'Bušilica Makita','850.99','Alat'),
(null,'Kosilica Honda','2999','Alat'),
(null,'Trimer','998.98','Alat'),
(null,'Imbus Ključ','25.99','Alat'),
(null,'Grablje Inox','150.00','Alat'),
(null,'Lopata Limex','100.00','Alat'),
(null,'Mješalica Betona','1999.99','Alat'),
(null,'Rukavice','55.99','Odjeća'),
(null,'Trenerka Adiddas','850.99','Odjeća'),
(null,'Kapa Puma','49.99','Odjeća'),
(null,'Čarape Nike','29.99','Odjeća'),
(null,'Podkošulja','13.99','Odjeća'),
(null,'Pulover','489.99','Odjeća'),
(null,'Kratka Majica','59.99','Odjeća'),
(null,'Čizme Borovo','999.99','Obuća'),
(null,'Tenisica Nike','666.99','Obuća'),
(null,'Luster','1000.99','Rasvjeta'),
(null,'Flekserica','999.99','Alat'),
(null,'Vibra','100.00','Alat'),
(null,'Mjerač Struje','888.98','Alat');

insert into narudzba (narudzba_id,kupac_id,zaposlenik_id,datumnarudzbe,datumisporuke,nacinplacanja) values
(null,1,2,'2020-12-23','2021-01-06','Gotovina'),
(null,1,5,'2020-12-23','2021-01-06','Gotovina'),
(null,3,7,'2020-12-23','2021-01-06','Gotovina'),
(null,4,3,'2020-12-23','2021-01-06','Gotovina'),
(null,4,7,'2020-12-23','2021-01-06','Gotovina'),
(null,1,7,'2020-12-23','2021-01-06','Gotovina'),
(null,2,5,'2020-12-23','2021-01-06','Gotovina'),
(null,3,2,'2020-12-23','2021-01-06','Gotovina'),
(null,6,5,'2020-12-23','2021-01-06','Gotovina'),
(null,8,7,'2020-12-23','2021-01-06','Gotovina'),
(null,1,6,'2020-12-23','2021-01-06','Gotovina');






















