#SCRIPT DI LANCIO Utenze

use internshiptutor;

#ADMIN
#admin
insert into amministratore (nome, cognome, email_admin, pwd_admin) values ('admin', 'admin', 'admin@gmail.com', 'benjo');

#AZIENDE
#isweb001
insert into azienda (ragione_sociale, indirizzo, partita_iva, codice_fiscale, nome_legale_rappr, cognome_legale_rappr, 
	nome_responsabile, cognome_responsabile, telefono_responsabile, email_responsabile, foro, email_azienda, pwd_azienda,
    descrizione, ambito) values ('IsWeb', 'Via Tiburtina Valeria Km. 112,500 - 67068 Cappelle dei Marsi (AQ)', 
    '01722270665', '01722270665', 'Mario', 'Rossi', 'Fausto', 'Leali', '123 4567890', 'fausto.leali@email.it', 
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
    
#STUDENTI
insert into studente (nome, cognome, luogo_nascita, data_nascita, residenza, cf, telefono, corso_laurea, email_studente, pwd_studente) values('Davidde', 'Simboli', 'Avezzano', '1995-08-21', 'Via Niccolò Paganini, 29 67057 Pescina (AQ)', 'SMBDVD95M21A515J', '329 4768291', 'Informatica', 'davide.simboli@gmail.com', 'ebwjef001');
insert into studente (nome, cognome, luogo_nascita, data_nascita, residenza, cf, telefono, corso_laurea, email_studente, pwd_studente) values('Antonio', 'Palermo', 'Avezzano', '1995-03-24', 'Via non lo so, 11 67058 Cerchio (AQ)', 'PLMNTN95M24A632Y', '333 2568742', 'Informatica', 'antonio.palermo@email.it', 'boupojp001');
insert into studente (nome, cognome, luogo_nascita, data_nascita, residenza, cf, telefono, corso_laurea, email_studente, pwd_studente) values('Alessio', 'Morgante', 'Avezzano', '1997-01-12', 'Via Boh, 1A 67051 Caruscino (AQ)', 'MRGLSS97M12E014L', '328 4512962', 'Informatica', 'alessio.morgante@email.it', 'bmfttjp001');
insert into studente (nome, cognome, luogo_nascita, data_nascita, residenza, cf, telefono, corso_laurea, email_studente, pwd_studente) values('Gigi', 'Baffo', 'Tagliacozzo', '1998-04-20', 'Via calata, snc 69002 Tagliacozzo (AQ)', 'FFOGIG98M20Y470X', '387 3054871', 'Ingegneria Informatica', 'gigi.baffo@email.it', 'hjhj001');
insert into studente (nome, cognome, luogo_nascita, data_nascita, residenza, cf, telefono, corso_laurea, email_studente, pwd_studente) values('Salvatore', 'De Curtis', 'Pescara', '1996-12-31', 'Via Fallacci, 101 62320 Pescara (PE)', 'FLCSLV96M31Q580Z', '389 5465875', 'Ingegneria dell\'Informazione', 'salvatore.decurtis@email.it', 'tbmwbupsf001');