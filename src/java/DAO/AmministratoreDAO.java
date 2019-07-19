/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Model.Amministratore;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Davide Simboli
 */
public class AmministratoreDAO implements DAOinterface{

    @Override
    public boolean insert(ArrayList<Object> args) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    /**
     *
     * @param args
     * @return
     */
    @Override
    public Object retrieve(ArrayList<Object> args) {
        System.out.println("Cerco di accedere al DB (AmministratoreDAO)");
        Connection connect = null;
        Statement Statement = null;
	ResultSet resultSet = null;
        Amministratore amministratore = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/internshiptutor",
					"root", "ciao");
            System.out.println("Connessione Stabilita!");
            Statement = connect.createStatement();
            resultSet = Statement.executeQuery("SELECT * FROM internshiptutor.amministratore");
            while(resultSet.next()){
                int id = resultSet.getInt("ID");
                String nome = resultSet.getString("nome");
                String cognome = resultSet.getString("cognome");
                String email_admin = resultSet.getString("email_admin");
                String pwd_admin = resultSet.getString("pwd_admin");
                if(email_admin.equals((String) args.get(0)) && pwd_admin.equals((String) args.get(1))){
                    amministratore = Amministratore.setInstance(id, nome, cognome, email_admin, pwd_admin);
                    connect.close();
                    Statement.close();
                    resultSet.close();
                    System.out.println("Admnin trovato: " + amministratore);
                    return amministratore;
                } else {
                    amministratore = null;
                }
            }
        } catch(SQLException e){
            System.out.println("ERRORE DATABASE! " + e.getMessage());
        } catch(Exception e){
            System.out.println("ERRORE GENERICO! " + e.getMessage());
        } finally{
            try{
                if (connect != null)
                    connect.close();
                if (Statement != null)
                    Statement.close();
		if (resultSet != null)
                    resultSet.close();
		return amministratore;
            } catch(final SQLException e){
                System.out.println("final - ERRORE DATABASE! " + e.getMessage());
                return null;
            }
        }
    }
    
}
