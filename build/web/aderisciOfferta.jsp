<%-- 
    Document   : aderisciOfferta
    Created on : 7-nov-2019, 10.31.42
    Author     : Davide Simboli
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<?xml version="1.0" encoding="UTF-8"?>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <html xmlns="http://www.w3.org/1999/xhtml">

        <head>
            <title>Internship Tutor</title>
            <link rel="stylesheet" href="css/header.css" type="text/css" />
            <link rel="stylesheet" href="css/index.css" type="text/css" />
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
         String errore = (String)request.getAttribute("err");
        if(errore == null){
          errore="";
        }
        String notifica = (String)request.getAttribute("notify");
         if(notifica == null){
           notifica="";
         }
         int id = (int)request.getAttribute("id");
         String nomeCognome = (String) request.getAttribute("nomeCognome");
         String luogoNascita = (String) request.getAttribute("luogoNascita");
         String provNascita = (String) request.getAttribute("provNascita");
         String dataNascita = (String) request.getAttribute("dataNascita");
         String residenza = (String) request.getAttribute("residenza");
         String cf = (String) request.getAttribute("cf");
         String telefonoStudente = (String) request.getAttribute("telefonoStudente");
         String nomeStudente = (String) request.getAttribute("nomeStudente");
         String emailStudente = (String) request.getAttribute("emailStudente");
         Connection connect = null;
            Statement Statement = null;
            ResultSet resultSet = null;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/internshiptutor",
                                            "root", "ciao");
                System.out.println("Connessione Stabilita!");
                Statement = connect.createStatement();
                resultSet = Statement.executeQuery("SELECT * FROM internshiptutor.offerta_azienda where id = "+id);
                while(resultSet.next()){
                    String titolo = resultSet.getString("titolo");
                    String ragioneSociale = resultSet.getString("ragione_sociale");
                    String ambito = resultSet.getString("ambito");
                    String Luogo = resultSet.getString("luogo");
                    String orari = resultSet.getString("orari");
                    String ore = resultSet.getString("durata");
                    String obiettivi = resultSet.getString("obiettivi");
                    String modalita = resultSet.getString("modalita");
                    String rimborsi = resultSet.getString("rimborsi");
                    String email_responsabile = resultSet.getString("email_responsabile");
                    String telefonoTutoreAz = resultSet.getString("telefono_responsabile");
                    String cognome_responsabile = resultSet.getString("cognome_responsabile");
                    String nome_responsabile = resultSet.getString("nome_responsabile");
                    String tutoreAziendale = nome_responsabile+" "+cognome_responsabile;
         %>
        <div class="header">
    <a href="#default" class="logo">InternshipTutor</a>
    <div class="header-right">
        <a href="index.jsp">Home</a>
        <a href="#news">News</a>
        <a href="visualizzaAziende.jsp">Aziende</a>
        <a href="#profilo.jsp">
            <%=str%>
        </a>
    </div>
</div>
<font color="red" id="err">
            <p><%=errore%></p>
          </font>
<font color="green">
            <p><%=notifica%></p>
          </font>
<h1>Documento Progetto Formativo e di Orientamento</h1>

<form action="proceduraConvenzioneUno" method="post">
    <input type="hidden" name="emailStudente" value="<%=emailStudente%>"/>
    <input type="hidden" name="idOfferta" value="<%=id%>"/>
    <input type="hidden" name="ragioneSociale" value="<%=ragioneSociale%>"/>
    <input type="hidden" name="nomeStudente" value="<%=nomeCognome%>"/>
    <input type="hidden" name="titoloOfferta" value="<%=titolo%>"/>
    <input type="hidden" name="luogoNascita" value="<%=luogoNascita%>"/>
    <input type="hidden" name="dataNascita" value="<%=dataNascita%>"/>
    <input type="hidden" name="residenza" value="<%=residenza%>"/>
    <input type="hidden" name="telefonoStudente" value="<%=telefonoStudente%>"/>
    <input type="hidden" name="cf" value="<%=cf%>"/>
    <input type="hidden" name="luogoTirocinio" value="<%=Luogo%>"/>
    <input type="hidden" name="ambito" value="<%=ambito%>"/>
    <input type="hidden" name="orari" value="<%=orari%>"/>
    <input type="hidden" name="ore" value="<%=ore%>"/>
    <input type="hidden" name="tutoreAziendale" value="<%=tutoreAziendale%>"/>
    <input type="hidden" name="telefonoTutoreAz" value="<%=telefonoTutoreAz%>"/>
    <input type="hidden" name="email_responsabile" value="<%=email_responsabile%>"/>
    <input type="hidden" name="obiettivi" value="<%=obiettivi%>"/>
    <input type="hidden" name="modalita" value="<%=modalita%>"/>
    <input type="hidden" name="rimborsi" value="<%=rimborsi%>"/>
    
    <div class="card">
        <div class="cardContainer">
            <h1>UNIVERSITA' DEGLI STUDI DELL'AQUILA</h1>
            <h3>Dipartimento di INGEGNERIA E SCIENZE DELL'INFORMAZIONE E MATEMATICA</h3>
            <p id="head">SEGRETERIA AMMINISTRATIVA PER LA DIDATTICA</p>
            <div class="centro">
                <table style="width: 100%;" class="start">
                    <tr>
                        <td style="width: 50%;">
                            parte riservata
                            <br> all'universita'
                        </td>
                        <td>
                            data di ricevimento:__________________________
                            <br> prot. n.
                        </td>
                    </tr>
                </table>
            </div>
            <div class="centro page">
                <h2>ALLEGATO 1</h2>
                <p style="font-weight: bold; font-size">
                    alla Convenzione per lo svolgimento di attività di tirocinio e di orientamento (ai sensi dell'art. 18 L.196/97 e dell'Art. 1 Decreto Ministero del Lavoro e Previdenza Sociale N. 142/98 e della Legge 148 del 14/09/2011) per studenti, laureati e diplomati del Dipartimento di Ingegneria, Scienze dell’Informazione e Matematica dell’Università degli Studi dell'Aquila.
                </p>
                <h2>PROGETTO FORMATIVO E DI ORIENTAMENTO</h2>
                <p>
                    Nominativo del tirocinante <strong><%=nomeCognome%></strong>,
                    <br> Nato a <strong><%=luogoNascita%> </strong> Prov. <strong><%=provNascita%></strong> il <strong><%=dataNascita%></strong>,
                    <br> Residente in <strong><%=residenza%></strong>,
                    <br> Codice fiscale <strong><%=cf%></strong>,
                    <br> Telefono <strong><%=telefonoStudente%></strong>
                </p>
                <p style="text-align: center;">
                    Attuale condizione (barrare la casella – possibilità di doppia scelta):
                </p>
                <ul>
                    <li class="none">
                        <input type="checkbox" name="condizione" value="laureando" /> Studente Corso di Laurea in:
                        <input type="text" name="laureando" class="border-none"/>
                    </li>
                    <li class="none">
                        <input type="checkbox" name="condizione" value="diplomato" /> Diplomato. Diploma universitario in:
                        <input type="text" name="diplomato" class="border-none"/>
                        <br> (entro 12 mesi dal diploma)
                    </li>
                    <li class="none">
                        <input type="checkbox" name="condizione" value="laureato" /> Laureato. Laurea in:
                        <input type="text" name="laureato" class="border-none"/>
                        <br> (entro 12 mesi dalla laurea)
                    </li>
                    <li class="none">
                        <input type="checkbox" name="condizione" value="dottorato" /> Dottorato di ricerca in:
                        <input type="text" name="dottorato" class="border-none"/>
                    </li>
                    <li class="none">
                        <input type="checkbox" name="condizione" value="scuola" /> Scuola o corso di perfezionamento o specializzazione in:
                        <input type="text" name="scuola" class="border-none"/>
                    </li>
                </ul>
                <p>Barrare se trattasi di soggetto portatore di handicap:</p>
                <ul>
                    <li class="none">
                        <input type="radio" name="handicap" value="si" /> Si
                    </li>
                    <li class="none">
                        <input type="radio" name="handicap" value="no" /> No
                    </li>
                </ul>
                <p>Ente/Azienda ospitante <strong><%=ragioneSociale%></strong></p>
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
                <p>Luogo di effettuazione del tirocinio <strong><%=Luogo%></strong></p>
                <p>Settore di inserimento <strong><%=ambito%></strong></p>
                <p>Tempi di accesso ai locali aziendali <strong><%=orari%></strong></p>
                <p>
                    Periodo di tirocinio n.
                    <input type="number" name="mesi" class="border-none"/> mesi dal
                    <input type="date" name="startDate" min="2019-11-07" class="border-none" required placeholder="AAAA-MM-dd"/> al
                    <input type="date" name="endDate" min="2019-11-07" class="border-none" required placeholder="AAAA-MM-dd"/>
                    <br> (con possibilità di proroga entro i limiti massimi previsti dalla normativa vigente)
                </p>
                <p>
                    numero ore di tirocinio <strong><%=ore%></strong>
                    per il conseguimento di n.
                    <input type="number" name="cfu" min="0" max="999" class="border-none" required/> CFU
                </p>
                <br>
                <p>Tutore universitario
                    <input type="text" name="tutoreUniversitario" required class="border-none"/>
                </p>
                <p>Telefono
                    <input type="text" name="telefonoTutoreUni" required class="border-none"/>
                </p>
                    <p>Email <input type="email" name="emailTutoreUni" required class="border-none"/></p>
                <p>Tutore aziendale
                    <strong><%=tutoreAziendale%></strong>
                </p>
                <p>Telefono
                    <strong><%=telefonoTutoreAz%></strong>
                </p>
                <p>Email <strong><%=email_responsabile%></strong></p>
                <input type="hidden" name="emailAz" value="<%=email_responsabile%>"/>
                <p>
                    <strong>Polizze assicurative:<br>
                    Copertura assicurativa per rischio responsabilità civile terzi:</strong>
                    <br> Compagnia assicurativa: QBE Insurance Assicurazioni
                    <br> Polizza n. 060.0000176
                    <br> Scadenza 31/12/2020
                    <br>
                    <strong>Copertura assicurativa per rischio infortuni cumulativa:</strong>
                    <br> Compagnia assicurativa: Compagnia di Assicurazioni Generali Spa
                    <br> Polizza n. 380147665
                    <br> Scadenza 31/12/2020
                    <br>
                </p>
                <p>
                    <strong>Posizione INAIL:</strong>
                    <br> Copertura assicurativa “in conto Stato” ex art. 2 D.P.R. N. 156 del 9.04.1999
                </p>
                <p><strong>Obiettivi del tirocinio:</strong> <%=obiettivi%></p>
                
                <p><strong>Modalità:</strong> <%=modalita%></p>
                
                <p><strong>Facilitazioni previste: sussidio di formazione e servizi aziendali (mensa)</strong> <%=rimborsi%></p>
                
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
                <p><strong>Obblighi del tirocinante:</strong></p>
                <ul>
                    <li>
                        <u>Aver seguito il corso online di formazione generale per la
                  sicurezza sui luoghi di lavoro</u> disponibile alla pagina web di Ateneo https://moodle.univaq.it/course/view.php?id=300, per il quale si allega la relativa certificazione;
                    </li>
                    <li>
                        Seguire le indicazioni dei tutori e fare riferimento ad essi su qualsiasi esigenza di tipo organizzativo ed altre evenienze;
                    </li>
                    <li>
                        Rispettare gli obblighi di riservatezza per quanto attiene ai dati, informazioni e conoscenze in merito all'attività di ricerca dell'Ente/Azienda, acquisiti durante e dopo lo svolgimento del tirocinio;
                    </li>
                    <li>
                        Rispettare i regolamenti aziendali e le norme in materia di igiene e sicurezza;
                    </li>
                    <li>
                        Inviare al Dipartimento di Ingegneria, Scienze dell’Informazione e Matematica dell'Università degli Studi dell'Aquila, mensilmente, le presenze effettive presso l'Azienda rilevate da una scheda che viene consegnata dall’Azienda stessa all'atto della compilazione del presente Progetto.
                    </li>
                </ul>

                <p>
                    Ai sensi degli artt. 10 e seguenti della legge 675/ 96, sulla tutela delle persone e di altri soggetti rispetto al trattamento dei dati personali, con la sottoscrizione il tirocinante esprime il suo consenso a che i suoi dati personali vengano comunicati all'Università limitatamente ai trattamenti connessi alle finalità del presente rapporto di tirocinio. La sottoscrizione del presente modello comporta anche il consenso del tirocinante al trattamento dei suoi dati personali nel senso sopraindicato.
                </p>
                <p>L'Aquila,
                    <input type="date" name="today" min="2019-11-07" class="border-none"/>
                </p>
                <p>Firma per visione e accettazione del tirocinante</p>
                <p id="firma"><u><%=nomeCognome%></u></p>
                <p>
                    Dipartimento di Ingegneria, Scienze dell’Informazione e Matematica dell’Università degli Studi di L'Aquila<br>
                    Il Tutor
                </p>
                <p>_________________________________</p>
                <p>L'Ente/Azienda<sup>1</sup></p>
                <p>_________________________________</p>
                <p>Il Tutor aziendale</p>
                <p>_________________________________</p>
                <p>
                    Il Direttore del Dipartimento di Ingegneria e Scienze dell’Informazione e Matematica.
                    <br> Prof. Guido Proietti
                </p>
                <p>_________________________________</p>
                <p style="font-size: 12px;">
                    ____________________________
                    <br>
                    <sup>1</sup>Timbro e firma dell’Azienda
                </p>
                <p align="right" class="numPage">3</p>
            </div>
        </div>
    </div>
    <div class="container-login100-form-btn m-t-17">
        <button type="submit" name="conferma" value="richiesta" class="login100-form-btn">Conferma e invia la richiesta</button>
    </div>
    <div class="card">
        <p>
            ATTENZIONE: confermando quanto sopra descritto invierai la richiesta di 
            effettuazione del tirocinio. Riceverai una Email quando l'azienda accetterà
            la tua richiesta.
        </p>
    </div>
    
</form>       <%
                connect.close();
                    Statement.close();
                    resultSet.close();
                }
            }catch(SQLException e){
                System.out.println("ERRORE DATABASE! " + e.getMessage());
            }catch(Exception e){
                System.out.println("ERRORE GENERICO! " + e.getMessage());
            }finally{
                try{
                    if (connect != null)
                        connect.close();
                    if (Statement != null)
                        Statement.close();
                    if (resultSet != null)
                        resultSet.close();
                } catch(final SQLException e){
                    System.out.println("final - ERRORE DATABASE! " + e.getMessage());
                }
            }
%>
        </body>

        </html>
