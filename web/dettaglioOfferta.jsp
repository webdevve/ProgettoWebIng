<%@page import="Business.Model.offertaAzienda"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Internship Tutor</title>
        <link rel="stylesheet" href="css/header.css" type="text/css"/>
        <link rel="stylesheet" href="css/index.css" type="text/css"/>
        <link rel="stylesheet" href="css/dettaglioOfferta.css" type="text/css"/>
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
            String errore = (String)request.getAttribute("err");
            if(errore == null){
              errore="";
            }
            String notifica = (String)request.getAttribute("notify");
             if(notifica == null){
               notifica="";
             }
        %>
    <div class="header">
        <a href="#default" class="logo">InternshipTutor</a>
        <div class="header-right">
          <a class="active" href="index.jsp">Home</a>
          <%if(nome != null){%>
          <a href="<%=linkDoc%>"><%=documenti%></a>
          <a href="recensioni.jsp">Recensioni</a>
          <%}%>
          <a href="visualizzaAziende.jsp" >Aziende</a>
          <%if(str==null){%>
          <a href="<%=linkAccedi%>"><%=login%></a>
          <%}else{%>
          <a href="javascript:{}" onclick="document.getElementById('my_form').submit(); return false;">Logout</a>
          <%}%>
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
        <%
            int id = (int)request.getAttribute("id");
            Connection connect = null;
            Statement Statement = null;
            ResultSet resultSet = null;
            String nomeStud = "";
            String cognomeStud = "";
            String luogo_nascita = "";
            String data_nascita = "";
            String residenza = "";
            String cf = "";
            String telefono = "";
            try{
                Class.forName("com.mysql.jdbc.Driver");
                connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/internshiptutor",
                                            "root", "ciao");
                System.out.println("Connessione Stabilita!");
                Statement = connect.createStatement();
                resultSet = Statement.executeQuery("SELECT * FROM internshiptutor.offerta_azienda where id = "+id);
                while(resultSet.next()){
                    String ragioneSociale = resultSet.getString("ragione_sociale");
                    String titoloOfferta = resultSet.getString("titolo");
                    String Luogo = resultSet.getString("luogo");
                    String orari = resultSet.getString("orari");
                    String ore = resultSet.getString("durata");
                    String obiettivi = resultSet.getString("obiettivi");
                    String modalita = resultSet.getString("modalita");
                    String rimborsi = resultSet.getString("rimborsi");
                    String descrizione = resultSet.getString("descrizione");
                    String indirizzo = resultSet.getString("indirizzo");
                    %>
        <form action="aderisciOfferta" method="post" class="tableform">
            <input type="hidden" value="<%=id%>" name="idOfferta"/>
            <input type="hidden" value="<%=str%>" name="str"/>
          <table class="center">
            <tr class="grey">
              <th colspan="2"><h3><%=titoloOfferta%></h3></th>
            </tr>
            <tr class="whitegrey">
              <td>Azienda</td>
              <td><%=ragioneSociale%></td>
            </tr>
            <tr class="grey">
              <td>Indirizzo</td>
              <td><%=indirizzo%></td>
            </tr>
            <tr class="whitegrey">
              <td>Luogo</td>
              <td><%=Luogo%></td>
            </tr>
            <tr class="grey">
              <td>Orari</td>
              <td><%=orari%></td>
            </tr>
            <tr class="whitegrey">
              <td>Ore</td>
              <td><%=ore%></td>
            </tr>
            <tr class="grey">
              <td>Obiettivi</td>
              <td><%=obiettivi%></td>
            </tr>
            <tr class="whitegrey">
              <td>Modalità</td>
              <td><%=modalita%></td>
            </tr>
            <tr class="grey">
              <td>Rimborsi</td>
              <td><%=rimborsi%></td>
            </tr>
            <tr class="whitegrey">
              <td>Descrizione</td>
              <td><%=descrizione%></td>
            </tr>
            <tr>
              <td colspan="2" class="btnCentre">
                <button type="submit" name="button" id="btnsi"><h3>Aderisci All'Offerta</h3></button>
              </td>
            </tr>
          </table>
        
        <%
                }
                resultSet = Statement.executeQuery("SELECT * FROM internshiptutor.studente where email_studente = '"+str+"'");
                while(resultSet.next()){
                    nomeStud = resultSet.getString("nome");
                    cognomeStud = resultSet.getString("cognome");
                    luogo_nascita = resultSet.getString("luogo_nascita");
                    data_nascita = resultSet.getString("data_nascita");
                    residenza = resultSet.getString("residenza");
                    cf = resultSet.getString("cf");
                    telefono = resultSet.getString("telefono");
                }
                    connect.close();
                    Statement.close();
                    resultSet.close();
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
                } catch(final SQLException e){
                    System.out.println("final - ERRORE DATABASE! " + e.getMessage());
                }
            }
            %>
            <input type="hidden" name="nomeStud" value="<%=nomeStud%>"/>
            <input type="hidden" name="cognomeStud" value="<%=cognomeStud%>"/>
            <input type="hidden" name="luogo_nascita" value="<%=luogo_nascita%>"/>
            <input type="hidden" name="data_nascita" value="<%=data_nascita%>"/>
            <input type="hidden" name="residenza" value="<%=residenza%>"/>
            <input type="hidden" name="cf" value="<%=cf%>"/>
            <input type="hidden" name="telefono" value="<%=telefono%>"/>
        </form>
    </body>
</html>
