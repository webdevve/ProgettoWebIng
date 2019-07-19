/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Model.Azienda;
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
public class AziendaDAO implements DAOinterface{

    @Override
    public boolean insert(ArrayList<Object> args) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object retrieve(ArrayList<Object> args) {
        System.out.println("Cerco di accedere al DB (AziendaDAO)");
        Connection connect = null;
        Statement Statement = null;
	ResultSet resultSet = null;
        Azienda azienda = null;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/internshiptutor",
					"root", "ciao");
            System.out.println("Connessione Stabilita!");
            Statement = connect.createStatement();
            resultSet = Statement.executeQuery("SELECT * FROM internshiptutor.azienda");
            while(resultSet.next()){
                int id = resultSet.getInt("ID");
                String ragione_sociale = resultSet.getString("ragione_sociale");
                String indirizzo = resultSet.getString("indirizzo");
                String partita_iva = resultSet.getString("partita_iva");
                String codice_fiscale = resultSet.getString("codice_fiscale");
                String nome_legale_rappr = resultSet.getString("nome_legale_rappr");
                String cognome_legale_rappr = resultSet.getString("cognome_legale_rappr");
                String nome_responsabile = resultSet.getString("nome_responsabile");
                String cognome_responsabile = resultSet.getString("cognome_responsabile");
                String telefono_responsabile = resultSet.getString("telefono_responsabile");
                String email_responsabile = resultSet.getString("email_responsabile");
                String foro = resultSet.getString("foro");
                String email_azienda = resultSet.getString("email_azienda");
                String pwd_azienda = resultSet.getString("pwd_azienda");
                if(email_azienda.equals((String) args.get(0)) && pwd_azienda.equals((String) args.get(1))){
                    azienda = Azienda.setInstance(id, ragione_sociale, indirizzo, partita_iva,
                            codice_fiscale, nome_legale_rappr, cognome_legale_rappr, nome_responsabile,
                            cognome_responsabile, telefono_responsabile, email_responsabile, foro, 
                            email_azienda, pwd_azienda);
                    connect.close();
                    Statement.close();
                    resultSet.close();
                    System.out.println("Azienda trovata: " + azienda);
                    return azienda;
                }else{
                    azienda = null;
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
		return azienda;
            }catch(final SQLException e){
                System.out.println("final - ERRORE DATABASE! " + e.getMessage());
                return null;
            }
        }
    }
    
}
