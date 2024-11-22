/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vo;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author arman
 */
public class JogosAdquiridos {
    private int codigoJogosAdquiridos;
    private Usuario usuario;
    private Jogo jogo;

    public JogosAdquiridos(ResultSet rs) throws SQLException{
        this.codigoJogosAdquiridos = rs.getInt("codigo_jogos_adiquiridos");
        this.usuario = new Usuario(rs.getInt("cod_usuario"));
        this.jogo = new Jogo(rs.getInt("cod_jogo"));
    }
    
    public JogosAdquiridos() {
    }

    public int getCodigoJogosAdquiridos() {
        return codigoJogosAdquiridos;
    }

    public void setCodigoJogosAdquiridos(int codigoJogosAdquiridos) {
        this.codigoJogosAdquiridos = codigoJogosAdquiridos;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Jogo getJogo() {
        return jogo;
    }

    public void setJogo(Jogo jogo) {
        this.jogo = jogo;
    }
    
    
}
