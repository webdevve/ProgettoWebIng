<%-- 
    Document   : registrazione
    Created on : 11-lug-2019, 22.45.52
    Author     : Davide Simboli
--%>

<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Registrazione</title>
    <link rel="stylesheet" href="css/registrazione.css" type="text/css"/>
    <link rel="stylesheet" href="css/header.css" type="text/css"/>
  </head>
  <body>
      <%
          String errore = (String)request.getAttribute("err");
            if(errore == null){
                errore="";
            }
      %>
    <header id="header">
       <nav id="navbar">
          <ul class="nav_header">
             <li class="li_header">
                <a href="index.html">Home</a>
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
          </ul>
       </nav>
    </header>

    <div class="container">
      <h1>Registrati</h1>
      <form action="registrazione" method="POST">
         <div>
            <input type="radio" name="tipo" value="azienda"/>Sono un'Azienda.
            <input type="radio" name="tipo" value="studente"/>Sono uno Studente.
            <p><input type="submit" name="Procedi" value="Procedi" id="button"/></p>
            <font color="red">
                <p><%=errore%></p>
            </font>
         </div>
      </form>
    </div>

  </body>
</html>