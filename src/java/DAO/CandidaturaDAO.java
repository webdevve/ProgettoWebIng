/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Model.Candidatura;
import Business.Model.Offerta;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Davide Simboli
 */
public class CandidaturaDAO implements DAOinterface{

    @Override
    public boolean insert(ArrayList<Object> args) {
        System.out.println("Entro nel db Candidatura");
        Connection connect = null;
	PreparedStatement preparedStatement = null;
	boolean success = true;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/internshiptutor",
					"root", "ciao");
            preparedStatement = connect.prepareStatement("INSERT INTO internshiptutor.canditature (id_studente, id_offerta, data_inizio, data_fine, cfu, tutoreUniversitario, telefonoTutoreUni,\n" +
            "emailTutoreUni, documento, condizione) VALUES (?,?,?,?,?,?,?,?,?,?)");
            preparedStatement.setInt(1, (int) args.get(0));
            preparedStatement.setString(2, (String) args.get(1));
            preparedStatement.setString(3, (String) args.get(2));
            preparedStatement.setString(4, (String) args.get(3));
            preparedStatement.setString(5, (String) args.get(4));
            preparedStatement.setString(6, (String) args.get(5));
            preparedStatement.setString(7, (String) args.get(6));
            preparedStatement.setString(8, (String) args.get(7));
            preparedStatement.setString(9, (String) args.get(8));
            preparedStatement.setString(10, (String) args.get(9));
            
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
        System.out.println("Cerco di accedere al DB (CandidaturaDAO)");
        Connection connect = null;
        Statement Statement = null;
	ResultSet resultSet = null;
        Candidatura candidatura = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/internshiptutor",
					"root", "ciao");
            System.out.println("Connessione Stabilita!");
            Statement = connect.createStatement();
            resultSet = Statement.executeQuery("SELECT * FROM internshiptutor.candidature");
            while(resultSet.next()){
                int id = resultSet.getInt("id");
                String id_studente = resultSet.getString("id_studente");
                String id_offerta = resultSet.getString("id_offerta");
                String data_inizio = resultSet.getString("data_inizio");
                String data_fine = resultSet.getString("data_fine");
                String cfu = resultSet.getString("cfu");
                String tutoreUniversitario = resultSet.getString("tutoreUniversitario");
                String telefonoTutoreUni = resultSet.getString("telefonoTutoreUni");
                String emailTutoreUni = resultSet.getString("emailTutoreUni");
                String approvazione = resultSet.getString("approvazione");
                String documento = resultSet.getString("documento");
                
                    
                    candidatura = Candidatura.setInstance(id,id_studente, id_offerta, data_inizio, data_fine, cfu, tutoreUniversitario,
                    telefonoTutoreUni, emailTutoreUni, approvazione, documento);
                    connect.close();
                    Statement.close();
                    resultSet.close();
                    return candidatura;
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
		return candidatura;
            } catch(final SQLException e){
                System.out.println("final - ERRORE DATABASE! " + e.getMessage());
                return null;
            }
        }
    
    }
    
    public static boolean approvaTirocinio(ArrayList<Object> args){
        Connection connect = null;
	PreparedStatement preparedStatement = null;
	boolean success = true;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/internshiptutor",
					"root", "ciao");
            preparedStatement = connect.prepareStatement("update internshiptutor.canditature "
                    + "set approvazione = 'approvata', data_inizio = ?, data_fine = ?"
                    + ", documento = ? where id = ?");
            preparedStatement.setString(1, (String) args.get(0));
            preparedStatement.setString(2, (String) args.get(1));
            preparedStatement.setString(3, (String) args.get(2));
            preparedStatement.setString(4, (String) args.get(3));
            preparedStatement.executeUpdate();
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
    
}
