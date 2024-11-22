/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import service.Conexao;
import vo.LigCarrinhoCompra;
/**
 *
 * @author arman
 */
public class LigCarrinhoCompraDAO extends DAOGenerics<LigCarrinhoCompra>{

    @Override
    public void insertOne(LigCarrinhoCompra obj) throws SQLException, ClassNotFoundException, IOException {
        try{
            String sql = "insert into lig_carrinho_compra(cod_jogo, cod_compra) values (?, ?)";
            stmt = Conexao.getConexao().prepareStatement(sql);
            stmt.setInt(1, obj.getJogo().getCodigoJogo());
            stmt.setInt(2, obj.getCompra().getCodigoCompra());
            
            int result = stmt.executeUpdate();
            if(result <= 0)
                throw new SQLException("Erro ao inserir ligação entre item da compra e a compra");
            else
                System.out.println("Ligação inserida com sucesso");
        }finally{
            closeDb();
        }
    }

    @Override
    public void deleteOne(int codigo) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void updateOne(LigCarrinhoCompra obj) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public LigCarrinhoCompra selectOne(int codigo) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<LigCarrinhoCompra> selectAll() throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
