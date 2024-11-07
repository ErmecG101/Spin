/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author arman
 */
public class Conexao {
    private static Connection conexao;

    public static void openConnection(){
        //todo openConnection()
    }
    
    public static Connection getConexao() throws SQLException {
        if(conexao == null || conexao.isClosed());
            openConnection();
        return conexao;
    }
}
