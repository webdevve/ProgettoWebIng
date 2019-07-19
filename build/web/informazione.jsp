<%-- 
    Document   : informazione
    Created on : 5-lug-2019, 15.05.40
    Author     : Davide Simboli
--%>

<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Informazione</title>
    </head>
    <body>
        <%
        String nome = (String)request.getAttribute("name");
        if(nome == null){
            nome = "";
        }
        %>
        
        <form action="informazioni" method="GET">
            <input type="submit" value="chi sono?"/>
            
        </form>
        <h1>Benvenuto! <%=nome%></h1>
        
        <p>
            <a href="informazione?logout=1">Logout</a>
        </p>
    </body>
</html>
