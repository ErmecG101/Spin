/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 *
 * @author arman
 */
public class Usuario {
    private int CodigoUsuario;
    private String nome;
    private transient String senha;
    private String email;
    private Date dtNasc;
    private Date dtCriado;
    private Date dtAtualizado;

    public Usuario() {
    }

    public Usuario(int CodigoUsuario) {
        this.CodigoUsuario = CodigoUsuario;
    }
    
    
    
    public Usuario(ResultSet rs) throws SQLException{
        this.CodigoUsuario = rs.getInt("codigo_usuario");
        this.nome = rs.getString("nome");
        this.senha = rs.getString("senha");
        this.email = rs.getString("email");
        this.dtNasc = new Date(rs.getDate("dt_nasc").getTime());
        this.dtCriado = new Date(rs.getDate("dt_criado").getTime());
        this.dtAtualizado = new Date(rs.getDate("dt_atualizado").getTime());
    }
    

    public int getCodigoUsuario() {
        return CodigoUsuario;
    }

    public void setCodigoUsuario(int CodigoUsuario) {
        this.CodigoUsuario = CodigoUsuario;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDtNasc() {
        return dtNasc;
    }

    public void setDtNasc(Date dtNasc) {
        this.dtNasc = dtNasc;
    }

    public Date getDtCriado() {
        return dtCriado;
    }

    public void setDtCriado(Date dtCriado) {
        this.dtCriado = dtCriado;
    }

    public Date getDtAtualizado() {
        return dtAtualizado;
    }

    public void setDtAtualizado(Date dtAtualizado) {
        this.dtAtualizado = dtAtualizado;
    }
    
    
}
