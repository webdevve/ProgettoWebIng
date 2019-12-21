/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Davide Simboli
 */
public class RecensioneDAO implements DAOinterface{

    @Override
    public boolean insert(ArrayList<Object> args) {
        Connection connect = null;
	PreparedStatement preparedStatement = null;
	boolean success = true;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/internshiptutor",
					"root", "ciao");
            preparedStatement = connect.prepareStatement("INSERT INTO internshiptutor.recensione (id_studente, id_azienda, valutazione ) VALUES (?,?,?)");
            preparedStatement.setInt(1, (int) args.get(0));
            preparedStatement.setInt(2, (int) args.get(1));
            preparedStatement.setDouble(3, (double) args.get(2));
            
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
    
    public static boolean setRecensito(int id_candidatura){
        Connection connect = null;
	PreparedStatement preparedStatement = null;
	boolean success = true;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/internshiptutor",
					"root", "ciao");
            preparedStatement = connect.prepareStatement("update internshiptutor.canditature set recensione = 'recensito' where id = '"+id_candidatura+"'");
            
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
