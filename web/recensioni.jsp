<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Internship Tutor</title>
        <link rel="stylesheet" href="css/header.css" type="text/css"/>
        <link rel="stylesheet" href="css/index.css" type="text/css"/>
        <link rel="stylesheet" href="css/admin.css" type="text/css"/>
        <link rel="stylesheet" href="css/recensione.css" type="text/css"/>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%
            HttpSession sessione = request.getSession();
            String str = (String)sessione.getAttribute("username");
            request.setAttribute("name", str);
            String nome = (String)request.getAttribute("name");
            String login = "";
            String linkAccedi = "";
            String linkDoc = "";
            String documenti = "";
            if(nome == null){
                //nome = "";
                login = "Accedi";
                linkAccedi = "login.jsp";
                linkDoc = "";
            }else{
                login = nome;
                linkAccedi = "#profilo";
                linkDoc = "documentiStud.jsp";
                documenti = "Documenti";
            }
            String notifica = (String)request.getAttribute("notify");
            if(notifica == null){
              notifica="";
            }
            String errore = (String)request.getAttribute("err");
            if(errore == null){
              errore="";
            }
        %>
    <div class="header">
        <a href="#default" class="logo">InternshipTutor</a>
        <div class="header-right">
          <a href="index.jsp">Home</a>
          <%if(nome != null){%>
          <a href="<%=linkDoc%>"><%=documenti%></a>
          <a class="active" href="recensioni.jsp">Recensioni</a>
          <%}%>
          <a href="visualizzaAziende.jsp" >Aziende</a>
          <%
              if(str==null){
          %>
          <a href="<%=linkAccedi%>"><%=login%></a>
          <%
              }else{
          %>
          <a href="javascript:{}" onclick="document.getElementById('my_form').submit(); return false;">Logout</a>
          <%
              }
          %>
          <a>
            <form action="ricerca.jsp">
              <input type="text" placeholder="Search.." name="search"/>
              <button type="submit" name="search" id="not-button"><i class="fa fa-search"></i></button>
            </form>
          </a>
        </div>
    </div>
          <form action="logout" method="post" id="my_form"></form>
        <%if(str!=null){%>
        <div class="centra"><img src="icon/user.ico"/><%=str%></div>
        <%}%>
            <font color="red" id="err">
            <p><%=errore%></p>
          </font>
          <font color="green">
            <p><%=notifica%></p>
          </font>
          
          <div class="container">
         <div class="cardAdmin" style="overflow-x:auto;">
            <div class="cardContainer">
               <table style="width:100%">
                  <tr>
                     <th colspan="14" style="background-color: whitesmoke;">
                         <h3>Recensioni</h3>
                     </th>
                  </tr>
                  <tr style="background-color: whitesmoke;">
                     <th>Tirocinio</th>
                     <th>Valutazione</th>
                     <th>Conferma</th>
                  </tr>
                  <%
                     Connection connect = null;
                     Statement Statement = null;
                     ResultSet resultSet = null;
                     int count = 0;
                         try{
                             Class.forName("com.mysql.jdbc.Driver");
                             connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/internshiptutor",
                     "root", "ciao");
                             System.out.println("Connessione Stabilita!");
                             Statement = connect.createStatement();
                             resultSet = Statement.executeQuery("SELECT documento_formativo.titolo, documento_formativo.id_studente, documento_formativo.id_azienda, "
                                     + "documento_formativo.id " 
                                +"from internshiptutor.documento_formativo "
                                +"where documento_formativo.email_studente = '"+str+"' "
                                +"and documento_formativo.approvazione = 'chiusa' "
                                + "and documento_formativo.recensione = 'non recensito'");
                             while(resultSet.next()){
                     %>
                  <form action="recensione" method="post">
                      <%
                          String titolo = resultSet.getString("titolo");
                          int id_studente = resultSet.getInt("id_studente");
                          int id_azienda = resultSet.getInt("id_azienda");
                          int id_candidatura = resultSet.getInt("id");
                      %>
                      <input type="hidden" value="<%=id_studente%>" name="id_studente"/>
                      <input type="hidden" value="<%=id_azienda%>" name="id_azienda"/>
                      <input type="hidden" value="<%=id_candidatura%>" name="id_candidatura"/>
                     <tr>
                        <td><%=titolo%></td>
                        <td>
                            <fieldset class="rating">
                                <input type="radio" id="star5" name="rating" value="5" />
                                <label class = "full" for="star5" title="Awesome - 5 stars"></label>
                                <input type="radio" id="star4half" name="rating" value="4.5" />
                                <label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
                                <input type="radio" id="star4" name="rating" value="4" />
                                <label class = "full" for="star4" title="Pretty good - 4 stars"></label>
                                <input type="radio" id="star3half" name="rating" value="3.5" />
                                <label class="half" for="star3half" title="Meh - 3.5 stars"></label>
                                <input type="radio" id="star3" name="rating" value="3" />
                                <label class = "full" for="star3" title="Meh - 3 stars"></label>
                                <input type="radio" id="star2half" name="rating" value="2.5" />
                                <label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
                                <input type="radio" id="star2" name="rating" value="2" />
                                <label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
                                <input type="radio" id="star1half" name="rating" value="1.5" />
                                <label class="half" for="star1half" title="Meh - 1.5 stars"></label>
                                <input type="radio" id="star1" name="rating" value="1" />
                                <label class = "full" for="star1" title="Sucks big time - 1 star"></label>
                                <input type="radio" id="starhalf" name="rating" value="0.5" />
                                <label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
                            </fieldset>
                        </td>
                        <td>
                            <button type="submit" name="stato" value="conferma" id='btnsi' style="width: 100px;">Conferma</button>
                        </td>
                     </tr>
                  </form>
                  <%
                     count += 1;
                     }
                     connect.close();
                     Statement.close();
                     resultSet.close();
                     if(count == 0){
                     %>
                  <td>-</td>
                  <td>-</td>
                  <td>-</td>
                  <%
                     }
                     }catch(SQLException e){
                     System.out.println("ERRORE DATABASE! " + e.getMessage());
                     }catch(Exception e){
                     System.out.println("ERRORE GENERICO! " + e.getMessage());
                     }finally{
                     try{
                         if (connect != null)
                             connect.close();
                         if (Statement != null)
                             Statement.close();
                         if (resultSet != null)
                             resultSet.close();
                     }catch(final SQLException e){
                     System.out.println("final - ERRORE DATABASE! " + e.getMessage());
                     }
                     }
                     %>
               </table>
            </div>
         </div>
      </div>
    </body>
</html>
