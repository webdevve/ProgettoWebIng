<%-- 
    Document   : agggiungiOfferta
    Created on : 24-lug-2019, 17.19.25
    Author     : alesi
--%>
<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Internship Tutor - Registrazione</title>
        <link rel="stylesheet" href="css/registrazioneAzienda.css" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            String errore = (String)request.getAttribute("err");
            if(errore == null){
                errore="";
            }
        %>
       
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
    
        
    <div class="container">
      <h1 class="center">Aggiungi Offerta</h1>
      <div id="orizzontale">
        <form action="aggiungiOfferta" method="POST">
            <font color="red">
                <p><%=errore%></p>
            </font>
          <table>
            <tr>
              <td class="left">Titolo</td>
              <td>
                <p><input size="30" type="text" name="titolo" placeholder="Titolo" maxlength="200" required/>*</p>
              </td>
            </tr>
            <tr>
              <td class="left">Descrizione</td>
              <td>
                <p><textarea name="descrizione" placeholder="Descrizione" rows="4" cols="24" maxlength="100" required/></textarea>*</p>
              </td>
            </tr>
            <tr>
              <td class="left">Luogo</td>
              <td>
                <p><input size="30" type="text" name="luogo" placeholder="Luogo" maxlength="92" required/>*</p>
              </td>
            </tr>
            
            <tr>
              <td class="left">Orari</td>
              <td>
                <p><input size="30" type="text" name="orari" placeholder="Orari"  maxlength="100" required/>*</p>
              </td>
            </tr>
            <tr>
              <td class="left">Durata</td>
              <td>
                <p><input size="30" type="text" name="durata" placeholder="Durata"  maxlength="100" required/>*</p>
              </td>
            </tr>
            <tr>
              <td class="left">Obiettivi</td>
              <td>
                  <p><textarea name="obiettivi" placeholder="Obiettivi" rows="3" cols="24"  required></textarea>*</p>
              </td>
            </tr>
            <tr>
              <td class="left">Modalità</td>
               <td>
                <p><input size="30" type="radio" value="team aziendale" name="modalita"  required/>Team aziendale</p>
                <p><input size="30" type="radio" value="in remoto" name="modalita"  required/>In remoto</p>
              </td>
            </tr>
            <tr>
              <td class="left">Rimborsi</td>
              <td>
                <p><input size="30" type="radio" value="si" name="rimborsi"  required/>Si</p>
                <p><input size="30" type="radio" value="no" name="rimborsi"  required/>No</p>
              </td>
            </tr>
           
          </table>
          <p class="center"><input type="submit" name="Aggiungi" class="btn btn-primary" value="Aggiungi"></p>
        </form>
      </div>
    </div>
    </body>
</html>
