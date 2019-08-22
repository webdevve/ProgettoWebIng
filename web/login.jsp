<%-- 
    Document   : login
    Created on : 4-lug-2019, 19.53.38
    Author     : Davide Simboli
--%>
<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
    <meta charset="utf-8">
    <title>Login</title>
    <link rel="stylesheet" href="css/header.css" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="css/loginUtil.css">
    <link rel="stylesheet" type="text/css" href="css/loginMain.css">
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
        <a href="#accedi" class="active">Accedi</a>
      </div>
    </div>
    <div class="limiter">
      <div class="container-login100">
        <div class="wrap-login100 p-b-90 p-t-50">
          <form class="login100-form flex-sb flex-w" action="login" method="post">
            <span class="login100-form-title">Login</span>
            <div class="wrap-input100 validate-input m-b-16">
                <input class="input100" type="text" name="username" placeholder="Username" required/>
              <span class="focus-input100"></span>
            </div>
            <div class="wrap-input100 m-b-16">
              <input class="input100" type="password" name="password" placeholder="Password" required/>
              <span class="focus-input100"></span>
            </div>
            <div class="flex-sb-m w-full p-b-24 p-t-3">
              <a href="registrazione.jsp" class="txt1">Non sei registrato? registrati ora!</a>
            </div>
            <div class="container-login100-form-btn m-t-17">
              <input type="submit" name="accedi" value="Accedi" class="login100-form-btn"/>
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