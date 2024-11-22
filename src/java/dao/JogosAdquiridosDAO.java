package dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import service.Conexao;
import vo.JogosAdquiridos;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author arman
 */
public class JogosAdquiridosDAO extends DAOGenerics<JogosAdquiridos>{

    @Override
    public void insertOne(JogosAdquiridos obj) throws SQLException, ClassNotFoundException, IOException {
        try{
            String sql = "insert into jogos_adquiridos(cod_jogo, cod_usuario) values(?,?)";
            stmt = Conexao.getConexao().prepareStatement(sql);
            stmt.setInt(1, obj.getJogo().getCodigoJogo());
            stmt.setInt(2, obj.getUsuario().getCodigoUsuario());
            
            int result = stmt.executeUpdate();
            if(result <= 0)
                throw new SQLException("Erro ao inserir JogoAdquirido.");
            else
                System.out.println("JogoAdquirido inserido com sucesso!");
        }finally{
            closeDb();
        }
    }

    @Override
    public void deleteOne(int codigo) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void updateOne(JogosAdquiridos obj) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public JogosAdquiridos selectOne(int codigo) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<JogosAdquiridos> selectAll() throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public List<JogosAdquiridos> selectAllByUser(int userId) throws SQLException, ClassNotFoundException{
        try{
            List<JogosAdquiridos> resultList = new ArrayList<>();
            String sql = "select * from jogos_adquiridos where cod_usuario = ?";
            stmt = Conexao.getConexao().prepareStatement(sql);
            stmt.setInt(1, userId);
            
            rs = stmt.executeQuery();
            while(rs.next())
                resultList.add(new JogosAdquiridos(rs));
            
            return resultList;
        }finally{
            closeDb();
        }
    }
    
    public boolean alreadyInLibrary(int userId, int jogoId) throws SQLException, ClassNotFoundException{
        try{
            String sql = "select * from jogos_adquiridos where cod_jogo = ? and cod_usuario = ?";
            stmt = Conexao.getConexao().prepareStatement(sql);
            stmt.setInt(1, jogoId);
            stmt.setInt(2, userId);
            
            rs = stmt.executeQuery();
            return rs.next();
        }finally{
            closeDb();
        }
    }
    
}
