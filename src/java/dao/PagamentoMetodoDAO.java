/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import service.Conexao;
import vo.PagamentoMetodo;

/**
 *
 * @author arman
 */
public class PagamentoMetodoDAO extends DAOGenerics<PagamentoMetodo> {

    @Override
    public void insertOne(PagamentoMetodo obj) throws SQLException, ClassNotFoundException, IOException {
        try{
        StringBuilder sql = new StringBuilder();
        
        sql.append("insert into pagamentos_metodos(descricao) ")
                .append("values(?)");
        
        stmt = Conexao.getConexao().prepareStatement(sql.toString());
        stmt.setString(1, obj.getDescricao());
        
        int result = stmt.executeUpdate();
        
        if(result <= 0)
            throw new SQLException("Erro ao inserir jogo no banco. (PagamentoMetodo.insertOne())");
        else
            System.out.println("Row added successfully!");
        }finally{
            closeDb();
        }
        
    }

    @Override
    public void deleteOne(int codigo) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void updateOne(PagamentoMetodo obj) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public PagamentoMetodo selectOne(int codigo) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<PagamentoMetodo> selectAll() throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
