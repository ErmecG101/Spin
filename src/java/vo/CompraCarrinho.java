/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vo;

/**
 *
 * @author arman
 */
public class CompraCarrinho {
    private int codigoCompraCarrinho;
    private Jogo jogo;
    private Usuario usuario;
    private Compra compra;

    public CompraCarrinho() {
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

    public Compra getCompra() {
        return compra;
    }

    public void setCompra(Compra compra) {
        this.compra = compra;
    }
    
    
}
