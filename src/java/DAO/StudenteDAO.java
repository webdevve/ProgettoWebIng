/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Model.Studente;
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
public class StudenteDAO implements DAOinterface{

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
            preparedStatement = connect.prepareStatement("INSERT INTO internshiptutor.studente (nome, cognome, luogo_nascita, data_nascita, cf, residenza, telefono, handicap,\n" +
"corso_laurea, email_studente, pwd_studente) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
            preparedStatement.setString(1, (String) args.get(0));
            preparedStatement.setString(2, (String) args.get(1));
            preparedStatement.setString(3, (String) args.get(2));
            preparedStatement.setString(4, (String) args.get(3));
            preparedStatement.setString(5, (String) args.get(4));
            preparedStatement.setString(6, (String) args.get(5));
            preparedStatement.setString(7, (String) args.get(6));
            preparedStatement.setString(8, (String) args.get(7));
            preparedStatement.setString(9, (String) args.get(8));
            preparedStatement.setString(10, (String) args.get(9));
            preparedStatement.setString(11, (String) args.get(10));
            
            
            
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
        System.out.println("Cerco di accedere al DB (StudenteDAO)");
        Connection connect = null;
        Statement Statement = null;
	ResultSet resultSet = null;
        Studente studente = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/internshiptutor",
					"root", "ciao");
            System.out.println("Connessione Stabilita!");
            Statement = connect.createStatement();
            resultSet = Statement.executeQuery("SELECT * FROM internshiptutor.studente");
            while(resultSet.next()){
                int id = resultSet.getInt("ID");
                String nome = resultSet.getString("nome");
                String cognome = resultSet.getString("cognome");
                String luogo_nascita = resultSet.getString("luogo_nascita");
                String data_nascita = resultSet.getString("data_nascita");
                String residenza = resultSet.getString("residenza");
                String cf = resultSet.getString("cf");
                String telefono = resultSet.getString("telefono");
                String corso_laurea = resultSet.getString("corso_laurea");
                String handicap = resultSet.getString("handicap");
                String email_studente = resultSet.getString("email_studente");
                String pwd_studente = resultSet.getString("pwd_studente");
                if(email_studente.equals((String) args.get(0)) && pwd_studente.equals((String) args.get(1))){
                    studente = Studente.setInstance(id, nome, cognome, luogo_nascita, data_nascita, residenza,
                            cf, telefono, corso_laurea, handicap, email_studente, pwd_studente);
                    connect.close();
                    Statement.close();
                    resultSet.close();
                    System.out.println("Studente trovato: " + studente);
                    return studente;
                }else{
                    studente = null;
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
		return studente;
            } catch(final SQLException e){
                System.out.println("final - ERRORE DATABASE! " + e.getMessage());
                return null;
            }
        }
    }
    
    public Object getStudent(String email){
        System.out.println("Cerco di accedere al DB (StudenteDAO)");
        Connection connect = null;
        Statement Statement = null;
	ResultSet resultSet = null;
        Studente studente = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/internshiptutor",
					"root", "ciao");
            System.out.println("Connessione Stabilita!");
            Statement = connect.createStatement();
            resultSet = Statement.executeQuery("SELECT * FROM internshiptutor.studente WHERE email_studente='"+email+"'");
            while(resultSet.next()){
                int id = resultSet.getInt("ID");
                String nome = resultSet.getString("nome");
                String cognome = resultSet.getString("cognome");
                String luogo_nascita = resultSet.getString("luogo_nascita");
                String data_nascita = resultSet.getString("data_nascita");
                String residenza = resultSet.getString("residenza");
                String cf = resultSet.getString("cf");
                String telefono = resultSet.getString("telefono");
                String corso_laurea = resultSet.getString("corso_laurea");
                String handicap = resultSet.getString("handicap");
                String email_studente = resultSet.getString("email_studente");
                String pwd_studente = resultSet.getString("pwd_studente");
                if(email_studente.equals((String) email)){
                    studente = Studente.setInstance(id, nome, cognome, luogo_nascita, data_nascita, residenza,
                            cf, telefono, corso_laurea, handicap, email_studente, pwd_studente);
                    connect.close();
                    Statement.close();
                    resultSet.close();
                    System.out.println("Studente trovato: " + studente);
                    return studente;
                }else{
                    studente = null;
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
		return studente;
            } catch(final SQLException e){
                System.out.println("final - ERRORE DATABASE! " + e.getMessage());
                return null;
            }
        }
    }
    
}
