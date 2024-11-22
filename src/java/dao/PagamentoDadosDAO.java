/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.ArrayList;
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
        try{
            String sql = "delete from pagamentos_dados where codigo_pagamento_dados = ?";
            stmt = Conexao.getConexao().prepareStatement(sql);
            stmt.setInt(1, codigo);
            
            int result = stmt.executeUpdate();
            if(result <= 0)
                throw new SQLException("Ocorreu algum erro ao deletar o Pagamento Dados do banco (PagamentoDadosDAO.deleteOne():codigo: "+codigo+")");
            else
                System.out.println("Row deleted sucessfully");
        }finally{
            closeDb();
        }
    }

    @Override
    public void updateOne(PagamentoDados obj) throws SQLException, ClassNotFoundException {
        try{
            StringBuilder sql = new StringBuilder();
            sql.append("UPDATE `pagamentos_dados` SET `dados_compra`=?,`dt_atualizado`= now() WHERE codigo_pagamento_dados = ?");
            stmt = Conexao.getConexao().prepareStatement(sql.toString());
            stmt.setBytes(1, obj.getDadosCompra().getBytes(StandardCharsets.UTF_8));
            stmt.setInt(2, obj.getCodigoPagamentoDados());

            
            int result = stmt.executeUpdate();
            if(result <= 0)
                throw new SQLException("Erro ao atualizar um registro, nenhuma linha afetada");
            else if(result > 1)
                throw new SQLException("Mais de um registro atualizado, erro SQL");
            else
                System.out.println("Registro atualizado com sucesso!");
        }finally{
            closeDb();
        }
    }

    @Override
    public PagamentoDados selectOne(int codigo) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<PagamentoDados> selectAll() throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public List<PagamentoDados> selectAllByUser(int userId) throws SQLException, ClassNotFoundException{
        try{
            List<PagamentoDados> result = new ArrayList<>();
            
            String sql = "select * from pagamentos_dados where cod_usuario = ? ";
            stmt = Conexao.getConexao().prepareStatement(sql);
            stmt.setInt(1, userId);
            
            rs = stmt.executeQuery();
            while(rs.next())
                result.add(new PagamentoDados(rs));
            
            return result;
        }finally{
            closeDb();
        }
    }
    
}
