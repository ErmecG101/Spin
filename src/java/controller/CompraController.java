/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CompraCarrinhoDAO;
import dao.CompraDAO;
import dao.JogoDAO;
import dao.JogosAdquiridosDAO;
import dao.LigCarrinhoCompraDAO;
import dao.PagamentoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.Compra;
import vo.Pagamento;
import vo.PagamentoDados;
import vo.PagamentoMetodo;
import vo.CompraCarrinho;
import vo.LigCarrinhoCompra;
import vo.Usuario;
import vo.Jogo;
import vo.JogosAdquiridos;
/**
 *
 * @author arman
 */
@WebServlet(name = "CompraController", urlPatterns = {"/CompraController"})
public class CompraController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String status = "";
        String message = "";
        Compra c;
        Pagamento pag;
        PagamentoDAO pagDao;
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            int operacao = Integer.parseInt(request.getParameter("acao"));
            switch (operacao) {
                case 1://Realizar compra
                    Usuario u = (Usuario) request.getSession(true).getAttribute("spin_user_logged_in_object");
                    pag = new Pagamento();
                    pagDao = new PagamentoDAO();
//                    if(request.getParameter("select_dados_pagamento") != null)
                    pag.setPagamentoDados(new PagamentoDados(Integer.parseInt(request.getParameter("select_dados_pagamento"))));
                    pag.setPagamentoMetodo(new PagamentoMetodo(Integer.parseInt(request.getParameter("metodo_pagamento"))));
                    List<CompraCarrinho> listItensCarrinho = new CompraCarrinhoDAO().selectAllByUser(u.getCodigoUsuario());
                    double valorTotal = 0;
                    for(CompraCarrinho item : listItensCarrinho){
                        valorTotal += new JogoDAO().selectOne(item.getJogo().getCodigoJogo()).getValor();
                    }
                    pag.setValor(valorTotal);
                    int codigoPagamento = pagDao.insertOneWithReturn(pag);
                    
                    c = new Compra();
                    c.setPagamento(new Pagamento(codigoPagamento));
                    
                    int codigoCompra = new CompraDAO().insertOneWithReturn(c);
                    List<LigCarrinhoCompra> listItensToSave = new ArrayList<>();
                    for(CompraCarrinho item : listItensCarrinho){
                        Jogo jogo =  new JogoDAO().selectOne(item.getJogo().getCodigoJogo());
                        LigCarrinhoCompra ligCarCom = new LigCarrinhoCompra();
                        ligCarCom.setCompra(new Compra(codigoCompra));
                        ligCarCom.setJogo(jogo);
                        listItensToSave.add(ligCarCom);
                    }
                    for(LigCarrinhoCompra ligCarrinhoCompra : listItensToSave){
                        new LigCarrinhoCompraDAO().insertOne(ligCarrinhoCompra);
                    }
                    for(CompraCarrinho item : listItensCarrinho){
                        JogosAdquiridos jogoAdq = new JogosAdquiridos();
                        jogoAdq.setJogo(item.getJogo());
                        jogoAdq.setUsuario(u);
                        new JogosAdquiridosDAO().insertOne(jogoAdq);
                        new CompraCarrinhoDAO().deleteOne(item.getCodigoCompraCarrinho());
                    }
                    
                    status = "OK";
                    message = "Compra realizada com sucesso!";
                    response.sendRedirect("./"+request.getParameter("url")+"?status="+URLEncoder.encode(status, StandardCharsets.UTF_8.toString())+"&message="+URLEncoder.encode(message, StandardCharsets.UTF_8.toString()));
                    
                    break;
                default:
                    throw new AssertionError();
            }
        }catch(SQLException e){
            e.printStackTrace(System.err);
            System.out.println("Erro ao tentar realizar uma operação SQL na requisição");
            status = "Erro: Compra";
            message = "Erro relacionado a SQL da operação (SQLException)";
            response.sendRedirect("./"+request.getParameter("url")+"?status="+URLEncoder.encode(status, StandardCharsets.UTF_8.toString())+"&message="+URLEncoder.encode(message, StandardCharsets.UTF_8.toString()));
        }catch(Exception e){
            e.printStackTrace(System.err);
            System.out.println("Erro Desconhecido!");
            status = "Erro: Compra";
            message = "Erro Desconhecido (Exception)";
            System.out.println("./"+request.getParameter("url")+"?status="+URLEncoder.encode(status, StandardCharsets.UTF_8.toString())+"&message="+URLEncoder.encode(message, StandardCharsets.UTF_8.toString()));
            response.sendRedirect("./"+request.getParameter("url")+"?status="+URLEncoder.encode(status, StandardCharsets.UTF_8.toString())+"&message="+URLEncoder.encode(message, StandardCharsets.UTF_8.toString()));
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
