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
                <a href="index.jsp">Home</a>
             </li>
             <li>
                <a href="#news">News</a>
             </li>
             <li>
                <a href="#azienda">Aziende</a>
             </li>
             <li>
                <a href="login.jsp">Accedi</a>
             </li>
          </ul>
       </nav>
    </header>
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
                <p><input size="30" type="text" name="nome" placeholder="Nome" maxlength="200" required/>*</p>
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
                <p><input size="30" type="date" name="data_nascita" placeholder="Data di nascita" required/>*</p>
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
          <p class="center"><input type="submit" name="Registrati" value="Registrati"></p>
        </form>
      </div>
    </div>
    </body>
</html>
