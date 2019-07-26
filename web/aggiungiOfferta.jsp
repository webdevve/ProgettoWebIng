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
 </nav><br>
        
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
