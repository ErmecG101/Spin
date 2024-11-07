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
public class PagamentoDados {
    private int codigoPagamentoDados;
    private Usuario usuario;
    private String dadosCompra;
    private Date dtCriado;
    private Date dtAtualizado;

    public PagamentoDados() {
    }
    
    public int getCodigoPagamentoDados() {
        return codigoPagamentoDados;
    }

    public void setCodigoPagamentoDados(int codigoPagamentoDados) {
        this.codigoPagamentoDados = codigoPagamentoDados;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String getDadosCompra() {
        return dadosCompra;
    }

    public void setDadosCompra(String dadosCompra) {
        this.dadosCompra = dadosCompra;
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
