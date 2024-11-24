<%-- 
    Document   : biblioteca
    Created on : 22 de nov. de 2024, 01:18:41
    Author     : arman
--%>

<%@page import="vo.Jogo"%>
<%@page import="dao.JogoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Usuario"%>
<%@page import="dao.JogosAdquiridosDAO"%>
<%@page import="java.util.List"%>
<%@page import="vo.JogosAdquiridos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%     Usuario u = (Usuario) request.getSession(true).getAttribute("spin_user_logged_in_object");

    List<JogosAdquiridos> listJgAdquiridos;
    if(u != null){
        listJgAdquiridos = new JogosAdquiridosDAO().selectAllByUser(u.getCodigoUsuario());
    }else{
        listJgAdquiridos = new ArrayList<>();
    }%>

<!DOCTYPE html>
<html>
    <jsp:include page="../generics/header_config.jsp"/>
    <body>
        <% if(u == null){%>
        <div class="mx-auto text-center">
            <i class="bi bi-question-circle-fill" style="font-size: 12rem"></i>
            <h1>Atenção!</h1>
            <h2>Você não está logado, para acessarmos sua biblioteca um login é necessário<br><a href="/Spin/telas/login.jsp?backurl=telas/biblioteca.jsp">Clique Aqui!</a> para realizar seu login.</h2>
        </div>
        <% }else if(listJgAdquiridos.isEmpty()){ %>
        <div class="mx-auto text-center">
            <i class="bi bi-exclamation-circle-fill" style="font-size: 12rem"></i>
            <h1>Atenção!</h1>
            <h2>Você não possui jogos na sua conta, compre jogos na aba <a href="/Spin/telas/loja.jsp">Loja</a></h2>
        </div>
        <%}else{%>
        <div class="container-fluid">
            <h1>Jogos Adquiridos:</h1><br><br>
            <%for(JogosAdquiridos jgAdquiridos : listJgAdquiridos){
            Jogo jogo = new JogoDAO().selectOne(jgAdquiridos.getJogo().getCodigoJogo());%>
            <a class="img_action">
                        <div id="shopping_item" class="card bg-dark text-white img_holder">
                            <img id="shopping_item" src="data:image/gif;base64,<%= jogo.getCapa() %>" class="card-img img_holder_image" alt="...">
                            <div class="card-img-overlay img_text">
                                <h5 class="card-title"><%=jogo.getNome()%></h5>
                                <p class="card-text">Publicado por: <%=jogo.getPublicadoPor()%> </p>
                                <p class="card-text">R$ <%= String.format("%.2f",jogo.getValor()) %></p>
                            </div>
                        </div>
                    </a>
            
             <%}}%>
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
        
/*        .img_action:active .img_holder{
            transform: scale(.98);
        }*/
        
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
