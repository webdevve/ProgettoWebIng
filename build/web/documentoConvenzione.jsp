<%-- 
    Document   : documentoConvenzione
    Created on : 22-ago-2019, 17.24.11
    Author     : Davide Simboli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Documento di Convenzione</title>
        <link rel="stylesheet" href="css/header.css" type="text/css"/>
        <link rel="stylesheet" href="css/index.css" type="text/css"/>
        <link rel="stylesheet" href="css/documentoConvenzione.css" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Beth+Ellen&display=swap" rel="stylesheet">
    </head>
    <body>
        <%
            HttpSession sessione = request.getSession();
            String str = (String)sessione.getAttribute("username");
            request.setAttribute("name", str);
            if(str == null){
                response.sendRedirect("login.jsp");
            }
            
            String info = (String)request.getAttribute("getInfo");
            String ragioneSociale = (String)request.getAttribute("getRagioneSociale");
            String sedeLegale = (String)request.getAttribute("getSedeLegale");
            String partitaIva = (String)request.getAttribute("getPartitaIva");
            String rappresentante = (String) request.getAttribute("getRappresentante");
            String descrizione = (String) request.getAttribute("getDescrizione");
            String ambito = (String) request.getAttribute("getAmbito");
            String legaleRappresentante = (String) request.getAttribute("getLegaleRappresentante");
                if(info == null){
                    info="";
                }
                if(ragioneSociale == null){
                    ragioneSociale = "";
                }
                if(sedeLegale == null){
                    sedeLegale = "";
                }
                if(partitaIva == null){
                    partitaIva = "";
                }
                if(rappresentante == null){
                    rappresentante = "";
                }
                if(descrizione == null){
                    descrizione = "";
                }
                if(ambito == null){
                    ambito = "";
                }
                if(legaleRappresentante == null){
                    legaleRappresentante = "";
                }
        %>
        <div class="header">
            <a href="#default" class="logo">InternshipTutor</a>
            <div class="header-right">
              <a href="#home">Home</a>
              <a href="#confermaConvenzione">Convenzioni da Confermare</a>
              <a href="#convenzioni" >Convenzioni</a>
              <a href="javascript:{}" onclick="document.getElementById('my_form').submit(); return false;">Logout</a>
            </div>
        </div>
        <form action="logout" method="post" id="my_form"></form>
        <%if(str!=null){%>
        <div class="centra"><img src="icon/user.ico"/><%=str%></div>
        <%}%>
        <h1>Documento di Convenzione</h1>
        
        <form action="generatePDF" method="post">
            <div class="card">
            <div class="cardContainer">
                <h1>UNIVERSITA' DEGLI STUDI DELL'AQUILA</h1>
                <h3>Dipartimento di INGEGNERIA E SCIENZE DELL'INFORMAZIONE E MATEMATICA</h3>
                <p id="head">SEGRETERIA AMMINISTRATIVA PER LA DIDATTICA</p>
                    <div class="centro">
                        <table style="width: 100%;" class="start">
                            <tr>
                                <td style="width: 50%;">
                                    parte riservata<br>
                                    all'universita'
                                </td>
                                <td>
                                    data di ricevimento:__________________________<br>
                                    prot. n.
                                </td>
                            </tr>
                        </table>
                    </div>
                <div class="centro page">
                    <p style="font-weight: bold;">
                        CONVENZIONE PER LO SVOLGIMENTO DI ATTIVITA' DI TIROCINIO 
                        E DI ORIENTAMENTO (AI SENSI DELL'ART.18 L.196/97, DELL'ART.1 
                        DECRETO MINISTERO DEL LAVORO E PREVIDENZA SOCIALE N.142/98 E 
                        DELLA LEGGE 148 del 14/09/2011) PER STUDENTI E LAUREATI DEL 
                        DIPARTIMENTO DI INGEGNERIA E SCIENZE DELL’INFORMAZIONE E 
                        MATEMATICA DELL'UNIVERSITA' DEGLI STUDI DELL'AQUILA
                    </p>
                    <p style="text-align: center;">tra:</p>
                    <p>
                        L’Università degli Studi di L’Aquila – Dipartimento di 
                        Ingegneria e Scienze dell’Informazione e Matematica, con 
                        sede legale in L’Aquila, C.F./P.I. 01021630668, rappresentata 
                        per la stipula del presente atto convenzionale, dal Direttore 
                        del Dipartimento di Ingegneria e Scienze dell’Informazione e 
                        Matematica Prof. Guido Proietti, nato a  Roma il 13.06.1966,
                        domiciliato per il presente atto presso la sede legale del 
                        l’Università, e autorizzato e delegato alla stipula della 
                        presente Convenzione dal Rettore dell’Università con D.R n. 
                        522-2018, prot. n. 22151 del 17.05.2018
                    </p>
                    <p style="text-align: center;">e</p>
                    <p>
                        L’Ente/Azienda <strong><%=ragioneSociale%></strong>,<br>
                        con sede legale in (indirizzo) <strong><%=sedeLegale%></strong>,<br>
                        Codice Fiscale (o Partita IVA) <strong><%=partitaIva%></strong><br>
                        rappresentato da <strong><%=rappresentante%></strong>
                    </p>
                    <p style="text-align: center;">Premesso:</p>
                        <ul>
                            <li>
                                che l’Ente/Azienda <strong><%=ragioneSociale%></strong> intende 
                                avviare progetti di collaborazione con il DISIM finalizzati 
                                alla realizzazione di tirocini formativi e di orientamento 
                                curriculari rivolti agli studenti dell'Università degli Studi 
                                dell'Aquila, con particolare riguardo a tematiche inerenti<sup>1</sup>:<br>
                                <strong><%=descrizione%></strong>
                                che rientrano negli ambiti di interesse scientifico e didattico del DISIM, 
                                e in particolare del/i Corso/i di Studio   <strong><%=ambito%></strong>;
                            </li>
                        </ul>
                    <p style="font-size: 12px;">
                        ____________________________<br>
                        <sup>1</sup>L’Ente/Azienda deve inserire una breve descrizione 
                        di alto livello dei progetti formativi di interesse, enfatizzandone 
                        il legame con il proprio profilo aziendale o istituzionale
                    </p>
                    <p align="right" class="numPage">1</p>
                </div>
            </div>
        </div>
                            
        <div class="card">
            <div class="cardContainer">
                <h1>UNIVERSITA' DEGLI STUDI DELL'AQUILA</h1>
                <h3>Dipartimento di INGEGNERIA E SCIENZE DELL'INFORMAZIONE E MATEMATICA</h3>
                <p id="head">SEGRETERIA AMMINISTRATIVA PER LA DIDATTICA</p>
                <div class="centro page">
                    <ul>
                        <li>
                            che i tirocini formativi e di orientamento sono ora 
                            disciplinati dall'articolo 18 della legge 24 giugno 
                            1997 n.196, dal suo regolamento di attuazione emanato 
                            con Decreto 25 marzo 1998, n.142 e dalla legge 148 
                            del 14/09/2011;
                        </li>
                        <li>
                            che il Dipartimento di Ingegneria e Scienze dell’Informazione 
                            e Matematica intende attuare progetti diretti al raggiungimento 
                            delle finalità indicate dall'art.18 L. 24 giugno 1997 n.196 e 
                            dall'art.1 del suddetto decreto 25 marzo 1998 n. 142, che 
                            promuovono tirocini formativi e di orientamento presso le aziende;
                        </li>
                        <li>
                            che al fine di agevolare le scelte professionali mediante 
                            la conoscenza diretta del mondo del lavoro e realizzare 
                            momenti di alternanza tra studio e lavoro nell'ambito dei 
                            processi formativi i soggetti richiamati dall'art.18, comma 1, 
                            lett. a) della legge 24 giugno 1997 n.196, tra cui le Università, 
                            possono promuovere tirocini formativi e di orientamento presso 
                            datori di lavori pubblici e privati a beneficio di coloro che 
                            abbiano già assolto l'obbligo scolastico ai sensi della legge 
                            31.12.62 n.1859;
                        </li>
                    </ul>
                    <p style="text-align: center;">Si conviene quanto segue:</p>
                    <p>
                        le premesse costituiscono parte integrante e sostanziale 
                        della presente Convenzione.
                    </p>
                    <p><strong>Art. 1 Oggetto</strong></p>
                    <p>
                        <strong>1.1</strong> L'Ente/l'Azienda si impegna ad accogliere 
                        presso le proprie strutture soggetti in tirocinio di formazione 
                        ed orientamento, ai sensi dell'art. 18 della legge 24 giugno 
                        1997 n. 196 e della legge 148 del 14/09/2011, in numero non 
                        superiore a quanto disposto dall'articolo 1, comma 3, lettera c), 
                        del decreto 142/98. In particolare non possono essere attivati 
                        tirocini presso aziende che non hanno dipendenti.<br>
                        Potranno effettuare periodi di tirocinio (stage), studenti, 
                        neo-laureati e neo-diplomati del Dipartimento di Ingegneria 
                        e Scienze dell’Informazione e Matematica dell'Università degli 
                        Studi di L'Aquila, a condizione che il tirocinio inizi non oltre 
                        i 12 mesi successivi al conseguimento della laurea o del diploma.<br>
                        Potranno effettuare periodi di tirocinio (stage), anche 
                        coloro che frequentano dottorati di ricerca e scuole o 
                        corsi di perfezionamento e specializzazione
                    </p>
                    <p>
                        <strong>1.2</strong> Ai fini dello svolgimento del tirocinio 
                        l’Ente/l'Azienda mette a disposizione del Dipartimento di 
                        Ingegneria e Scienze dell’Informazione e Matematica dell'Università 
                        le proprie strutture. L'accesso alle strutture sarà guidato dal 
                        personale dell’Ente/Azienda ospitante, con compiti di illustrazione 
                        e formazione.
                    </p>
                    <p><strong>Art. 2 Rapporti con i tirocinanti</strong></p>
                    <p>
                        <strong>2.1</strong> Il tirocinio formativo e di orientamento, 
                        ai sensi dell'art. 18, comma 1 lett. d) della legge 196 del 1997 
                        non costituisce rapporto di lavoro e non dà luogo ad alcuna 
                        ipotesi di attività occupazionale. L'Ente/l'Azienda non ha 
                        alcun obbligo di assunzione al termine del periodo di tirocinio.
                    </p>
                    <p align="right" class="numPage">2</p>
                </div>
            </div>
        </div>
                            
        <div class="card">
            <div class="cardContainer">
                <h1>UNIVERSITA' DEGLI STUDI DELL'AQUILA</h1>
                <h3>Dipartimento di INGEGNERIA E SCIENZE DELL'INFORMAZIONE E MATEMATICA</h3>
                <p id="head">SEGRETERIA AMMINISTRATIVA PER LA DIDATTICA</p>
                <div class="centro page">
                    <p>
                        <strong>2.2</strong> Durante lo svolgimento del tirocinio, 
                        l'attività di formazione ed orientamento è seguita e 
                        verificata da un tutore designato dal Dipartimento di 
                        Ingegneria e Scienze dell’Informazione e Matematica dell'Università 
                        in veste di responsabile didattico - organizzativo (il 
                        cui nominativo risulterà dal Progetto formativo e di 
                        orientamento dei singoli stagisti) e da un responsabile 
                        aziendale indicato dall’ Ente/l'Azienda (risultante dal 
                        predetto Progetto)
                    </p>
                    <p>
                        <strong>2.3</strong> Per ciascun tirocinante da inserirsi 
                        nell'Ente/Azienda ospitante verrà predisposto tra le 
                        parti un Progetto formativo e di orientamento, come da 
                        ALLEGATO 1, contenente:
                        <ol type="a">
                            <li>le generalità del tirocinante;</li>
                            <li>i nominativi del tutore e del responsabile aziendale;</li>
                            <li>durata, obiettivi e modalità di svolgimento del tirocinio;</li>
                            <li>le strutture aziendali (sedi ed uffici) presso cui si svolge il tirocinio;</li>
                            <li>gli estremi identificativi delle assicurazioni INAIL e per la responsabilità civile.</li>
                        </ol>
                    </p>
                    <p>
                        <strong>2.4</strong> L'avvio operativo per lo svolgimento 
                        dei singoli tirocini avverrà con scambio di lettera di 
                        conferma tra l'Ente/l'Azienda ospitante ed il tirocinante, 
                        con allegata copia del relativo Progetto di cui al n.2.3 
                        che precede, sottoscritto dall’Ente/l'Azienda, dal Dipartimento 
                        di Ingegneria e Scienze dell’Informazione e Matematica e 
                        dallo stagista per adesione ed accettazione.
                    </p>
                    <p>
                        <strong>2.5</strong> E' consentita, con l'approvazione 
                        del responsabile aziendale, la partecipazione del tirocinante 
                        ad attività aziendali fuori sede. In tal caso le spese di 
                        viaggio e di soggiorno o eventuali altre spese saranno 
                        sostenute dall'Ente/Azienda, secondo le norme e le procedure 
                        interne all'Ente/Azienda stessa.
                    </p>
                    <p><strong>Art. 3 Svolgimento e durata del tirocinio</strong></p>
                    <p>
                        <strong>3.1</strong> Come previsto dalla normativa vigente 
                        la durata massima dei tirocini potrà essere di 6 mesi nel 
                        caso di neolaureati/neodiplomati e di 12 mesi per gli studenti. 
                        Nel caso di iniziative rivolte a persone con disabilità 
                        la durata è estensibile a 18 mesi.<br>
                        La durata viene specificata nel Progetto di cui al n. 2.3 
                        che precede relativo ad ogni tirocinante.<br>
                        La durata stessa potrà essere prorogata, previo accordo 
                        tra le parti, entro i limiti massimi indicati dall'art. 
                        7 del decreto n. 142/98.
                    </p>
                    <p>
                        <strong>3.2</strong> È consentita, per giustificati motivi, 
                        la richiesta da parte del tirocinante di una interruzione 
                        temporanea dello stage, comunque non superiore a n.° 2 
                        settimane consecutive, previa comunicazione all’Ente/Azienda 
                        ospitante, ferma restando la durata complessiva del tirocinio 
                        come prevista nel progetto formativo individuale.
                    </p>
                    <p>
                        <strong>3.3</strong> Durante lo svolgimento del tirocinio 
                        formativo e di orientamento il tirocinante è tenuto a:
                        <ul type="-">
                            <li>
                                svolgere le attività previste dal Progetto formativo 
                                e di orientamento;
                            </li>
                        </ul>
                    </p>
                    <p align="right" class="numPage">3</p>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="cardContainer">
                <h1>UNIVERSITA' DEGLI STUDI DELL'AQUILA</h1>
                <h3>Dipartimento di INGEGNERIA E SCIENZE DELL'INFORMAZIONE E MATEMATICA</h3>
                <p id="head">SEGRETERIA AMMINISTRATIVA PER LA DIDATTICA</p>
                <div class="centro page">
                    <p>
                        <ul type="-">
                            <li>
                                cooperare al conseguimento degli obiettivi che lo 
                                riguardano, osservando gli orari concordati e 
                                rispettando l'ambiente di lavoro e le esigenze 
                                di coordinamento dell'attività di ricerca dell'azienda;
                            </li>
                            <li>
                                rispettare le norme in materia di igiene, sicurezza 
                                e salute sui luoghi di lavoro con particolare riferimento 
                                all’art. 20 del D.Lgs. n. 81/2008 “Obblighi del lavoratore”;
                            </li>
                            <li>
                                mantenere la necessaria riservatezza per quanto 
                                attiene ai dati, informazioni e/o conoscenze in 
                                merito ad attività di ricerca dell’Ente/l'Azienda 
                                (ed ai relativi contenuti e risultati), acquisiti 
                                durante lo svolgimento del tirocinio;
                            </li>
                            <li>
                                inviare al Direttore del Dipartimento di Ingegneria 
                                e Scienze dell’Informazione e Matematica dell'Università 
                                degli Studi dell'Aquila, mensilmente ed entro il giorno 
                                8 del mese successivo a quello cui si riferiscono, 
                                le presenze effettive in tirocinio presso l’Ente/Azienda, 
                                rilevate dalla scheda che sarà consegnata all'atto 
                                della compilazione del Progetto.
                            </li>
                        </ul>
                    </p>
                    <p>
                        <strong>3.4</strong> Qualora si verificassero, da parte 
                        del tirocinante, comportamenti lesivi di diritti o interessi 
                        dell’Ente/l'Azienda essa potrà, previa informazione al tutore 
                        incaricato dal Dipartimento di Ingegneria e Scienze dell’Informazione 
                        e Matematica, sospendere o interrompere lo svolgimento 
                        del tirocinio.
                    </p>
                    <p>
                        <strong>3.5</strong> La realizzazione del tirocinio non 
                        comporta per l’Ente/l'Azienda e per il Dipartimento di 
                        Ingegneria e Scienze dell’Informazione e Matematica 
                        dell'Università degli Studi dell'Aquila alcun onere 
                        finanziario, né obblighi di altra natura salvo quelli 
                        previsti nella presente Convenzione.<br>
                        L’Ente/l'Azienda potrà peraltro erogare eventuali somme 
                        a titolo di rimborso spese (da prevedere nel progetto formativo), 
                        secondo le norme e le procedure interne all’ Ente/l'Azienda stesso, 
                        ovvero eventuali sussidi di formazione e consentire ai 
                        tirocinanti l'utilizzo dei servizi aziendali (in particolare, 
                        servizio mensa), senza che tali erogazioni possano determinare 
                        modifiche alla natura dei rapporti oggetto della presente 
                        Convenzione, o facoltà o diritti ulteriori o diversi da 
                        quelli previsti dalla Convenzione stessa e dalle relative 
                        disposizioni normative. Potranno essere erogati eventuali 
                        premi in denaro nei particolari casi di eccellenza della 
                        ricerca svolta e dei risultati raggiunti.
                    </p>
                    <p>
                        <strong>3.6</strong> L’Azienda/Ente ospitante si impegna 
                        a garantire che il tirocinio si svolga presso strutture 
                        aziendali (stabilimenti, sedi, reparti, uffici ecc.) che 
                        rispettino le vigenti disposizioni normative in tema di 
                        prevenzione incendi, igiene e sicurezza del lavoro, garantendo, 
                        in particolare, che i locali, le attrezzature e le strumentazioni 
                        siano idonee e adeguate ai sensi del D. lgs. 81 del 9 Aprile 2008.<br>
                        L’Azienda/Ente ospitante si impegna inoltre ad assolvere 
                        a tutti gli obblighi indicati dal D. lgs 81/2008 con 
                        particolare riguardo al Titolo I, Capo III, sez. IV “Formazione, 
                        informazione e addestramento”, sezione V “Sorveglianza 
                        sanitaria” per i casi eventualmente previsti (presenza 
                        di rischi specifici), e al Titolo III, Capo II “Uso dei 
                        dispositivi di protezione individuali”.
                    </p>
                    <p align="right" class="numPage">4</p>
                </div>
            </div>
        </div>
                            
        <div class="card">
            <div class="cardContainer">
                <h1>UNIVERSITA' DEGLI STUDI DELL'AQUILA</h1>
                <h3>Dipartimento di INGEGNERIA E SCIENZE DELL'INFORMAZIONE E MATEMATICA</h3>
                <p id="head">SEGRETERIA AMMINISTRATIVA PER LA DIDATTICA</p>
                <div class="centro page">
                    <p><strong>Art. 4 Coperture assicurative</strong></p>
                    <p>
                        <strong>4.1</strong> L'Università degli Studi di L'Aquila 
                        si impegna ad assicurare i tirocinanti contro gli infortuni 
                        sul lavoro presso l'INAIL, nonché per la responsabilità 
                        civile presso compagnie assicurative operanti nel settore 
                        ed indicate nel progetto formativo. L'assicurazione dovrà 
                        coprire anche le attività svolte nell'ambito del tirocinio 
                        fuori sede ai sensi del punto 2.5. Gli estremi identificativi 
                        delle assicurazioni predette saranno indicati nei Progetti.
                    </p>
                    <p>
                        <strong>4.2</strong> In caso di infortunio durante lo 
                        svolgimento del tirocinio, l’Ente/l'Azienda si impegna a 
                        segnalare l'evento, entro i tempi previsti dalla normativa 
                        vigente, agli istituti assicurativi (quali risultanti dal 
                        Progetto formativo e di orientamento e facendo riferimento 
                        al numero della polizza sottoscritta dall'Università degli 
                        Studi di L'Aquila) ed all'Università stessa.
                    </p>
                    <p><strong>Art. 5 Comunicazioni</strong></p>
                    <p>
                        Il Dipartimento di Ingegneria e Scienze dell’Informazione 
                        e Matematica dell'Università degli Studi di L'Aquila si 
                        impegna a far pervenire alla Regione o alla Provincia 
                        delegata, alle strutture provinciali del Ministero del 
                        Lavoro e della Previdenza sociale competenti per territorio 
                        in materia di ispezione copia della Convenzione e di ciascun 
                        Progetto formativo e di orientamento.<br>
                        L’ Ente/l'Azienda per delega che l'Università degli Studi 
                        di L'Aquila le conferisce con la presente, provvederà a 
                        far pervenire alle Rappresentanze Sindacali dei Lavoratori 
                        copia della presente Convenzione e di ciascun Progetto 
                        formativo e di orientamento, ai sensi della normativa vigente.<br>
                        In ottemperanza a quanto previsto dalla legge n.296/2006 
                        (Finanziaria 2007) l’Ente/Azienda ospitante è tenuto ad 
                        effettuare obbligatoriamente la comunicazione dell'avvio 
                        dello stage/tirocinio al centro per l'impiego competente 
                        entro le ore 24 del giorno antecedente, solo ed esclusivamente 
                        per i neolaureati.
                    </p>
                    <p><strong>Art. 6 Risoluzione delle controversie</strong></p>
                    <p>
                        Ogni attività prevista dalla presente Convenzione si 
                        svolgerà nel rispetto dell'Ordinamento generale dello 
                        Stato e delle leggi che regolano l'attività di entrambi gli Enti.<br>
                        Le parti concordano di definire amichevolmente qualsiasi 
                        controversia dovesse insorgere dall'interpretazione o 
                        applicazione del presente Atto.<br>
                        Qualora non fosse possibile raggiungere tale accordo, il 
                        Foro competente a dirimere la controversia sarà quello 
                        di <%=sedeLegale%>.
                    </p>
                    <p><strong>Art. 7 Trattamento dati</strong></p>
                    <p>
                        Le parti dichiarano di essersi reciprocamente informate, 
                        di acconsentire che i dati personali raccolti per la 
                        formalizzazione del presente atto siano oggetto di trattamento 
                        per gli adempimenti di legge ai sensi del d. lgs. 196/03 
                        e di essere a conoscenza di quanto previsto dall’art.13 
                        dello stesso decreto.
                    </p>
                    <p align="right" class="numPage">5</p>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="cardContainer">
                <h1>UNIVERSITA' DEGLI STUDI DELL'AQUILA</h1>
                <h3>Dipartimento di INGEGNERIA E SCIENZE DELL'INFORMAZIONE E MATEMATICA</h3>
                <p id="head">SEGRETERIA AMMINISTRATIVA PER LA DIDATTICA</p>
                <div class="centro page">
                    <p><strong>Art. 8 Richiami</strong></p>
                    <p>
                        Per tutto quanto non previsto dalla presente Convenzione 
                        le parti fanno riferimento alla legislazione vigente in 
                        materia.
                    </p>
                    <p><strong>Art. 9 Decorrenza della presente Convenzione</strong></p>
                    <p>
                        La presente Convenzione decorre dalla data in calce, ha 
                        durata di .................... e si intenderà rinnovata 
                        tacitamente, a meno di disdetta da comunicarsi entro i 
                        tre mesi precedenti alla data di scadenza.
                    </p>
                    <p><strong>Art. 10 Referenti per la Convenzione</strong></p>
                    <p>
                        Referenti per la presente Convenzione e per i rapporti 
                        fra gli Enti Contraenti nell'ambito della Convenzione 
                        stessa sono:<br>
                    </p>
                    <p>
                        per Il Dipartimento di Ingegneria e Scienze dell’Informazione 
                        e Matematica dell’Università degli Studi L'Aquila:<br>
                    </p>
                    <p>___________________________________________</p>
                    <p>per l’Ente/l'Azienda:</p>
                    <p>
                        <strong><%=rappresentante%></strong><br>
                        ___________________________________________
                    </p>
                    <p><strong>Art. 11 Registrazione e spese</strong></p>
                    <p>
                        La presente Convenzione sarà registrata a tassa fissa, 
                        in caso d'uso, ai sensi degli artt. 5 e 39 del D.P.R. 
                        131 del 26.4.86.
                    </p>
                    <p>L'Aquila, lì _________________________</p>
                    <p>
                        <table style="width: 100%;" class="end">
                            <tr>
                                <td style="width: 50%; text-align: center;">
                                    Il Direttore<br>
                                    (Prof. Guido Proietti)<br>
                                    ________________________
                                </td>
                                <td style="text-align: center;">
                                    Il Rappresentante <br>
                                    Legale dell’Azienda<br>
                                    <a id="firma"><%=legaleRappresentante%></a>
                                </td>
                            </tr>
                        </table>
                    </p>
                    <p align="right" class="numPage">6</p>
                </div>
            </div>
        </div>
        <input type="hidden" name="ragioneSociale" value="<%=ragioneSociale%>"/>
        <input type="hidden" name="sedeLegale" value="<%=sedeLegale%>"/>
        <input type="hidden" name="partitaIva" value="<%=partitaIva%>"/>
        <input type="hidden" name="rappresentante" value="<%=rappresentante%>"/>
        <input type="hidden" name="legaleRappresentante" value="<%=legaleRappresentante%>"/>
        <input type="hidden" name="descrizione" value="<%=descrizione%>"/>
        <input type="hidden" name="ambito" value="<%=ambito%>"/>
        <div class="container-login100-form-btn m-t-17">
            <button type="submit" name="stampa" value="convenzione" class="login100-form-btn">Salva documento di convenzione</button>
        </div>
        </form>
        
                            
        <p><%=info%></p>
    </body>
</html>
