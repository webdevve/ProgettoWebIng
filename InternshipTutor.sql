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
    approvazione enum('approvata', 'non approvata', 'attesa', 'in corso', 'chiusa') default 'attesa',
    documento text,
    condizione varchar(200),
    file varchar(200)
);

create table doc_finale(
	id integer unsigned primary key not null auto_increment,
    id_studente integer unsigned not null,
    doc_finale text,
    constraint doc_finale_studente foreign key (id_studente) references studente(id) on delete cascade on update cascade
);

create table documenti(
	id integer unsigned primary key not null auto_increment,
    id_studente integer unsigned not null,
    id_azienda integer unsigned not null,
    utente enum('azienda', 'studente') not null,
    doc text not null,
    titolo varchar(300) not null,
    constraint doc_studente foreign key (id_studente) references studente(id) on delete cascade on update cascade,
    constraint doc_azienda foreign key (id_azienda) references azienda(id) on delete cascade on update cascade
);

create view offerta_azienda AS 
select offerta.id, offerta.titolo, offerta.luogo, offerta.durata, offerta.descrizione, offerta.modalita, offerta.orari, offerta.rimborsi, offerta.obiettivi, 
	azienda.ragione_sociale, azienda.indirizzo, azienda.ambito, azienda.nome_responsabile, azienda.cognome_responsabile, azienda.telefono_responsabile, 
    azienda.email_responsabile, azienda.email_azienda, azienda.id as id_azienda
from offerta join azienda
where offerta.id_azienda = azienda.id;

create view candidatura_studente as
SELECT canditature.id, canditature.condizione, canditature.cfu, canditature.tutoreUniversitario, canditature.emailTutoreUni, canditature.telefonoTutoreUni, studente.nome, studente.cognome,
studente.email_studente,studente.id as id_studente, studente.luogo_nascita, studente.residenza, studente.cf, studente.data_nascita, studente.telefono, studente.handicap, canditature.id_offerta, canditature.approvazione
 from internshiptutor.canditature join internshiptutor.studente 
where canditature.id_studente = studente.id;

create view documento_formativo as
select 
candidatura_studente.id, candidatura_studente.nome, candidatura_studente.cognome, candidatura_studente.luogo_nascita, candidatura_studente.data_nascita, candidatura_studente.residenza, candidatura_studente.cf,
candidatura_studente.telefono, candidatura_studente.condizione, candidatura_studente.handicap, offerta_azienda.ragione_sociale, offerta_azienda.luogo,
offerta_azienda.ambito, offerta_azienda.orari, offerta_azienda.durata, candidatura_studente.cfu, offerta_azienda.nome_responsabile, 
offerta_azienda.cognome_responsabile, offerta_azienda.telefono_responsabile, offerta_azienda.email_responsabile, offerta_azienda.email_azienda, offerta_azienda.titolo, offerta_azienda.obiettivi,
offerta_azienda.modalita, offerta_azienda.rimborsi, candidatura_studente.tutoreUniversitario, candidatura_studente.emailTutoreUni, candidatura_studente.telefonoTutoreUni, candidatura_studente.approvazione,
candidatura_studente.email_studente, candidatura_studente.id_studente, offerta_azienda.id_azienda
from candidatura_studente join offerta_azienda where candidatura_studente.id_offerta = offerta_azienda.id