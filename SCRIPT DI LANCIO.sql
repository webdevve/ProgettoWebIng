#SCRIPT DI LANCIO

use internshiptutor;

#ADMIN
#admin
insert into amministratore (nome, cognome, email_admin, pwd_admin) values ('admin', 'admin', 'admin@gmail.com', 'benjo');

#AZIENDE
#isweb001
insert into azienda (ragione_sociale, indirizzo, partita_iva, codice_fiscale, nome_legale_rappr, cognome_legale_rappr, 
	nome_responsabile, cognome_responsabile, telefono_responsabile, email_responsabile, foro, email_azienda, pwd_azienda,
    descrizione, ambito) values ('IsWeb', 'Via Tiburtina Valeria Km. 112,500 - 67068 Cappelle dei Marsi (AQ)', 
    '01722270665', '01722270665', 'Mario', 'Rossi', 'Fausto', 'Leali', '123 4567890', 'mario.rossi@email.it', 
    'L\'Aquila', 'isweb@email.it', 'jtxfc001', 'Oggi ISWEB S.p.A. opera nel comparto della ”progettazione e 
    sviluppo di software per gli ambienti di rete”', 'Informatica');
    
#engineering001
insert into azienda (ragione_sociale, indirizzo, partita_iva, codice_fiscale, nome_legale_rappr, cognome_legale_rappr, 
	nome_responsabile, cognome_responsabile, telefono_responsabile, email_responsabile, foro, email_azienda, pwd_azienda,
    descrizione, ambito) values ('Engineering', 'Via G. Galilei - 50051 Roma (RM)', '05724831002', '05724831002', 'Giuseppe', 
    'Bianchi', 'Giulio', 'Tiscali', '322 0267814', 'giulio.tiscali@email.it', 'Roma', 'engineering@email.it', 'fohjoffsjoh001', 
    'Tra i principali attori della trasformazione digitale di aziende e organizzazioni pubbliche e private, con un\'offerta 
    innovativa di piattaforme per i principali segmenti di mercato.', 'Ingegneria Informatica');
    
#aubay001
insert into azienda (ragione_sociale, indirizzo, partita_iva, codice_fiscale, nome_legale_rappr, cognome_legale_rappr, 
	nome_responsabile, cognome_responsabile, telefono_responsabile, email_responsabile, foro, email_azienda, pwd_azienda,
    descrizione, ambito) values ('Aubay', 'Largo La Foppa 2 - 20121 Milano (MI)', '12339020153', '12339020153', 'Virgilio', 
    'De Frigis', 'Amleto', 'Acitore', '365 0128794', 'amleto.acitore@email.it', 'Milano', 'aubay@email.it', 'bvcbz001', 
    'Aubay è una Digital Service Company, leader europea nelle aree della consulenza direzionale e dell’information & 
    communication technology.', 'Informatica');
    
#informetica001
insert into azienda (ragione_sociale, indirizzo, partita_iva, codice_fiscale, nome_legale_rappr, cognome_legale_rappr, 
	nome_responsabile, cognome_responsabile, telefono_responsabile, email_responsabile, foro, email_azienda, pwd_azienda,
    descrizione, ambito) values ('Informetica', 'Viale del Lavoro - 69087 S. Martino Buonalbergo (VR)', '03481480238', 
    '03481480238','Carlo', 'Grippis', 'Valerio', 'Rista', '398 4896217', 'valerio.rista@email.it', 'Verona', 'informetica@email.it', 
    'jogpsnfujdb001', 'InformEtica Consulting è una azienda italiana con un’importante esperienza nell’IT che mette a disposizione 
    delle PMI per incrementare la crescita del loro business. 
    Attiva dal 2005 come Gold Partner di SAP con la soluzione SAP Business One, InformEtica Consulting si è saputa inserire nel 
    mercato italiano ed estero con lo sviluppo di soluzioni per la Produzione, l’e-commerce B2B e la Logistica.', 'IT Consulting');
    
#OFFERTE
insert into offerta (titolo, descrizione, luogo, orari, durata, obiettivi, modalita, rimborsi, id_azienda) values ('Progettazione e 
sviluppo Software', 'Offriamo un tirocinio formativo, con successiva possibilità di assunzione, mirato sulla progettazione e sullo 
sviluppo di software applicativi usando tecniche di ultima generazione', 'Avezzano', '09:00 - 13:00 / 14:00 - 18:00', '150 Ore', 
'Autonomia nella realizzazione di applicativi softwer complessi', 'team aziendale', 'si', '1');

insert into offerta (titolo, descrizione, luogo, orari, durata, obiettivi, modalita, rimborsi, id_azienda) values ('Cyber Security', 
'Offriamo un tirocinio formativo, dove lavorerai in un ambiente dove gioco di squadra e rapidità delle decisioni fanno emergere 
leadership, visione del business, abilità nella soluzione dei problemi, collaborazione e condivisione degli obiettivi', 'Roma', 
'09:00 - 13:00 / 14:00 - 18:00', '150 Ore', 'Autonomia nella realizzazione di applicativi softwer complessi', 'team aziendale', 'si', '2');

insert into offerta (titolo, descrizione, luogo, orari, durata, obiettivi, modalita, rimborsi, id_azienda) values ('Web Application', 
'Offriamo un tirocinio formativo, dove imparerai a sviluppare delle Web Application per importanti realtà.', 'Roma', 
'09:00 - 13:00 / 14:00 - 18:00', '150 Ore', 'Autonomia nella gestione e manutenzione di applicazioni web', 'team aziendale', 'no', '3');

insert into offerta (titolo, descrizione, luogo, orari, durata, obiettivi, modalita, rimborsi, id_azienda) values ('Enterprise Resource Planning', 
'Offriamo un tirocinio formativo su SAP Business One; il software gestionale che guida al successo le Piccole e Medie Imprese', 'S. Martino Buonalbergo', 
'09:00 - 13:00 / 14:00 - 18:00', '150 Ore', 'Realizzazione per il controllo e la gestione delle imprese', 'team aziendale', 'no', '4');