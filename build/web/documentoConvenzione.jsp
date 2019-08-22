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
    </head>
    <body>
        <%
            HttpSession sessione = request.getSession();
            String str = (String)sessione.getAttribute("username");
            request.setAttribute("name", str);
            String nome = (String)request.getAttribute("name");
            String login = "";
            String linkAccedi = "";
            if(nome == null){
                //nome = "";
                login = "Accedi";
                linkAccedi = "login.jsp";
            }else{
                login = nome;
                linkAccedi = "#profilo";
            }
            
            String info = (String)request.getAttribute("getInfo");
            String ragioneSociale = (String)request.getAttribute("getRagioneSociale");
            String sedeLegale = (String)request.getAttribute("getSedeLegale");
            String partitaIva = (String)request.getAttribute("getPartitaIva");
            String rappresentante = (String) request.getAttribute("getRappresentante");
            String descrizione = (String) request.getAttribute("getDescrizione");
            String ambito = (String) request.getAttribute("getAmbito");
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
        %>
        <div class="header">
            <a href="#default" class="logo">InternshipTutor</a>
            <div class="header-right">
              <a class="active" href="#home">Home</a>
              <a href="#news">News</a>
              <a href="visualizzaAziende.jsp" >Aziende</a>
              <a href="#profilo"><%=login%></a>
            </div>
        </div>
        <h1>Documento di Convenzione</h1>
        
        <div class="card">
            <div class="cardContainer">
                <h1>UNIVERSITA' DEGLI STUDI DELL'AQUILA</h1>
                <h3>Dipartimento di INGEGNERIA E SCIENZE DELL'INFORMAZIONE E MATEMATICA</h3>
                <p id="head">SEGRETERIA AMMINISTRATIVA PER LA DIDATTICA</p>
                    <div class="centro">
                        <table style="width: 100%;">
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
                        <sup>1</sup>L’Ente/Azienda deve inserire una breve descrizione di alto livello dei 
                        progetti formativi di interesse, enfatizzandone il legame con il proprio profilo 
                        aziendale o istituzionale
                    </p>
                    <p align="right" class="numPage">1</p>
                </div>
            </div>
        </div>
                <p><%=info%></p>
    </body>
</html>
