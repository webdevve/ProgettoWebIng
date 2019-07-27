<%-- 
    Document   : aziendeConvenzionare
    Created on : 27-lug-2019, 11.31.45
    Author     : alesi
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  </head>
  <body>
    <%
        String nome = (String)request.getAttribute("name");
        if(nome == null){
            nome = "";
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
    <br><br>
  
            <label style="position:relative; left:45px"><strong>Aziende da convenzionare</strong></label><br><br>
    
    <div>
      <ul class="post">
        <%
            for(int i = 0; i < 12; i++){
        %>
        
            
                <form action="" method="POST">
                    <div class="card" style="width: 60rem;">
                        <div class="card-body">
                            <h5 class="card-title">Nome azienda</h5>
                            <input type="submit"  class="btn btn-primary" value="Convenziona"></button>
                        </div>
                    </div>
                    
                </form>
            
        
        <%
            }
        %>
     
    
  </body>
</html>
