<%-- 
    Document   : visualizzaAziende
    Created on : 27-lug-2019, 11.31.45
    Author     : alesi
--%>

<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <title>Aziende</title>
    <link rel="stylesheet" href="css/index.css" type="text/css"/>
    <link rel="stylesheet" href="css/header.css" type="text/css"/>
  </head>
    <body onload="document.autenticazione.submit()">
     <%
            String nome = (String)request.getAttribute("name");
            if(nome == null){
                nome = "";
            }
    %> 
    <form action="visualizzaAziende" name="autenticazione" method="POST"></form>
    <header id="header">
      <nav id="navbar">
        <ul class="nav_header">
          <li class="li_header">
            <a href="index.jsp">Home</a>
          </li>
          <li>
            <a href="#news">News</a>
          </li>
          <li>
            <a href="visualizzaAziende.jsp">Aziende</a>
          </li>
          <li>
            <a href="login.jsp">Accedi</a>
          </li>
            <li><a href="#profilo"><%=nome%></a></li>
        </ul>
      </nav>
    </header>

    <div class="container">
      <ul class="post">
        <%
            for(int i = 0; i < 12; i++){
        %>
        <li class="item">
            <div class="content">
                <form action="visualizzaOfferte.jsp" method="POST">
                    <section>
                        <h2>Nome Azienda s.r.l.</h2>
                    </section>
                    <button type="submit" name="moreInformation" class="button button4" value="">Visualizza offerte</button>
                </form>
            </div>
        </li>
        <%
            }
        %>
      </ul>
    </div>
      Risposta: 
  </body>
</html>
