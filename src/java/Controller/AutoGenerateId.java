/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import db.DB_Handler;
import java.net.MalformedURLException;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import javax.swing.JTextField;

/**
 *
 * @author hp pc
 */
public class AutoGenerateId {
    public static String autoGenerateId(String table, String prefix, String idColumn) throws ClassNotFoundException, SQLException{
        String lastID = null;
        Connection connection = db.DB_Connection.getDBConnection().getConnection();
        String sql = "SELECT "+idColumn+" FROM "+table+" order by "+idColumn+" desc limit 1";
        ResultSet resultSet = DB_Handler.getData(connection, sql);
        if(resultSet.next()){
            lastID = resultSet.getString(idColumn);
        }
        
        if (lastID == null) {
            lastID = prefix + "000";
        }

        String[] newID = lastID.split(prefix);
        int number = Integer.parseInt(newID[1]);
        ++number;

        NumberFormat nf = NumberFormat.getInstance();
        nf.setMinimumIntegerDigits(4);
        String Value = nf.format(number);
        String[] ID = Value.split(",");
        return prefix + ID[0] + ID[1];
    }
}
