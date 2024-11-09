/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author arman
 */
public abstract class DAOGenerics<T> {
    protected ResultSet rs;
    protected PreparedStatement stmt;
    
    public abstract void insertOne(T obj) throws SQLException, ClassNotFoundException, IOException;
    public abstract void deleteOne(int codigo) throws SQLException, ClassNotFoundException;
    public abstract void updateOne(T obj) throws SQLException, ClassNotFoundException;
    public abstract T selectOne(int codigo) throws SQLException, ClassNotFoundException;
    public abstract List<T> selectAll() throws SQLException, ClassNotFoundException;
    
    protected void closeDb() throws SQLException{
        if(rs != null && !rs.isClosed()){
            rs.close();
            rs = null;
        }
        if(stmt != null && !stmt.isClosed()){
            stmt.close();
            stmt = null;
        }
    }
}
