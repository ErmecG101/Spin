<%-- 
    Document   : loja_detalhes
    Created on : 12 de nov. de 2024, 01:52:48
    Author     : arman
--%>

<%@page import="dao.JogoDAO"%>
<%@page import="vo.Jogo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    JogoDAO jDao = new JogoDAO();
    Jogo jogo;
    if(request.getParameter("codigo_jogo") != null && !request.getParameter("codigo_jogo").isEmpty()){
        jogo = jDao.selectOne(Integer.parseInt(request.getParameter("codigo_jogo")));
    }else{
        jogo = null;
    }
%>

<!DOCTYPE html>
<html>
    <jsp:include page="../generics/header_config.jsp"/>
    <body>
        <% if(jogo != null){ %>
        <form method="POST" action="/Spin/JogoController?acao=2">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-4">
                        <img id="shopping_item" src="data:image/gif;base64,<%= jogo.getCapa() %>" class="capa-jogo" alt="...">
                    </div>
                    <div class="col-md-8">
                        <h1><%= jogo.getNome() %></h1>
                        <h3>Publicado por: <%= jogo.getPublicadoPor() %></h3>
                        <h3>Desenvolvedora <%= jogo.getDesenvolvedora()%></h3>
                        <button type="submit" class="btn btn-primary" value="<%= jogo.getCodigoJogo() %>" name="action_add_jogo" id="action_add_jogo"><h1>Adicionar ao Carrinho</h1></button>
                    </div>
                </div>
            </div>
        </form>
        <%} else { %>
        <div class="mx-auto text-center">
            <i class="bi bi-question-circle-fill" style="font-size: 18rem;"></i>
            <h3>Ops! ocorreu um erro ao tentar carregar a página!</h3>
        </div>
        <%}%>
    </body>
    
    <style>
        .capa-jogo{
            height: 500px;
            width: 500px;
            object-fit: cover;
        }
    </style>
</html>
