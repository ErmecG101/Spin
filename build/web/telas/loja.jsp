<%-- 
    Document   : loja
    Created on : Nov 11, 2024, 8:12:55 PM
    Author     : Otavio
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="vo.CompraCarrinho"%>
<%@page import="java.util.HashMap"%>
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
    List<Jogo> list;
    if(request.getParameter("search") != null)
        list = jDao.selectAllBySearch(request.getParameter("search"));
    else
        list = jDao.selectAll();
    
    HashMap<Integer, Jogo> m = new HashMap<>();
    for( Jogo o1 : list ) {
        m.put(o1.getCodigoJogo(), o1);
    }

    List<Jogo> cartedJogos = new ArrayList<>();
    
    List<CompraCarrinho> itensCarrinho;
    if(session.getAttribute("itens_carrinho_spin") != null)
        itensCarrinho = (List<CompraCarrinho>) session.getAttribute("itens_carrinho_spin");
    else
        itensCarrinho = new ArrayList<>();
    
    for( CompraCarrinho o2 : itensCarrinho ) {
        Jogo o1 = m.get(o2.getJogo().getCodigoJogo());
    if( o1 != null ) {
        cartedJogos.add(o1);
    }
}
%>

<!DOCTYPE html>
<html>
    <jsp:include page="../generics/header_config.jsp"/>
    <body>
        <div class="container-fluid">
            <div class="row align-items-end">
                <div class="div_background col-md-0" style="">
<!--                    <label for="grid-list-size">Size:</label> <input onchange="resize()" type="range" max="100" min="0" value="50" class="form-range" id="grid-list-size" name="grid-list-size"/>
                    Modo: <div class="btn-group">
                        <a href="#" class="btn btn-outline-secondary active"><i class="bi bi-grid-fill"></i></a>
                        <a href="#" class="btn btn-outline-secondary"><i class="bi bi-view-list"></i></a>
                    </div><br>
                    TODO: IMPLEMENT FILTERS!-->
                </div> 
            <div class="col-md-12">
                <% if(!list.isEmpty()){
                    for(Jogo jogo : list){ %>
                    <a href="/Spin/telas/loja_detalhes.jsp?codigo_jogo=<%=jogo.getCodigoJogo()%>" class="img_action">
                        <div id="shopping_item" class="card bg-dark text-white img_holder">
                            <img id="shopping_item" src="data:image/gif;base64,<%= jogo.getCapa() %>" class="card-img img_holder_image" alt="...">
                            <% if(cartedJogos.contains(jogo)){ %>
                            <i style="background-color: rgba(0,0,255,.7); background-size: contain; width: fit-content; height: fit-content;
                               border-radius: 10%; margin: 8px" 
                               class="bi bi-cart-check-fill card-img-overlay"></i>
                            <% } %>
                            <div class="card-img-overlay img_text">
                                <h5 class="card-title"><%=jogo.getNome()%></h5>
                                <p class="card-text">Publicado por: <%=jogo.getPublicadoPor()%> </p>
                                <p class="card-text">R$ <%= String.format("%.2f",jogo.getValor()) %></p>
                            </div>
                        </div>
                    </a>
                  <%}}else{%>
                    <div class="mx-auto text-center">
                        <i class="bi bi-three-dots" style="font-size: 18rem;"></i>
                        <h3>Nenhum jogo encontrado</h3>
                    </div>
                  <%}%>
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
