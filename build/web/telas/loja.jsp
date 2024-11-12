<%-- 
    Document   : loja
    Created on : Nov 11, 2024, 8:12:55 PM
    Author     : Otavio
--%>

<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.util.Base64"%>
<%@page import="vo.Jogo"%>
<%@page import="dao.JogoDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 

    
    JogoDAO jDao = new JogoDAO();
    List<Jogo> list = jDao.selectAll();
%>

<!DOCTYPE html>
<html>
    <jsp:include page="../generics/header_config.jsp"/>
    <body>
        <div class="container-fluid">
            <div class="row align-items-end">
                <div class="div_background col-md-2" style="">
                    <label for="grid-list-size">Size:</label> <input onchange="resize()" type="range" max="100" min="0" value="50" class="form-range" id="grid-list-size" name="grid-list-size"/>
                    Modo: <div class="btn-group">
                        <a href="#" class="btn btn-outline-secondary active"><i class="bi bi-grid-fill"></i></a>
                        <a href="#" class="btn btn-outline-secondary"><i class="bi bi-view-list"></i></a>
                    </div><br>
                    TODO: IMPLEMENT FILTERS!
                </div> 
            <div class="col-md-10">
                <% for(Jogo jogo : list){ %>
                    <a href="/Spin/telas/loja_detalhes.jsp?codigo_jogo=<%=jogo.getCodigoJogo()%>" class="img_action">
                        <div id="shopping_item" class="card bg-dark text-white img_holder">
                            <img id="shopping_item" src="data:image/gif;base64,<%= jogo.getCapa() %>" class="card-img img_holder_image" alt="...">
                            <div class="card-img-overlay img_text">
                                <h5 class="card-title"><%=jogo.getNome()%></h5>
                                <p class="card-text">Publicado por: <%=jogo.getPublicadoPor()%> </p>
                                <p class="card-text">R$ <%= String.format("%.2f",jogo.getValor()) %></p>
                            </div>
                        </div>
                    </a>
                  <%}%>
                    <a href="#" class="img_action">
                <div class="card bg-dark text-white img_holder">
                    <img src="../icons/temp/ready_or_not.jpg" class="card-img img_holder_image" alt="...">
                    <div class="card-img-overlay img_text">
                      <h5 class="card-title">Ready Or Not</h5>
                      <p class="card-text">Publicado por: </p>
                      <p class="card-text">R$ 89,90</p>
                    </div>
                  </div>
            </a>
            </div>
            </div>
        </div>
    </body>
    
    <style>
        
        .div_background{
            background-color: rgba(125,125,125,.2) ;
            border-radius: 8px;
            display: inline-block; vertical-align: top; margin: 0
        }
        
        .img_holder{
            height: 300px;
            width: 300px;
            transition: all 100ms ease-in;
        }
        
        .img_holder:hover{
            transform: scale(1.03);
        }
        
        .img_action{
            width: fit-content;
            transition: all 100ms ease-in;
            display: inline-block
        }
        
        .img_action:active .img_holder{
            transform: scale(.98);
        }
        
        .img_holder_image{
                        height: 300px;
            width: 300px;
            transition: all 100ms ease-in;
            object-fit: cover;
        }
        
        .img_holder:hover .img_holder_image{
            filter: blur(3px);
        }
        
        .img_text {
            background-color: rgba(0,0,0,.70);
            transition: all 100ms ease-in;
            opacity: 0;
        }
        
        .img_holder:hover .img_text{
            opacity: 1;
        }
        
    </style>
</html>
