<%-- 
    Document   : registrazione
    Created on : 11-lug-2019, 22.45.52
    Author     : Davide Simboli
--%>

<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Internship Tutor - Registrazione</title>
    <link rel="stylesheet" href="css/registrazione.css" type="text/css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  </head>
  <body>
      <%
          String errore = (String)request.getAttribute("err");
          if(errore == null){
                errore="";
            }
      %>
   
         <!--HEADER-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="position:fixed; z-index:1">
  <a class="navbar-brand" href="#">Internship Tutor</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Aziende</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">News</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="aggiungiOfferta.jsp">Aggiungi offerta</a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="login.jsp">Accedi</a>
      </li>
    </ul>
  </div>
 </nav><br><br><br><br>

    <div class="container">
      <h1>Registrati</h1>
      <form action="registrazione" method="POST">
         <div>
            <input type="radio" name="tipo" value="azienda"/> Sono un'Azienda.
            <input type="radio" name="tipo" value="studente"/> Sono uno Studente.
            <p><input type="submit" name="Procedi" class="btn btn-primary" value="Procedi" id="button"/></p>
            <font color="red">
                <p><%=errore%></p>
            </font>
         </div>
      </form>
    </div>

  </body>
</html>

