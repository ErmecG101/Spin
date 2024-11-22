<%-- 
    Document   : header_config
    Created on : Nov 7, 2024, 9:18:27 PM
    Author     : Otavio
--%>

<%@page import="dao.JogoDAO"%>
<%@page import="vo.Jogo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Base64"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="vo.Usuario"%>
<%@page import="vo.CompraCarrinho"%>
<%@page import="dao.CompraCarrinhoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    //Cookie[] cookies = request.getCookies();
    
    Usuario u = (Usuario) request.getSession(true).getAttribute("spin_user_logged_in_object");
//    if(cookies != null){
//        for(Cookie cookie : cookies){
//            if(cookie.getName().equals("spin_user_logged_in_object")){
//                u = new Gson().fromJson(new String(Base64.getDecoder().decode(cookie.getValue())), Usuario.class);
//            }
//        }
//    }
//    
    List<CompraCarrinho> itensCarrinho;
    if(u != null && u.getCodigoUsuario() > 0)
        itensCarrinho = new CompraCarrinhoDAO().selectAllByUser(u.getCodigoUsuario());
    else
        itensCarrinho = new ArrayList<>();
    session.setAttribute("itens_carrinho_spin", itensCarrinho);
    String uri;
    String pageName;
    String[] urlParts = request.getRequestURI().split("/");
    int siteHomePos = 0;
    for(int i = 0; i<urlParts.length; i++){
        if(urlParts[i].equals("Spin")){
            siteHomePos = i;
            break;
        }
    }
    StringBuilder pageUrl = new StringBuilder();
    for(int i = siteHomePos+1; i< urlParts.length; i++){
        pageUrl.append(urlParts[i]);
        if(i < urlParts.length-1)
            pageUrl.append("/");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Spin</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <nav class="navbar  fixed-top navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <!--<img alt="Logo" width="30" height="24" class="d-inline-block align-text-top" src="./icons/custom/Logo.png"/>-->
            <a class="navbar-brand" href="#">Spin</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 nav-underline">
                    <li class="nav-item">
                        <a class="nav-link <%
                                uri = request.getRequestURI();
                                pageName = uri.substring(uri.lastIndexOf("/")+1);
                                if(pageName.contains("index")){%> <%= "active" %> <%}%> aria-current="page" href="/Spin/index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%
                                uri = request.getRequestURI();
                                pageName = uri.substring(uri.lastIndexOf("/")+1);
                                if(pageName.contains("loja")){%> <%= "active" %> <%}%>" href="/Spin/telas/loja.jsp">Loja</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%
                                uri = request.getRequestURI();
                                pageName = uri.substring(uri.lastIndexOf("/")+1);
                                if(pageName.contains("biblioteca")){%> <%= "active" %> <%}%>" href="/Spin/telas/biblioteca.jsp">Biblioteca</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%
                                uri = request.getRequestURI();
                                pageName = uri.substring(uri.lastIndexOf("/")+1);
                                if(pageName.contains("configuracoes")){%> <%= "active" %> <%}%>" href="/Spin/telas/configuracoes.jsp">Configurações</a>
                    </li>
                </ul>
                    <form class="d-flex" method="GET" action="/Spin/telas/loja.jsp" role="search" style="margin-right: 10px;">
                        <input class="form-control me-2" type="search" id="search" name="search" placeholder="Search" aria-label="Search"
                               value="<%= request.getParameter("search") != null ? request.getParameter("search") : ""%>">
                        <button class="btn btn-outline-secondary" type="submit"><i class="bi bi-search"></i></button>
                    </form>
                    <label class="nav_text" style="font-size: 20px; margin-right: 10px">|</label>
                    <span class="nav_text dropdown" style="margin-right: 10px">
                    <button class="nav-link dropdown-toggle" id="bd-theme" data-bs-toggle="dropdown" type="button" >
                        <i class="bi" id="activeTheme"></i>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="bd-theme-text">
                        <li>
                            <button type="button" class="dropdown-item" onclick="setTheme('light')" data-bs-theme-value="light">
                                <i class="bi bi-sun-fill"></i>
                                Claro
                            </button>
                        </li>
                        <li>
                            <button type="button" class="dropdown-item" onclick="setTheme('dark')" data-bs-theme-value="dark">
                                <i class="bi bi-moon-fill"></i>
                                Escuro
                            </button>
                        </li>
                        <li>
                            <button type="button" class="dropdown-item" onclick="setTheme('auto')" data-bs-theme-value="dark">
                                <i class="bi bi-circle-half"></i>
                                Auto
                            </button>
                        </li>
                    </ul>
                </span>
                <span class="nav-text dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <!--<img src="/Spin/icons/material/account_circle_24dp_E8EAED.svg"/>-->
                            <i class="bi bi-person-circle" ></i>
                            <% if (u == null || u.getCodigoUsuario() == 0) {%>
                            Bem vindo, Convidado!
                            <%}else{  %>
                            <%= "Bem vindo, "+u.getNome() %>
                            <%} %>
                        </a>
                        <% if(u == null || u.getCodigoUsuario() == 0) {%>
                        <ul class="dropdown-menu dropdown-menu-lg-end">
                            <li><a class="dropdown-item" href="/Spin/telas/login.jsp">Sign-in</a></li>
                            <li><a class="dropdown-item" href="/Spin/telas/signup.jsp">Sign-up</a></li>
                        </ul>
                        <% }else{ %>
                        <ul class="dropdown-menu dropdown-menu-lg-end">
                            <li><a class="dropdown-item" href="/Spin/telas/configuracoes.jsp">Configurações</a></li>
                            <li><a class="dropdown-item disabled" href="./telas/login.jsp">Compras</a></li>
                            <li><a class="dropdown-item" href="/Spin/telas/biblioteca.jsp">Biblioteca</a></li>
                            <li><a class="dropdown-item" href="/Spin/telas/about.jsp">Sobre</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" id="logoff" href="/Spin/UsuarioController?acao=3">Log-off</a></li>
                        </ul>
                        <%}%>

                </span>
                        <span class="nav-text dropdown" style="margin-left: 10px">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                        <i class="bi bi-cart-fill"></i>
                        <span class="badge text-bg-primary rounded-pill"><%= itensCarrinho.size() %></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-lg-end" style="max-height: 400px; width: 400px; overflow-y: scroll;">
                            <% if (u == null || u.getCodigoUsuario() == 0) {%>
                            <li><a class="dropdown-item" href="/Spin/telas/login.jsp">Login necessário para listar items no seu carrinho</a></li>
                            <%}else{ 
                            if(!itensCarrinho.isEmpty()){
                            %>
                            <div class="list-group">
                            <%
                            for(CompraCarrinho item : itensCarrinho){
                                Jogo jogoCarrinho = new JogoDAO().selectOne(item.getJogo().getCodigoJogo());
                            %>
                            <form method="POST" action="/Spin/CompraCarrinhoController?acao=1">
                                <a class="list-group-item" aria-current="true">
                                    <div class="d-flex w-100 justify-content-between">
                                        <h5 class="mb-1"><%=jogoCarrinho.getNome() %></h5>
                                        <button class="btn" name="item_to_delete" value="<%= item.getCodigoCompraCarrinho() %>"><i class="bi bi-trash-fill"></i></button>
                                    </div>
                                    <p class="mb-1"><%= "R$ "+jogoCarrinho.getValor() %></p>
                                    <input type="hidden" name="url" value="<%= pageUrl.toString() %>"/>
                                    <small><%= "Desenvolvida por: "+jogoCarrinho.getDesenvolvedora() %></small>
                                </a>
                            </form>
                            <%}%>
                            </div>
                            <li><hr class="dropdown-divider"></li>
                            <li><span class="dropdown-item-text"><div class="row"><a class="btn" href="/Spin/telas/carrinho_detalhes.jsp">Ver Mais</a></div></span></li>
                            <%} else{ %>
                            <li><span class="dropdown-item-text">Nenhum item em seu carrinho!</span></li>
                            <%}} %>
                        </ul>
                </span>
            </div>
        </div>
    </nav>
    </head>
        <br>
        <br>
        <br>
    <div class="toast-container position-fixed bottom-0 end-0 p-3">
        <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header">
                <!--<img src="..." class="rounded me-2" id="toast-icon" alt="...">-->
                <strong class="me-auto" id="toast-status">Bootstrap</strong>
                <!--<small>11 mins ago</small>-->
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
                <div class="toast-body" id="toast-message">
                    Hello, world! This is a toast message.
                </div>
            </div>
        </div>
    
    <script type="text/javascript">
//            const toastTrigger = document.getElementById('liveToastBtn')
//            const toastLiveExample = document.getElementById('liveToast')
//
//            if (toastTrigger) {
//                const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample)
//                toastTrigger.addEventListener('click', () => {
//                toastBootstrap.show();
//            });
//        }
        window.onload = function(){
        var url_string = window.location.href;
        console.log(url_string);
        var url = new URL(url_string);
        console.log(url);
        var status = url.searchParams.get("status");
        console.log(status);
        var message = url.searchParams.get("message");
        console.log(message);
        if(status !== null && message !== null)
            showToast(status, message);
        else
            console.log("Sem Mensagens a exibir."); 
        
            setTheme(getPreferredTheme())
        }

        function showToast(status, message){
            const toastLiveExample = document.getElementById('liveToast');
            document.getElementById('toast-message').innerHTML = message;
            document.getElementById('toast-status').innerHTML = status;
            const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample);
            
            toastBootstrap.show();
        }
        

        const getStoredTheme = () => localStorage.getItem('theme')
        const setStoredTheme = theme => localStorage.setItem('theme', theme)

        const getPreferredTheme = () => {
          const storedTheme = getStoredTheme()
          if (storedTheme) {
            return storedTheme
          }

          return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'
        }

        const setTheme = theme => {
          if (theme === 'auto') {
            document.documentElement.setAttribute('data-bs-theme', (window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'))
          } else {
            document.documentElement.setAttribute('data-bs-theme', theme)
          }
          setStoredTheme(theme);

          toggleIcon(theme);


        }

        const toggleIcon = icon => {
             if(icon === 'light'){
                 if(document.getElementById('activeTheme').classList.contains('bi-moon-fill'))
                     document.getElementById('activeTheme').classList.toggle('bi-moon-fill');
                 if(!document.getElementById('activeTheme').classList.contains('bi-sun-fill'))
                     document.getElementById('activeTheme').classList.toggle('bi-sun-fill')        
          }else if(icon === "dark"){
                  if(!document.getElementById('activeTheme').classList.contains('bi-moon-fill'))
                     document.getElementById('activeTheme').classList.toggle('bi-moon-fill');
                 if(document.getElementById('activeTheme').classList.contains('bi-sun-fill'))
                     document.getElementById('activeTheme').classList.toggle('bi-sun-fill')
          }else{
              toggleIcon(window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light');
          }
        }
    </script>

</html>
