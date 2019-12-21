/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Model.Offerta;
import Business.Model.offertaAzienda;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author alesi
 */
public class OffertaDAO implements DAOinterface{
    
    @Override
    public boolean insert(ArrayList<Object> args) {
        System.out.println("Entro nel db");
        Connection connect = null;
	PreparedStatement preparedStatement = null;
	boolean success = true;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/internshiptutor",
					"root", "ciao");
            preparedStatement = connect.prepareStatement("INSERT INTO internshiptutor.offerta (titolo, descrizione, luogo, orari, durata, obiettivi, modalita,\n" +
            "rimborsi, id_azienda) VALUES (?,?,?,?,?,?,?,?,?)");
            preparedStatement.setString(1, (String) args.get(0));
            preparedStatement.setString(2, (String) args.get(1));
            preparedStatement.setString(3, (String) args.get(2));
            preparedStatement.setString(4, (String) args.get(3));
            preparedStatement.setString(5, (String) args.get(4));
            preparedStatement.setString(6, (String) args.get(5));
            preparedStatement.setString(7, (String) args.get(6));
            preparedStatement.setString(8, (String) args.get(7));
            preparedStatement.setString(9, (String) args.get(8));   
            
            
            preparedStatement.executeUpdate();
            System.out.println("Sono entrato nel db, inserimento avvenuto con successo");
        }catch(SQLException e){
            System.out.println("ERRORE DATABASE! " + e.getMessage());
            success = false;
        }catch(Exception e){
            System.out.println("ERRORE GENERICO! " + e.getMessage());
            success = false;
        }finally{
            try{
                if (connect != null)
                    connect.close();
		if (preparedStatement != null)
                    preparedStatement.close();
		return success;
            }catch (final SQLException e){
                System.out.println("final - ERRORE DATABASE! " + e.getMessage());
                return false;
            }
        }
    }

    @Override
    public Object retrieve(ArrayList<Object> args) {
        System.out.println("Cerco di accedere al DB (OffertaDAO)");
        Connection connect = null;
        Statement Statement = null;
	ResultSet resultSet = null;
        Offerta offerta = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/internshiptutor",
					"root", "ciao");
            System.out.println("Connessione Stabilita!");
            Statement = connect.createStatement();
            resultSet = Statement.executeQuery("SELECT * FROM internshiptutor.offerta");
            while(resultSet.next()){
                int id = resultSet.getInt("ID");
                String titolo = resultSet.getString("titolo");
                String descrizione = resultSet.getString("descrizione");
                String luogo = resultSet.getString("luogo");
                String orari = resultSet.getString("orari");
                String durata = resultSet.getString("durata");
                String obiettivi = resultSet.getString("obiettivi");
                String modalita = resultSet.getString("modalita");
                String rimborsi = resultSet.getString("rimborsi");
                int id_azienda = resultSet.getInt("id_azienda");
                
                if(titolo.equals((String) args.get(0)) && descrizione.equals((String) args.get(1))){
                    offerta = Offerta.setInstance(id, titolo, descrizione, luogo, orari, durata,
                            obiettivi, modalita, rimborsi, id_azienda);
                    connect.close();
                    Statement.close();
                    resultSet.close();
                    System.out.println("Offerta trovata: " + offerta);
                    return offerta;
                }else{
                    offerta = null;
                }
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
		return offerta;
            } catch(final SQLException e){
                System.out.println("final - ERRORE DATABASE! " + e.getMessage());
                return null;
            }
        }
    }

    public boolean chiudiApriOfferta(int id, String stato) {
        Connection connect = null;
	PreparedStatement preparedStatement = null;
	boolean success = true;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/internshiptutor",
					"root", "ciao");
            System.out.println("Connessione Stabilita!");
            preparedStatement = connect.prepareStatement("UPDATE internshiptutor.offerta SET stato='"+stato+"' WHERE id="+id);
            preparedStatement.executeUpdate();
        }catch(SQLException e){
            System.out.println("ERRORE DATABASE! " + e.getMessage());
        }catch(Exception e){
            System.out.println("ERRORE GENERICO! " + e.getMessage());
        }finally{
            try{
                if (connect != null)
                    connect.close();
		if (preparedStatement != null)
                    preparedStatement.close();
		return success;
            } catch(final SQLException e){
                System.out.println("final - ERRORE DATABASE! " + e.getMessage());
                return false;
            }
        }
    }
    
    public Object dettaglioOfferta(int id){
        Connection connect = null;
        Statement Statement = null;
	ResultSet resultSet = null;
        offertaAzienda offerta = null;
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
                
                offerta = offertaAzienda.setInstance(id, titoloOfferta, Luogo, ore, descrizione, modalita, 
                            orari, rimborsi, obiettivi, ragioneSociale, indirizzo);
                connect.close();
                Statement.close();
                resultSet.close();
                return offerta;
                
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
		return offerta;
            } catch(final SQLException e){
                System.out.println("final - ERRORE DATABASE! " + e.getMessage());
                return null;
            }
        }
    }
    
    
}
