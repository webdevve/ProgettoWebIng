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
   <nav class="navbar navbar-expand-sm bg-dark navbar-dark" style=" z-index:1">
  <!-- Brand -->
  <a class="navbar-brand" href="#">Internship Tutor</a>

  <!-- Links -->
  <ul class="navbar-nav" style="position: relative; top:8px">
    <li class="nav-item">
      <a class="nav-link" href="index.jsp">Home</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="visualizzaAziende.jsp">Aziende</a>
    </li>

    <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Area azienda
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="aggiungiOfferta.jsp">Aggiungi offerta</a>
        <a class="dropdown-item" href="visualizzaOfferte.jsp">Visualizza offerte</a>
      </div>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Area studente
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="mieiTirocini.jsp">I miei tirocini</a>
      </div>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Area amministratore
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="aziendeConvenzionare.jsp">Aziende da convenzionare</a>
      </div>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="login.jsp">Accedi</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="">Logout</a>
    </li>
    <li>
    <form class="form-inline">
    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" style="position:relative; left:160px;">
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="position:relative; left:160px;">Search</button>
  </form>
    </li>
  </ul>
</nav>
    <br><br>
        
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
