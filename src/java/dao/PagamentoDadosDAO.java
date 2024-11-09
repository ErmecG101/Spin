/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import service.Conexao;
import vo.PagamentoDados;

/**
 *
 * @author arman
 */
public class PagamentoDadosDAO extends DAOGenerics<PagamentoDados> {

    @Override
    public void insertOne(PagamentoDados obj) throws SQLException, ClassNotFoundException, IOException {
        try{
            StringBuilder sql = new StringBuilder();
        sql.append("insert into pagamentos_dados(cod_usuario, dados_compra,dt_criado, dt_atualizado)")
                .append(" values(?,?,now(),now())");
        stmt = Conexao.getConexao().prepareStatement(sql.toString());
        
        stmt.setInt(1, obj.getUsuario().getCodigoUsuario());
        stmt.setString(2, obj.getDadosCompra());
        
        int result = stmt.executeUpdate();
        
        if(result <= 0)
            throw new SQLException("Erro ao inserir PagamentoDados no banco. (PagamentoDadosDAO.insertOne())");
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
    public void updateOne(PagamentoDados obj) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public PagamentoDados selectOne(int codigo) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<PagamentoDados> selectAll() throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
