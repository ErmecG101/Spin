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
public class CompraCarrinho {
    private int codigoCompraCarrinho;
    private Jogo jogo;
    private Usuario usuario;

    public CompraCarrinho() {
    }
    
    public CompraCarrinho(ResultSet rs) throws SQLException{
        this.codigoCompraCarrinho = rs.getInt("codigo_compra_carrinho");
        this.jogo = new Jogo(rs.getInt("cod_jogo"));
        this.usuario = new Usuario(rs.getInt("cod_usuario"));
    }
    
    public int getCodigoCompraCarrinho() {
        return codigoCompraCarrinho;
    }

    public void setCodigoCompraCarrinho(int codigoCompraCarrinho) {
        this.codigoCompraCarrinho = codigoCompraCarrinho;
    }

    public Jogo getJogo() {
        return jogo;
    }

    public void setJogo(Jogo jogo) {
        this.jogo = jogo;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    @Override
    public String toString() {
        return "CompraCarrinho{" + "codigoCompraCarrinho=" + codigoCompraCarrinho + ", jogo=" + jogo + ", usuario=" + usuario + '}';
    }
    
    
}
