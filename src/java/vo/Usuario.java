/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vo;

import java.util.Date;

/**
 *
 * @author arman
 */
public class Usuario {
    private int CodigoUsuario;
    private String nome;
    private String senha;
    private String email;
    private Date dtNasc;
    private Date dtCriado;
    private Date dtAtualizado;

    public Usuario() {
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
