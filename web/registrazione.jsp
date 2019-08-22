<%-- 
   Document   : registrazione
   Created on : 11-lug-2019, 22.45.52
   Author     : Davide Simboli
   --%>
<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <title>Registrazione</title>
      <link rel="stylesheet" href="css/registrazione.css" type="text/css"/>
      <link rel="stylesheet" type="text/css" href="css/loginUtil.css">
      <link rel="stylesheet" type="text/css" href="css/loginMain.css">
      <link rel="stylesheet" href="css/header.css" type="text/css"/>
   </head>
   <body>
      <%
         String errore = (String)request.getAttribute("err");
           if(errore == null){
               errore="";
           }
         %>
      <div class="header" id="header">
         <a href="#default" class="logo">InternshipTutor</a>
         <div class="header-right">
            <a href="index.jsp">Home</a>
            <a href="#news">News</a>
            <a href="visualizzaAziende.jsp" >Aziende</a>
            <a href="login.jsp">Accedi</a>
         </div>
      </div>
      <div class="limiter">
         <div class="container-login100">
            <div class="wrap-login100 p-b-90 p-t-50">
               <form class="login100-form flex-sb flex-w" action="registrazione" method="post">
                  <span class="login100-form-title">Registrati come...</span>
                  <div class="wrap-input100 validate-input m-b-16">
                     <input type="radio" name="tipo" value="azienda"/>Azienda
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input type="radio" name="tipo" value="studente"/>Studente
                     <span class="focus-input100"></span>
                  </div>
                  <div class="container-login100-form-btn m-t-17">
                     <input type="submit" name="Procedi" value="Procedi" class="login100-form-btn"/>
                  </div>
               </form>
               <br>
               <font color="red" id="err">
                  <p><%=errore%></p>
               </font>
            </div>
         </div>
      </div>
   </body>
</html>