<%-- 
    Document   : docTirocinio
    Created on : 3-dic-2019, 10.49.53
    Author     : Davide Simboli
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Internetship Tutor</title>
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
         String errore = (String)request.getAttribute("err");
        if(errore == null){
          errore="";
        }
        String notifica = (String)request.getAttribute("notify");
         if(notifica == null){
           notifica="";
         }
        String id_candidatura = (String)request.getAttribute("id_candidatura");
        String id_offerta = (String)request.getAttribute("id_offerta");
         %>
      <div class="header">
         <a href="#default" class="logo">InternshipTutor</a>
         <div class="header-right">
            <a href="admin.jsp">Home</a>
            <a href="confermaConvenzione.jsp">Convenzioni da Confermare</a>
            <a href="aziendeConvenzionate.jsp" >Convenzioni</a>
            <a href="#profilo.jsp"><%=str%></a>
         </div>
      </div>
         <%
             Connection connect = null;
             Statement Statement = null;
             ResultSet resultSet = null;
             try{
                Class.forName("com.mysql.jdbc.Driver");
                connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/internshiptutor",
                     "root", "ciao");
                System.out.println("Connessione Stabilita!");
                Statement = connect.createStatement();
                resultSet = Statement.executeQuery("SELECT * FROM internshiptutor.documento_formativo where id = '"+id_candidatura+"'");
                while(resultSet.next()){
                    int id_studente = resultSet.getInt("id_studente");
                    int id_azienda = resultSet.getInt("id_azienda");
                    String nome = resultSet.getString("nome");
                    String cognome = resultSet.getString("cognome");
                    String nomeCognome = nome +" "+cognome;
                    String luogoNascita = resultSet.getString("luogo_nascita");
                    String dataNascita = resultSet.getString("data_nascita");
                    String residenza = resultSet.getString("residenza");
                    String cf = resultSet.getString("cf");
                    String telefonoStudente = resultSet.getString("telefono");
                    String condizione = resultSet.getString("condizione");
                    String handicap = resultSet.getString("handicap");
                    String ragioneSociale = resultSet.getString("ragione_sociale");
                    String Luogo = resultSet.getString("luogo");
                    String ambito = resultSet.getString("ambito");
                    String orari = resultSet.getString("orari");
                    String ore = resultSet.getString("durata");
                    String cfu = resultSet.getString("cfu");
                    String nomeResp = resultSet.getString("nome_responsabile");
                    String cognResp = resultSet.getString("cognome_responsabile");
                    String tutoreAziendale = nomeResp+" "+ cognResp;
                    String telefonoTutoreAz = resultSet.getString("telefono_responsabile");
                    String email_responsabile = resultSet.getString("email_responsabile");
                    String obiettivi = resultSet.getString("obiettivi");
                    String modalita = resultSet.getString("modalita");
                    String rimborsi = resultSet.getString("rimborsi");
                    String tutoreUniversitario = resultSet.getString("tutoreUniversitario");
                    String emailTutoreUni = resultSet.getString("emailTutoreUni");
                    String telefonoTutoreUni = resultSet.getString("telefonoTutoreUni");
                    String titolo = resultSet.getString("titolo");
                %> 
                
         
      <h1>Documento Progetto Formativo e di Orientamento</h1>

<form action="accettaProposta" method="post">
    <input type="hidden" name="id_offerta" value="<%=id_offerta%>"/>
    <input type="hidden" name="id_azienda" value="<%=id_azienda%>"/>
    <input type="hidden" name="id_studente" value="<%=id_studente%>"/>
    <input type="hidden" name="id_candidatura" value="<%=id_candidatura%>"/>
    <input type="hidden" name="nomeCognome" value="<%=nomeCognome%>"/>
    <input type="hidden" name="luogoNascita" value="<%=luogoNascita%>"/>
    <input type="hidden" name="dataNascita" value="<%=dataNascita%>"/>
    <input type="hidden" name="residenza" value="<%=residenza%>"/>
    <input type="hidden" name="cf" value="<%=cf%>"/>
    <input type="hidden" name="telefonoStudente" value="<%=telefonoStudente%>"/>
    <input type="hidden" name="condizione" value="<%=condizione%>"/>
    <input type="hidden" name="handicap" value="<%=handicap%>"/>
    <input type="hidden" name="ragioneSociale" value="<%=ragioneSociale%>"/>
    <input type="hidden" name="Luogo" value="<%=Luogo%>"/>
    <input type="hidden" name="ambito" value="<%=ambito%>"/>
    <input type="hidden" name="orari" value="<%=orari%>"/>
    <input type="hidden" name="ore" value="<%=ore%>"/>
    <input type="hidden" name="cfu" value="<%=cfu%>"/>
    <input type="hidden" name="tutoreAziendale" value="<%=tutoreAziendale%>"/>
    <input type="hidden" name="telefonoTutoreAz" value="<%=telefonoTutoreAz%>"/>
    <input type="hidden" name="email_responsabile" value="<%=email_responsabile%>"/>
    <input type="hidden" name="obiettivi" value="<%=obiettivi%>"/>
    <input type="hidden" name="modalita" value="<%=modalita%>"/>
    <input type="hidden" name="rimborsi" value="<%=rimborsi%>"/>
    <input type="hidden" name="tutoreUniversitario" value="<%=tutoreUniversitario%>"/>
    <input type="hidden" name="emailTutoreUni" value="<%=emailTutoreUni%>"/>
    <input type="hidden" name="telefonoTutoreUni" value="<%=telefonoTutoreUni%>"/>
    <input type="hidden" name="titolo" value="<%=titolo%>"/>
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
                    <br> Nato a <strong><%=luogoNascita%> </strong> Prov. <strong>null</strong> il <strong><%=dataNascita%></strong>,
                    <br> Residente in <strong><%=residenza%></strong>,
                    <br> Codice fiscale <strong><%=cf%></strong>,
                    <br> Telefono <strong><%=telefonoStudente%></strong>
                </p>
                <p style="text-align: center;">
                    Attuale condizione: <%=condizione%>
                </p>
                
                <p>Soggetto portatore di handicap: <%=handicap%></p>
                
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
                    <input type="date" name="startDate" min="2019-11-07" class="border-none" placeholder="aaaa-MM-dd"/> al
                    <input type="date" name="endDate" min="2019-11-07" class="border-none" placeholder="aaaa-MM-dd"/>
                    <br> (con possibilità di proroga entro i limiti massimi previsti dalla normativa vigente)
                </p>
                <p>
                    numero ore di tirocinio <strong><%=ore%></strong>
                    per il conseguimento di n. <%=cfu%> CFU
                </p>
                <br>
                    <p>Tutore universitario <strong><%=tutoreUniversitario%></strong>
                </p>
                <p>Telefono <strong><%=telefonoTutoreUni%></strong>
                </p>
                <p>Email <strong><%=emailTutoreUni%></strong></p>
                <p>Tutore aziendale
                    <strong><%=tutoreAziendale%></strong>
                </p>
                <p>Telefono
                    <strong><%=telefonoTutoreAz%></strong>
                </p>
                <p>Email <strong><%=email_responsabile%></strong></p>
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
    <%
                }
                connect.close();
                Statement.close();
                resultSet.close();
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
                }catch(final SQLException e){
                    System.out.println("final - ERRORE DATABASE! " + e.getMessage());
                }
             }
         %>
    <div class="container-login100-form-btn m-t-17">
        <button type="submit" name="stato" value="proposta" class="login100-form-btn">Accetta proposta di tirocinio</button>
    </div>
</form>
    </body>
</html>
