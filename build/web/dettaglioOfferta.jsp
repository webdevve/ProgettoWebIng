<%-- 
    Document   : dettaglioOfferta
    Created on : 30-ott-2019, 19.24.59
    Author     : Davide Simboli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Internship Tutor</title>
        <link rel="stylesheet" href="css/header.css" type="text/css"/>
        <link rel="stylesheet" href="css/index.css" type="text/css"/>
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
        %>
    <div class="header">
        <a href="#default" class="logo">InternshipTutor</a>
        <div class="header-right">
          <a href="index.jsp">Home</a>
          <a href="#news">News</a>
          <a href="visualizzaAziende.jsp" >Aziende</a>
          <a href="<%=linkAccedi%>"><%=login%></a>
        </div>
    </div>
        <%
            String ragioneSociale = (String)request.getAttribute("ragioneSociale");
            String indirizzo = (String)request.getAttribute("indirizzo");
            String titoloOfferta = (String)request.getAttribute("titoloOfferta");
            String Luogo = (String)request.getAttribute("luogo");
            String orari = (String)request.getAttribute("orari");
            String ore = (String)request.getAttribute("ore");
            String obiettivi = (String)request.getAttribute("obiettivi");
            String modalita = (String)request.getAttribute("modalita");
            String rimborsi = (String)request.getAttribute("rimborsi");
            String descrizione = (String)request.getAttribute("descrizione");
            if(ragioneSociale == null){
              ragioneSociale="";
            }
        %>
        <p><%=ragioneSociale%></p>
        <p><%=indirizzo%></p>
        <p><%=titoloOfferta%></p>
        <p><%=Luogo%></p>
        <p><%=orari%></p>
        <p><%=ore%></p>
        <p><%=obiettivi%></p>
        <p><%=modalita%></p>
        <p><%=rimborsi%></p>
        <p><%=descrizione%></p>
    </body>
</html>
