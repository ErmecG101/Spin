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
public class PagamentoDados {
    private int codigoPagamentoDados;
    private Usuario usuario;
    private String dadosCompra;
    private Date dtCriado;
    private Date dtAtualizado;

    public PagamentoDados() {
    }

    public PagamentoDados(int codigoPagamentoDados) {
        this.codigoPagamentoDados = codigoPagamentoDados;
    }
    
    
    
    public PagamentoDados(ResultSet rs) throws SQLException {
        this.codigoPagamentoDados = rs.getInt("codigo_pagamento_dados");
        this.usuario = new Usuario(rs.getInt("cod_usuario"));
        this.dadosCompra = rs.getString("dados_compra");
        this.dtAtualizado = new Date(rs.getDate("dt_atualizado").getTime());
        this.dtCriado = new Date(rs.getDate("dt_criado").getTime());
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
