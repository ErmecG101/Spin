/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;


import java.io.IOException;
import java.nio.file.Files;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import service.Conexao;
import vo.Jogo;
/**
 *
 * @author arman
 */
public class JogoDAO extends DAOGenerics<Jogo>{

    @Override
    public void insertOne(Jogo obj) throws SQLException, ClassNotFoundException, IOException{
        try{
            StringBuilder sql = new StringBuilder();
        sql.append("insert into jogos(nome, valor, publicadopor, desenvolvedora, data_de_lancamento, capa, dt_atualizacao, dt_criacao) values")
                .append(" (?,?,?,?,?,?, now(), now());");
        
        stmt = Conexao.getConexao().prepareStatement(sql.toString());
        stmt.setString(1, obj.getNome());
        stmt.setDouble(2, obj.getValor());
        stmt.setString(3, obj.getPublicadoPor());
        stmt.setString(4, obj.getDesenvolvedora());
        stmt.setDate(5, new Date(obj.getDataLancamento().getTime()));
        stmt.setString(6, obj.getCapa());
        
        int result = stmt.executeUpdate();
        if(result <= 0)
            throw new SQLException("Erro ao inserir jogo no banco. (Jogo.insertOne())");
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
    public void updateOne(Jogo obj) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Jogo selectOne(int codigo) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Jogo> selectAll() throws SQLException, ClassNotFoundException {
        try{
            List<Jogo> list = new ArrayList<>();
            String sql = "select * from jogos";
            stmt = Conexao.getConexao().prepareStatement(sql);
            
            rs = stmt.executeQuery();
            
            while(rs.next()){
                list.add(new Jogo(rs));
            }
            
            return list;
        }finally{
            closeDb();
        }
    }
    
}
