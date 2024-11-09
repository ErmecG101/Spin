/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import service.Conexao;
import vo.Usuario;

/**
 *
 * @author arman
 */
public class UsuarioDAO extends DAOGenerics<Usuario>{

    @Override
    public void insertOne(Usuario obj) throws SQLException, ClassNotFoundException{
        try{
            StringBuilder sql = new StringBuilder();
            sql.append("insert into usuario(nome, senha,")
            .append("email, dt_nasc, dt_criado, dt_atualizado) values")
            .append("(?, sha1(?), ?, ?, now(), now())");
            stmt = Conexao.getConexao().prepareStatement(sql.toString());
            stmt.setString(1, obj.getNome());
            stmt.setString(2, obj.getSenha());
            stmt.setString(3, obj.getEmail());
            stmt.setDate(4, new Date(obj.getDtNasc().getTime()));
            
            int result = stmt.executeUpdate();
            if(result <= 0)
                throw new SQLException("Insert executed but no rows returned. (Usuario.insertOne)");
            else
                System.out.println("Row added successfully!");
            
        }catch(Exception e){
            e.printStackTrace(System.err);
            System.out.println("Unknown Error: insertOneUser ");
        }finally{
            closeDb();
        }
    }

    @Override
    public void deleteOne(int codigo) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void updateOne(Usuario obj) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Usuario selectOne(int codigo) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<Usuario> selectAll() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
