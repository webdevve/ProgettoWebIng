/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.ArrayList;

/**
 *
 * @author Davide Simboli
 */
public interface DAOinterface {
    
    public boolean insert(ArrayList<Object> args);
	
    public Object retrieve(ArrayList<Object> args);
    
}
