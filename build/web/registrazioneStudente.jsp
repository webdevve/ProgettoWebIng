<%-- 
    Document   : registrazioneAzienda
    Created on : 11-lug-2019, 23.05.25
    Author     : Davide Simboli
--%>
<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Internship Tutor - Registrazione</title>
        <link rel="stylesheet" href="css/registrazioneAzienda.css" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="css/login.css" type="text/css"/>
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
      <h1 class="center">Registrazione Studente</h1>
      <div id="orizzontale">
        <form action="registrazioneStudente" method="POST">
            <font color="red">
                <p><%=errore%></p>
            </font>
          <table>
            <tr>
              <td class="left">Nome</td>
              <td>
                <p><input size="30" type="text" name="nome" placeholder="Nome" maxlength="200" />*</p>
              </td>
            </tr>
            <tr>
              <td class="left">Cognome</td>
              <td>
                <p><input size="30" type="text" name="cognome" placeholder="Cognome" maxlength="100" required/>*</p>
              </td>
            </tr>
            <tr>
              <td class="left">Luogo di nascita</td>
              <td>
                <p><input size="30" type="text" name="luogo_nascita" placeholder="Luogo di nascita" maxlength="92" required/>*</p>
              </td>
            </tr>
           
            <tr>
              <td class="left">Data di nascita</td>
              <td>
                <p>
                    <input size="2" type="number" name="giorno" placeholder="gg" required min="1" max="31"/>-
                    <input size="2" type="number" name="mese" placeholder="mm" required min="1" max="12"/>-
                    <input size="4" type="number" name="anno" placeholder="aaaa" required min="1900"/>*
                </p>
              </td>
            </tr>
            <tr>
              <td class="left">Codice Fiscale</td>
              <td>
                <p><input size="30" type="text" name="codice_fiscale" placeholder="CF" minlength="16" maxlength="16" required style="text-transform: uppercase;"/>*</p>
              </td>
            </tr>
            <tr>
              <td class="left">Residenza</td>
              <td>
                <p><input size="30" type="text" name="residenza" placeholder="Residenza" maxlength="100" required/>*</p>
              </td>
            </tr>
            <tr>
              <td class="left">Telefono</td>
              <td>
                <p><input size="30" type="tel" name="telefono" placeholder="Telefono" maxlength="100" required/>*</p>
              </td>
            </tr>
            <tr>
              <td class="left">Corso di laurea</td>
              <td>
                <p><input size="30" type="text" name="corso_laurea" placeholder="Corso di laurea" maxlength="100" required/>*</p>
              </td>
            </tr>
            <tr>
              <td class="left">Handicap</td>
              <td>
                <p><input size="30" type="radio" value="si" name="handicap"  required/>Si</p>
                <p><input size="30" type="radio" value="no" name="handicap"  required/>No</p>
              </td>
            </tr>
            <tr>
              <td class="left">Email</td>
              <td>
                <p><input size="30" type="email" name="email" placeholder="Email" maxlength="50" required/>*</p>
              </td>
            </tr>
            <tr>
              <td class="left">Password</td>
              <td>
                  <p><input size="30" type="password" name="password" placeholder="Password" minlength="6" maxlength="100" required/>*</p>
              </td>
            </tr>
            <tr>
              <td class="left">Conferma Password</td>
              <td>
                <p><input size="30" type="password" name="conf_passw" placeholder="Conferma Password" minlength="8" maxlength="50" required/>*</p>
              </td>
            </tr>
          </table>
          <p class="center"><input type="submit" name="Registrati" class="btn btn-primary" value="Registrati"></p>
        </form>
      </div>
    </div>
    </body>
</html>
