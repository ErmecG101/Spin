/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.PagamentoMetodo;
import dao.PagamentoMetodoDAO;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;

/**
 *
 * @author arman
 */
@WebServlet(name = "PagamentoMetodoController", urlPatterns = {"/PagamentoMetodoController"})
public class PagamentoMetodoController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int operacao = Integer.parseInt(request.getParameter("acao"));
            switch(operacao){
                case 1://InsertOne()
                    PagamentoMetodo pM = new PagamentoMetodo();
                    pM.setDescricao(request.getParameter("descricao"));
                    PagamentoMetodoDAO pMDao = new PagamentoMetodoDAO();
                    pMDao.insertOne(pM);
                    
//                    response.sendRedirect("./index.jsp?status=OK&message=Usuario cadastrado com sucesso!");
                    status = "OK";
                    message = "Método de pagamento cadastrado com sucesso!";
                    response.sendRedirect("./"+request.getParameter("url")+"?status="+URLEncoder.encode(status, StandardCharsets.UTF_8.toString())+"&message="+URLEncoder.encode(message, StandardCharsets.UTF_8.toString()));
                    break;
                default:
                    status = "Erro: Método de pagamento";
                    message = "Erro inesperado ocorreu: ACAO INVALIDA";
                    response.sendRedirect("./"+request.getParameter("url")+"?status="+URLEncoder.encode(status, StandardCharsets.UTF_8.toString())+"&message="+URLEncoder.encode(message, StandardCharsets.UTF_8.toString()));
                    break;
                        
            }
        }catch(SQLException e){
            e.printStackTrace(System.err);
            System.out.println("Erro ao tentar realizar uma operação SQL na requisição");
            status = "Erro: Metodo de pagamento";
            message = "Erro relacionado a SQL da operação (SQLException)";
            response.sendRedirect("./"+request.getParameter("url")+"?status="+URLEncoder.encode(status, StandardCharsets.UTF_8.toString())+"&message="+URLEncoder.encode(message, StandardCharsets.UTF_8.toString()));
        }catch(Exception e){
            e.printStackTrace(System.err);
            System.out.println("Erro Desconhecido!");
            status = "Erro: Metodo de pagamento";
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
