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
public class Compra {
    private int codigoCompra;
    private Pagamento pagamento;
    private Date dataCriado;
    private Date dataAtualizado;

    public Compra() {
    }

    public Compra(int codigoCompra) {
        this.codigoCompra = codigoCompra;
    }
    
    
    
    public int getCodigoCompra() {
        return codigoCompra;
    }

    public void setCodigoCompra(int codigoCompra) {
        this.codigoCompra = codigoCompra;
    }

    public Pagamento getPagamento() {
        return pagamento;
    }

    public void setPagamento(Pagamento pagamento) {
        this.pagamento = pagamento;
    }

    public Date getDataCriado() {
        return dataCriado;
    }

    public void setDataCriado(Date dataCriado) {
        this.dataCriado = dataCriado;
    }

    public Date getDataAtualizado() {
        return dataAtualizado;
    }

    public void setDataAtualizado(Date dataAtualizado) {
        this.dataAtualizado = dataAtualizado;
    }
    
   
}
