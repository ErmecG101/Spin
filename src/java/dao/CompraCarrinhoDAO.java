/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import service.Conexao;
import vo.CompraCarrinho;

/**
 *
 * @author Otavio
 */
public class CompraCarrinhoDAO extends DAOGenerics<CompraCarrinho>{

    @Override
    public void insertOne(CompraCarrinho obj) throws SQLException, ClassNotFoundException, IOException {
        try{
            String sql = "insert into compra_carrinho (cod_jogo, cod_usuario) values(?,?)";
            stmt = Conexao.getConexao().prepareStatement(sql);
            stmt.setInt(1,obj.getJogo().getCodigoJogo());
            stmt.setInt(2, obj.getUsuario().getCodigoUsuario());
            
            int result = stmt.executeUpdate();
            if(result <= 0)
                throw new SQLException("Erro ao inserir item no carrinho!");
            else
                System.out.println("Item inserido com sucesso no carrinho!");
        }finally{
            closeDb();
        }
    }

    @Override
    public void deleteOne(int codigo) throws SQLException, ClassNotFoundException {
        try{
            String sql = "delete from compra_carrinho where codigo_compra_carrinho = ?";
            stmt = Conexao.getConexao().prepareStatement(sql);
            stmt.setInt(1, codigo);
            
            int result = stmt.executeUpdate();
            if(result <= 0)
                throw new SQLException("Erro ao deletar o item do carrinho do cliente!");
            else
                System.out.println("Item deletado com sucesso do carrinho");
        }finally{
            closeDb();
        }
    }

    @Override
    public void updateOne(CompraCarrinho obj) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public CompraCarrinho selectOne(int codigo) throws SQLException, ClassNotFoundException {
        try{
            String sql = "select * from compra_carrinho where codigo_compra_carrinho = ?";
            stmt = Conexao.getConexao().prepareStatement(sql);
            stmt.setInt(1, codigo);
            
            rs = stmt.executeQuery();
            if(rs.next())
                return new CompraCarrinho(rs);
            else
                return null;
        }finally{
            closeDb();
        }
    }

    @Override
    public List<CompraCarrinho> selectAll() throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public List<CompraCarrinho> selectAllByUser(int idUser) throws SQLException, ClassNotFoundException {
        try{
            List<CompraCarrinho> result = new ArrayList<>();
            String sql = "select * from compra_carrinho where cod_usuario = ?";
            stmt = Conexao.getConexao().prepareStatement(sql);
            stmt.setInt(1, idUser);
            
            rs = stmt.executeQuery();
            while(rs.next())
                result.add(new CompraCarrinho(rs));
            
            return result;
            
        }finally{
            closeDb();
        }
    }
    
    public boolean alreadyInCart(int idUser, int idJogo) throws SQLException, ClassNotFoundException{
        try{
            String sql = "select * from compra_carrinho where cod_usuario = ? and cod_jogo = ?";
            stmt = Conexao.getConexao().prepareStatement(sql);
            stmt.setInt(1, idUser);
            stmt.setInt(2, idJogo);
            
            rs = stmt.executeQuery();
            return rs.next();
            
        }finally{
            closeDb();
        }
    }
    
}
