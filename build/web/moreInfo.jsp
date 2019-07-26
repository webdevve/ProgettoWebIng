<%--
    Document   : MoreInfo
    Created on : 26-lug-2019, 15.01.05
    Author     : alesi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
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
 </nav><br><br><br>
        
      <div style="background-color:#f3f3f3;" class="container">
        <p><strong>Nome azienda:</strong> Icofer</p><br>
        <p><strong>Descrizione:</strong> Azienda leader nel settore metallurgico propone tirocinio</p><br>
        <p><strong>Luogo:</strong> Roma</p><br>
        <p><strong>Orari:</strong> 8-12</p><br>
        <p><strong>Durata:</strong> 3 mesi</p><br>
        <p><strong>Obiettivi:</strong> Formare figure professionali</p><br>
        <p><strong>Modalità:</strong> In azienda</p><br>
        <p><strong>Rimborsi:</strong> Si</p><br>
        <button type="button" class="btn btn-primary">Richiedi</button>
      </div>
    </body>
</html>
