/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vo;

import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 *
 * @author arman
 */
public class Jogo {
    private int codigoJogo;
    private String nome;
    private double valor;
    private String publicadoPor;
    private String desenvolvedora;
    private Date dataLancamento;
    private String capa;
    private Date dtCriacao;
    private Date dtAtualizacao;

    public Jogo(int codigoJogo) {
        this.codigoJogo = codigoJogo;
    }
    
    public Jogo(ResultSet rs) throws SQLException{
        this.codigoJogo = rs.getInt("codigo_jogo");
        this.nome = rs.getString("nome");
        this.valor = rs.getDouble("valor");
        this.publicadoPor = rs.getString("publicadopor");
        this.desenvolvedora = rs.getString("desenvolvedora");
        this.dataLancamento = new Date(rs.getDate("data_de_lancamento").getTime());
        this.capa = rs.getString("capa");
        this.dtCriacao = new Date(rs.getDate("dt_criacao").getTime());
        this.dtAtualizacao = new Date(rs.getDate("dt_atualizacao").getTime());
    }

    
    
    public Jogo() {
    } 
    
    public int getCodigoJogo() {
        return codigoJogo;
    }

    public void setCodigoJogo(int codigoJogo) {
        this.codigoJogo = codigoJogo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public String getPublicadoPor() {
        return publicadoPor;
    }

    public void setPublicadoPor(String publicadoPor) {
        this.publicadoPor = publicadoPor;
    }

    public String getDesenvolvedora() {
        return desenvolvedora;
    }

    public void setDesenvolvedora(String desenvolvedora) {
        this.desenvolvedora = desenvolvedora;
    }

    public Date getDataLancamento() {
        return dataLancamento;
    }

    public void setDataLancamento(Date dataLancamento) {
        this.dataLancamento = dataLancamento;
    }

    public String getCapa() {
        return capa;
    }

    public void setCapa(String capa) {
        this.capa = capa;
    }

    public Date getDtCriacao() {
        return dtCriacao;
    }

    public void setDtCriacao(Date dtCriacao) {
        this.dtCriacao = dtCriacao;
    }

    public Date getDtAtualizacao() {
        return dtAtualizacao;
    }

    public void setDtAtualizacao(Date dtAtualizacao) {
        this.dtAtualizacao = dtAtualizacao;
    }

    @Override
    public String toString() {
        return "Jogo{" + "codigoJogo=" + codigoJogo + ", nome=" + nome + ", valor=" + valor + ", publicadoPor=" + publicadoPor + ", desenvolvedora=" + desenvolvedora + ", dataLancamento=" + dataLancamento + ", capa=" + capa + ", dtCriacao=" + dtCriacao + ", dtAtualizacao=" + dtAtualizacao + '}';
    }
    
    
}
