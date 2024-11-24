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
import vo.Pagamento;

/**
 *
 * @author arman
 */
public class PagamentoDAO extends DAOGenerics<Pagamento>{

    public int insertOneWithReturn(Pagamento obj) throws SQLException, ClassNotFoundException, IOException{
        try{
            String sql = "insert into pagamentos(cod_pagamento_dados, cod_pagamento_metodo, dt_atualizado, dt_criado, valor) values (?,?,now(),now(),?)";
            stmt = Conexao.getConexao().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            if(obj.getPagamentoDados() != null)
                stmt.setInt(1, obj.getPagamentoDados().getCodigoPagamentoDados());
            else
                stmt.setInt(1, 0);
            stmt.setInt(2, obj.getPagamentoMetodo().getCodMetodoPagamento());
            stmt.setDouble(3, obj.getValor());
            
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
    public void insertOne(Pagamento obj) throws SQLException, ClassNotFoundException, IOException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void deleteOne(int codigo) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void updateOne(Pagamento obj) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Pagamento selectOne(int codigo) throws SQLException, ClassNotFoundException {
        try{
            String sql = "select * from pagamentos where codigo_pagamento = ?";
            stmt = Conexao.getConexao().prepareStatement(sql);
            stmt.setInt(1, codigo);
            
            rs = stmt.executeQuery();
            if(rs.next())
                return new Pagamento(rs);
            else
                return null;
        }finally{
            closeDb();
        }
    }

    @Override
    public List<Pagamento> selectAll() throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
