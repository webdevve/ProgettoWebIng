drop database if exists internshiptutor;
create database internshiptutor;
use internshiptutor;

create table amministratore(
	id integer unsigned primary key not null auto_increment,
    nome varchar(100) not null,
    cognome varchar(100) not null,
    email_admin varchar (100) not null unique,
    pwd_admin varchar(50) not null
);

create table azienda(
	id integer unsigned primary key not null auto_increment,
    ragione_sociale varchar(200) not null,
    indirizzo varchar(200) not null,
    partita_iva char(11) not null,
    codice_fiscale char(16),
    nome_legale_rappr varchar(100) not null,
    cognome_legale_rappr varchar(100) not null,
    nome_responsabile varchar(100) not null,
    cognome_responsabile varchar(100) not null,
    telefono_responsabile varchar(15) not null,
    email_responsabile varchar(100) not null,
    foro varchar(150) not null,
    email_azienda varchar(100) not null unique,
    pwd_azienda varchar(50) not null,
    descrizione text not null,
    ambito varchar(150) not null,
    documento_convenzione varchar(150),
    stato enum ('convenzionata','approvata', 'inAttesa', 'nonApprovata') default 'inAttesa' not null
);

create table offerta(
	id integer unsigned primary key not null auto_increment,
    titolo varchar(200) not null,
    descrizione text not null,
    luogo varchar(200) not null,
    orari varchar(200),
    durata varchar(200) not null,
    obiettivi text,
    modalita enum('team aziendale', 'in remoto'),
    rimborsi enum('si', 'no') default 'no',
    stato enum('aperta','chiusa') default 'aperta',
    id_azienda integer unsigned not null,
    constraint offerta_azienda foreign key (id_azienda) references azienda(id) on update cascade on delete cascade
);

create table studente(
	id integer unsigned primary key not null auto_increment,
    nome varchar(100) not null,
    cognome varchar(100) not null,
    luogo_nascita varchar(100) not null,
    data_nascita date not null,
    residenza varchar(200) not null,
    cf char(16) not null,
    telefono varchar(15) not null,
    corso_laurea varchar(150) not null,
    handicap enum('si', 'no') default 'no',
    email_studente varchar(100) not null unique,
    pwd_studente varchar(50) not null
);

create table canditature(
	id integer unsigned primary key not null auto_increment,
    id_studente integer unsigned not null,
    id_offerta integer unsigned not null,
    data_inizio date,
    data_fine date,
    cfu integer,
    tutoreUniversitario varchar (100),
    telefonoTutoreUni varchar (50),
    emailTutoreUni varchar (100),
    approvazione enum('approvata', 'non approvata', 'attesa') default 'attesa',
    documento text,
    condizione varchar(200)
);

create table doc_finale(
	id integer unsigned primary key not null auto_increment,
    id_studente integer unsigned not null,
    doc_finale text,
    constraint doc_finale_studente foreign key (id_studente) references studente(id) on delete cascade on update cascade
);

create view offerta_azienda AS 
select offerta.id, offerta.titolo, offerta.luogo, offerta.durata, offerta.descrizione, offerta.modalita, offerta.orari, offerta.rimborsi, offerta.obiettivi, 
	azienda.ragione_sociale, azienda.indirizzo, azienda.ambito, azienda.nome_responsabile, azienda.cognome_responsabile, azienda.telefono_responsabile, 
    azienda.email_responsabile
from offerta join azienda
where offerta.id_azienda = azienda.id;