/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Model.Azienda;
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
public class AziendaDAO implements DAOinterface{

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
            preparedStatement = connect.prepareStatement("INSERT INTO internshiptutor.azienda (ragione_sociale, indirizzo, partita_iva, codice_fiscale, nome_legale_rappr, cognome_legale_rappr, nome_responsabile,\n" +
"cognome_responsabile, telefono_responsabile, email_responsabile, foro, email_azienda, pwd_azienda, descrizione, ambito) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
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
            preparedStatement.setString(12, (String) args.get(11));
            preparedStatement.setString(13, (String) args.get(12));
            preparedStatement.setString(14, (String) args.get(13));
            preparedStatement.setString(15, (String) args.get(14));
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
    public boolean disapprovaConvenzione(ArrayList<Object> args){
        System.out.println("Entro nel db");
        Connection connect = null;
	PreparedStatement preparedStatement = null;
	boolean success = true;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/internshiptutor",
					"root", "ciao");
            preparedStatement = connect.prepareStatement("UPDATE internshiptutor.azienda SET stato='nonApprovata' WHERE email_azienda=?");
            preparedStatement.setString(1, (String) args.get(0));
            preparedStatement.executeUpdate();
            System.out.println("Disapprovazione avvenuta con successo!");
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
    
    public boolean approvaConvenzione(ArrayList<Object> args){
        System.out.println("Entro nel db");
        Connection connect = null;
	PreparedStatement preparedStatement = null;
	boolean success = true;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/internshiptutor",
					"root", "ciao");
            preparedStatement = connect.prepareStatement("UPDATE internshiptutor.azienda SET stato='approvata' WHERE email_azienda=?");
            preparedStatement.setString(1, (String) args.get(0));
            preparedStatement.executeUpdate();
            System.out.println("Disapprovazione avvenuta con successo!");
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
    
    public boolean convenzionaAziendaDOC(ArrayList<Object> args){
        System.out.println("Entro nel db");
        Connection connect = null;
	PreparedStatement preparedStatement = null;
	boolean success = true;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/internshiptutor",
					"root", "ciao");
            preparedStatement = connect.prepareStatement("UPDATE internshiptutor.azienda SET documento_convenzione= ? WHERE email_azienda= ? ");
            preparedStatement.setString(1, (String) args.get(0));
            preparedStatement.setString(2, (String) args.get(1));
            preparedStatement.executeUpdate();
            preparedStatement = connect.prepareStatement("UPDATE internshiptutor.azienda SET stato='convenzionata' WHERE email_azienda='"+args.get(1)+"'");
            preparedStatement.executeUpdate();
            System.out.println("L'Azienda è stata convenzionata!!");
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
                String descrizione = resultSet.getString("descrizione");
                String ambito = resultSet.getString("ambito");
                String documento_convenzione = resultSet.getString("documento_convenzione");
                String stato = resultSet.getString("stato");
                if(email_azienda.equals((String) args.get(0)) && pwd_azienda.equals((String) args.get(1)) && stato.equals("convenzionata")){
                    azienda = Azienda.setInstance(id, ragione_sociale, indirizzo, partita_iva,
                            codice_fiscale, nome_legale_rappr, cognome_legale_rappr, nome_responsabile,
                            cognome_responsabile, telefono_responsabile, email_responsabile, foro, 
                            email_azienda, pwd_azienda, descrizione, ambito, documento_convenzione, stato);
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
    
    public Object retrieveReg(ArrayList<Object> args) {
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
                String descrizione = resultSet.getString("descrizione");
                String ambito = resultSet.getString("ambito");
                String documento_convenzione = resultSet.getString("documento_convenzione");
                String stato = resultSet.getString("stato");
                if(email_azienda.equals((String) args.get(0))){
                    azienda = Azienda.setInstance(id, ragione_sociale, indirizzo, partita_iva,
                            codice_fiscale, nome_legale_rappr, cognome_legale_rappr, nome_responsabile,
                            cognome_responsabile, telefono_responsabile, email_responsabile, foro, 
                            email_azienda, pwd_azienda, descrizione, ambito, documento_convenzione, stato);
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
