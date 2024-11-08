/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

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
    
    public abstract void insertOne(T obj) throws SQLException;
    public abstract void deleteOne(int codigo) throws SQLException;
    public abstract void updateOne(T obj) throws SQLException;
    public abstract T selectOne(int codigo) throws SQLException;
    public abstract List<T> selectAll() throws SQLException;
}
