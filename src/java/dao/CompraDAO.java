/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import service.Conexao;
import vo.Compra;
/**
 *
 * @author arman
 */
public class CompraDAO extends DAOGenerics<Compra>{

    public int insertOneWithReturn(Compra obj) throws SQLException, ClassNotFoundException, IOException{
        try{
            String sql = "insert into compras(cod_pagamento, dt_criado, dt_atualizado) values (?,now(),now())";
            stmt = Conexao.getConexao().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, obj.getPagamento().getCodPagamento());
            
            stmt.executeUpdate();
            rs = stmt.getGeneratedKeys();
            if(rs.next())
                return rs.getInt(1);
            return 0;
        }finally{
            closeDb();
        }
    }
    
    @Override
    public void insertOne(Compra obj) throws SQLException, ClassNotFoundException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void deleteOne(int codigo) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void updateOne(Compra obj) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Compra selectOne(int codigo) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Compra> selectAll() throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
