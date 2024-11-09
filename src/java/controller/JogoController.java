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

import vo.Jogo;
import dao.JogoDAO;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
/**
 *
 * @author Otavio
 */
@WebServlet(name = "JogoController", urlPatterns = {"/JogoController"})
public class JogoController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            int operacao = Integer.parseInt(request.getParameter("acao"));
            switch(operacao){
                case 1://InsertOne()
                    Jogo j = new Jogo();
                    j.setNome(request.getParameter("nome"));
                    j.setValor(Double.parseDouble(request.getParameter("valor")));
                    j.setPublicadoPor(request.getParameter("publicadopor"));
                    j.setDesenvolvedora(request.getParameter("desenvolvedora"));
                    j.setCapa(request.getParameter("capaBase64"));
                    //todo find a way to send data in String.
                    j.setDataLancamento(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dataLanc")));
                    JogoDAO jDao = new JogoDAO();
                    jDao.insertOne(j);
                    
//                    response.sendRedirect("./index.jsp?status=OK&message=Usuario cadastrado com sucesso!");
                    status="OK";
                    message="Jogo inserido com sucesso!";
                    response.sendRedirect("./"+request.getParameter("url")+"?status="+status+"&message="+message);
                    break;
                default:
                    status = "Erro: Inserir Jogo";
                    message = "Erro inesperado ocorreu: ACAO INVALIDA";
                    response.sendRedirect("./"+request.getParameter("url")+"?status="+status+"&message="+message);
                    break;
                        
            }
        }catch(SQLException e){
            e.printStackTrace(System.err);
            System.out.println("Erro ao tentar realizar uma operação SQL na requisição");
            status = "Erro: Inserir Jogo";
            message = "Erro relacionado a SQL da operação (SQLException)";
            response.sendRedirect("./"+request.getParameter("url")+"?status="+status+"&message="+message);
        }catch(ParseException e){
            e.printStackTrace(System.err);
            System.out.println("Erro data mal formatada!");
            status = "Erro: Inserir Jogo";
            message = "Erro relacionado a data, data mal formatada! (ParseException)";
            System.out.println("./"+request.getParameter("url")+"?status="+status+"&message="+message);
            response.sendRedirect("./"+request.getParameter("url")+"?status="+status+"&message="+message);
        }catch(Exception e){
            e.printStackTrace(System.err);
            System.out.println("Erro Desconhecido!");
            status = "Erro: Inserir Jogo";
            message = "Erro Desconhecido (Exception)";
            System.out.println("./"+request.getParameter("url")+"?status="+status+"&message="+message);
            response.sendRedirect("./"+request.getParameter("url")+"?status="+status+"&message="+message);
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
