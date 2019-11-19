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
            "emailTutoreUni, documento) VALUES (?,?,?,?,?,?,?,?,?)");
            preparedStatement.setInt(1, (int) args.get(0));
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
