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
      <link rel="stylesheet" href="css/header.css" type="text/css"/>
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
                  <a class="selected" href="#Accedi">Accedi</a>
               </li>
               <li>
                  <a href="#profilo"><%=nome%></a>
               </li>
            </ul>
         </nav>
      </header>
       
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
              <p><input type="submit" name="Accedi" value="Accedi"/></p>
           </div>
        </form>
        
        <font color="red">
            <p><%=errore%></p>
        </font>
        <p>Non sei registrato? <a href="registrazione.jsp">registrati ora!</a></p>
      </div>
    </body>
</html>
