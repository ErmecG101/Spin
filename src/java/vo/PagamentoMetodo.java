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
public class PagamentoMetodo {
    private int codMetodoPagamento;
    private String descricao;

    public PagamentoMetodo() {
    }

    public PagamentoMetodo(int codMetodoPagamento) {
        this.codMetodoPagamento = codMetodoPagamento;
    }
    
    
    
    public PagamentoMetodo(ResultSet rs) throws SQLException {
        this.codMetodoPagamento = rs.getInt("cod_metodo_pagamento");
        this.descricao = rs.getString("descricao");
    }
    
    public int getCodMetodoPagamento() {
        return codMetodoPagamento;
    }

    public void setCodMetodoPagamento(int codMetodoPagamento) {
        this.codMetodoPagamento = codMetodoPagamento;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
    
}
