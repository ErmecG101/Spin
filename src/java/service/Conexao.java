/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.JDBCType;
import java.sql.SQLException;

/**
 *
 * @author arman
 */
public class Conexao {
    private static Connection conexao;

    public static void openConnection() throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        conexao = DriverManager.getConnection("jdbc:mysql://localhost/spin", "root", "");
    }
    
    public static Connection getConexao() throws SQLException, ClassNotFoundException {
        if(conexao == null || conexao.isClosed());
            openConnection();
        return conexao;
    }
}
