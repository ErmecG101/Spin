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
import vo.CompraCarrinho;
import vo.Usuario;
import dao.CompraCarrinhoDAO;
import dao.JogosAdquiridosDAO;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
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
                    response.sendRedirect("./"+request.getParameter("url")+"?status="+URLEncoder.encode(status, StandardCharsets.UTF_8.toString())+"&message="+URLEncoder.encode(message, StandardCharsets.UTF_8.toString()));
                    break;
                case 2://Add To Cart()
                    Jogo jogo = new JogoDAO().selectOne(Integer.parseInt(request.getParameter("action_add_jogo")));
                    CompraCarrinho cc = new CompraCarrinho();
                    cc.setCodigoCompraCarrinho(0);
                    cc.setJogo(jogo);
                    Usuario u = (Usuario) request.getSession().getAttribute("spin_user_logged_in_object");
                    if(u == null || u.getCodigoUsuario() <= 0){
                        status = "Aviso!";
                        message = "É necessário um login para adicionar o jogo ao carrinho.";
                        response.sendRedirect("./telas/login.jsp?status="+URLEncoder.encode(status, StandardCharsets.UTF_8.toString())+"&message="+URLEncoder.encode(message, StandardCharsets.UTF_8.toString())+"&backurl=./telas/loja_detalhes.jsp?codigo_jogo="+jogo.getCodigoJogo());
                        break;
                    }
                    cc.setUsuario(u);
                    CompraCarrinhoDAO ccDao = new CompraCarrinhoDAO();
                    if(ccDao.alreadyInCart(u.getCodigoUsuario(), jogo.getCodigoJogo())){
                        status="Alerta";
                        message="Jogo já no seu carrinho.";
                        response.sendRedirect("./telas/loja_detalhes.jsp?codigo_jogo="+jogo.getCodigoJogo()+"&status="+URLEncoder.encode(status, StandardCharsets.UTF_8.toString())+"&message="+URLEncoder.encode(message, StandardCharsets.UTF_8.toString()));
                        break;
                    }
                    if(new JogosAdquiridosDAO().alreadyInLibrary(u.getCodigoUsuario(), jogo.getCodigoJogo())){
                        status="Alerta";
                        message="Jogo já está na sua biblioteca.";
                        response.sendRedirect("./telas/loja_detalhes.jsp?codigo_jogo="+jogo.getCodigoJogo()+"&status="+URLEncoder.encode(status, StandardCharsets.UTF_8.toString())+"&message="+URLEncoder.encode(message, StandardCharsets.UTF_8.toString()));
                        break;
                    }
                    ccDao.insertOne(cc);
                    List<CompraCarrinho> itensCarrinho = new CompraCarrinhoDAO().selectAllByUser(u.getCodigoUsuario());
                    request.getSession().setAttribute("itens_carrinho_spin", itensCarrinho);
                    status="OK";
                    message="Item adicionado no carrinho com sucesso!";
                    response.sendRedirect("./telas/loja.jsp?status="+URLEncoder.encode(status, StandardCharsets.UTF_8.toString())+"&message="+URLEncoder.encode(message, StandardCharsets.UTF_8.toString()));
                    break;
                default:
                    status = "Erro: Inserir Jogo";
                    message = "Erro inesperado ocorreu: ACAO INVALIDA";
                    response.sendRedirect("./"+request.getParameter("url")+"?status="+URLEncoder.encode(status, StandardCharsets.UTF_8.toString())+"&message="+URLEncoder.encode(message, StandardCharsets.UTF_8.toString()));
                    break;
                        
            }
        }catch(SQLException e){
            e.printStackTrace(System.err);
            System.out.println("Erro ao tentar realizar uma operação SQL na requisição");
            status = "Erro: Inserir Jogo";
            message = "Erro relacionado a SQL da operação (SQLException)";
            response.sendRedirect("./"+request.getParameter("url")+"?status="+URLEncoder.encode(status, StandardCharsets.UTF_8.toString())+"&message="+URLEncoder.encode(message, StandardCharsets.UTF_8.toString()));
        }catch(ParseException e){
            e.printStackTrace(System.err);
            System.out.println("Erro data mal formatada!");
            status = "Erro: Inserir Jogo";
            message = "Erro relacionado a data, data mal formatada! (ParseException)";
            System.out.println("./"+request.getParameter("url")+"?status="+URLEncoder.encode(status, StandardCharsets.UTF_8.toString())+"&message="+URLEncoder.encode(message, StandardCharsets.UTF_8.toString()));
            response.sendRedirect("./"+request.getParameter("url")+"?status="+URLEncoder.encode(status, StandardCharsets.UTF_8.toString())+"&message="+URLEncoder.encode(message, StandardCharsets.UTF_8.toString()));
        }catch(Exception e){
            e.printStackTrace(System.err);
            System.out.println("Erro Desconhecido!");
            status = "Erro: Inserir Jogo";
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
