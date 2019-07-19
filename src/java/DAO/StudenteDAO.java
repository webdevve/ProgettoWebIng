/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Model.Studente;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
                Date data_nascita = resultSet.getDate("data_nascita");
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
    
}
