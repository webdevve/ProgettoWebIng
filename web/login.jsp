<%-- 
    Document   : login
    Created on : 4-lug-2019, 19.53.38
    Author     : Davide Simboli
--%>
<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <title>Internship Tutor - Login</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      <link rel="stylesheet" href="css/login.css" type="text/css"/>
    </head>
    <body>
        <%
            String errore = (String)request.getAttribute("err");
            String nome = (String)request.getAttribute("name");
            if(errore == null){
                errore="";
            }
            if(nome == null){
                nome = "";
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
       
       <script>
        function attenzione() {
        alert("Hello! I am an alert box!");
        }
       </script>
      
      <div class="container-login">
        <h1>Accedi</h1>
        <form action="login" method="POST">
           <div>
              <p>Username: <input type="email" name="username" required="required" placeholder="Email"/></p>
              <p>Password: <input type="password" name="password" required="required" placeholder="Password"/></p>
              <p><input type="submit" name="Accedi" class="btn btn-primary" value="Accedi"/></p>
           </div>
        </form>
        
        <font color="red">
            <p><%=errore%></p>
        </font>
        <p>Non sei registrato? <a href="registrazione.jsp">registrati ora!</a></p>
      </div>
    </body>
</html>
