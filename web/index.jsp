<%-- 
    Document   : index
    Created on : 5-lug-2019, 11.31.45
    Author     : Davide Simboli
--%>

<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <title>Internship Tutor</title>
    <!--<link rel="stylesheet" href="css/header.css" type="text/css"/>-->
    <link rel="stylesheet" href="css/index.css" type="text/css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  </head>
  <body>
    <%
        String nome = (String)request.getAttribute("name");
        if(nome == null){
            nome = "";
        }
    %>
 <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="position:fixed; z-index:1;">
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
 
    <div>
      <ul class="post">
        <%
            for(int i = 0; i < 12; i++){
        %>
        
            
                <form action="moreInfo" method="POST">
                    <div class="card" style="width: 60rem;">
                        <div class="card-body">
                            <h5 class="card-title">Titolo</h5>
                            <p class="card-text">Descrizione descrizione descrizione descrizione descrizione</p>
                            <input type="submit"  class="btn btn-primary" value="Scopri di più"></button>
                        </div>
                    </div>
                    
                </form>
            
        
        <%
            }
        %>
     
    
  </body>
</html>
