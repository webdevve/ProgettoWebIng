<%-- 
    Document   : progettoFormativoAz
    Created on : 5-dic-2019, 15.14.24
    Author     : Davide Simboli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Internetship Tutor</title>
        <link rel="stylesheet" href="css/header.css" type="text/css"/>
        <link rel="stylesheet" href="css/index.css" type="text/css"/>
        <link rel="stylesheet" href="css/azienda.css" type="text/css"/>
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
         String ragione_soc = (String)request.getAttribute("ragione_soc");
         String partita_iva = (String)request.getAttribute("partita_iva");
         String nome_studente = (String)request.getAttribute("nome_studente");
         String cognome_studente = (String)request.getAttribute("cognome_studente");
         String condizione = (String)request.getAttribute("condizione");
         String data_inizio = (String)request.getAttribute("data_inizio");
         String data_fine = (String)request.getAttribute("data_fine");
         String durata = (String)request.getAttribute("durata");
         String luogo = (String)request.getAttribute("luogo");
         String obiettivi = (String)request.getAttribute("obiettivi");
         String responsabile = (String)request.getAttribute("responsabile");
         String id_studente = (String)request.getAttribute("id_studente");
         String id_azienda = (String)request.getAttribute("id_azienda");
         String titolo = (String)request.getAttribute("titolo");
        %>
        <div class="header">
            <a href="#default" class="logo">InternshipTutor</a>
            <div class="header-right">
              <a class="active" href="azienda.jsp">Home</a>
              <a href="documentiAz.jsp">Documenti</a>
              <a href="tirocini.jsp">Tirocini</a>
              <a href="leMieOfferte.jsp">Le Mie Offerte</a>
              <a href="offerteChiuse.jsp">Offerte Chiuse</a>
              <a href="javascript:{}" onclick="document.getElementById('my_form').submit(); return false;">Logout</a>
            </div>
        </div>
        <form action="logout" method="post" id="my_form"></form>
        <%if(str!=null){%>
        <div class="centra"><img src="icon/user.ico"/><%=str%></div>
        <%}%>
        <font color="red" id="err">
            <p><%=errore%></p>
          </font>
        <font color="green">
            <p><%=notifica%></p>
        </font>
        
        <h1>Documento Progetto Formativo e di Orientamento</h1>
        <form action="terminaTirocinio" method="post">
            <input type="hidden" name="id_candidatura" value="<%=id_candidatura%>"/>
            <input type="hidden" name="ragione_soc" value="<%=ragione_soc%>"/>
            <input type="hidden" name="partita_iva" value="<%=partita_iva%>"/>
            <input type="hidden" name="nome_studente" value="<%=nome_studente%>"/>
            <input type="hidden" name="cognome_studente" value="<%=cognome_studente%>"/>
            <input type="hidden" name="condizione" value="<%=condizione%>"/>
            <input type="hidden" name="data_inizio" value="<%=data_inizio%>"/>
            <input type="hidden" name="data_fine" value="<%=data_fine%>"/>
            <input type="hidden" name="durata" value="<%=durata%>"/>
            <input type="hidden" name="luogo" value="<%=luogo%>"/>
            <input type="hidden" name="obiettivi" value="<%=obiettivi%>"/>
            <input type="hidden" name="responsabile" value="<%=responsabile%>"/>
            <input type="hidden" name="id_studente" value="<%=id_studente%>"/>
            <input type="hidden" name="id_azienda" value="<%=id_azienda%>"/>
            <input type="hidden" name="titolo" value="<%=titolo%>"/>
            <div class="card">
                <div class="cardContainer">
                    <h1>UNIVERSITA' DEGLI STUDI DELL'AQUILA</h1>
                    <h3>Dipartimento di INGEGNERIA E SCIENZE DELL'INFORMAZIONE E MATEMATICA</h3>
                    <p id="head">SEGRETERIA AMMINISTRATIVA PER LA DIDATTICA</p>
                    
                    <div class="centro page">
                    <h2>(da compilare a cura dell’Azienda)</h2>
                    
                    <p>
                        Ente/Azienda <strong><%=ragione_soc%></strong>,<br> 
                        Codice Fiscale Ente/Azienda <strong><%=partita_iva%></strong>
                    </p>
                    <p>
                        Tirocinante:<br/>
                        Cognome <strong><%=cognome_studente%></strong> Nome <strong><%=nome_studente%></strong>
                    </p> 
                    <p>
                        (Codice identificativo tirocinio: Dipartimento, Corso di Laurea o diploma, 
                        anno, n progressivo, altro)<br/>
                        <strong><%=condizione%></strong>
                    </p> 
                    <p>
                        Periodo del tirocinio:<br/>
                        dal <strong><%=data_inizio%></strong> al <strong><%=data_fine%></strong>
                    </p>
                    <p>
                        Per un totale di <strong><%=durata%></strong>
                    </p>
                    <p>Sede di svolgimento del tirocinio <strong><%=luogo%></strong></p>
                    <p>
                        Descrizione attività svolta <br/>
                        <textarea name="descrizione" required></textarea>
                    </p>
                    <p>
                        Si attesta che il/la Sig <strong><%=nome_studente%> <%=cognome_studente%></strong>
                    </p>
                    <p>
                        Ha effettuato i compiti affidatigli conseguendo il seguente risultato:<br/>
                        <strong><%=obiettivi%></strong>
                    </p>
                    <p>
                        Data <input type="date" name="data" placeholder="aaaa-MM-dd" min="2019-11-07" class="border-none" required/>
                    </p>
                    <p>
                        Il Tutor aziendale <br/>
                        <a id="firma"><%=responsabile%></a>
                    </p>
                </div>
                </div>
            </div>
            <div class="container-login100-form-btn m-t-17">
                <button type="submit" name="stato" value="termina" class="login100-form-btn">Accetta e termina tirocinio</button>
            </div>
        </form>
    </body>
</html>
