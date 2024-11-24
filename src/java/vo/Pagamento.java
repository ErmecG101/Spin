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
public class Pagamento {
    private int codPagamento;
    private PagamentoMetodo pagamentoMetodo;
    private PagamentoDados pagamentoDados;
    private double valor;
    private Date dtCriado;
    private Date dtAtualizado;

    public Pagamento() {
    }

    public Pagamento(int codPagamento) {
        this.codPagamento = codPagamento;
    }
    
    public Pagamento(ResultSet rs) throws SQLException{
        this.codPagamento = rs.getInt("codigo_pagamento");
        this.pagamentoMetodo = new PagamentoMetodo(rs.getInt("cod_pagamento_metodo"));
        this.pagamentoDados = new PagamentoDados(rs.getInt("cod_pagamento_dados"));
        this.valor = rs.getDouble("valor");
        this.dtCriado = new Date(rs.getDate("dt_criado").getTime());
        this.dtAtualizado = new Date(rs.getDate("dt_atualizado").getTime());
    }
    
    public int getCodPagamento() {
        return codPagamento;
    }

    public void setCodPagamento(int codPagamento) {
        this.codPagamento = codPagamento;
    }

    public PagamentoMetodo getPagamentoMetodo() {
        return pagamentoMetodo;
    }

    public void setPagamentoMetodo(PagamentoMetodo pagamentoMetodo) {
        this.pagamentoMetodo = pagamentoMetodo;
    }

    public PagamentoDados getPagamentoDados() {
        return pagamentoDados;
    }

    public void setPagamentoDados(PagamentoDados pagamentoDados) {
        this.pagamentoDados = pagamentoDados;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
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
