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
          <p class="center"><input type="submit" name="Aggiungi" value="Aggiungi"></p>
        </form>
      </div>
    </div>
    </body>
</html>
