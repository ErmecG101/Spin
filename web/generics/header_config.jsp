<%-- 
    Document   : header_config
    Created on : Nov 7, 2024, 9:18:27 PM
    Author     : Otavio
--%>

<%@page import="java.util.Base64"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="vo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    Cookie[] cookies = request.getCookies();
    Usuario u = new Usuario();
    if(cookies != null){
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("spin_user_logged_in_object")){
                u = new Gson().fromJson(new String(Base64.getDecoder().decode(cookie.getValue())), Usuario.class);
            }
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Spin</title>
        <meta charset="UTF-8">
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
                                String uri = request.getRequestURI();
                                String pageName = uri.substring(uri.lastIndexOf("/")+1);
                                if(pageName.contains("index")){%> <%= "active" %> <%}%> aria-current="page" href="/Spin/index_release.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">Loja</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">Biblioteca</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">Configurações</a>
                    </li>
                </ul>
                    <span class="nav_text">
                        <button class="btn" style="margin-right: 8px">
                        <i class="bi bi-moon-fill"></i>
                        </button>
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
                            <li><a class="dropdown-item disabled" href="./telas/login.jsp">Configurações</a></li>
                            <li><a class="dropdown-item disabled" href="./telas/login.jsp">Compras</a></li>
                            <li><a class="dropdown-item disabled" href="./telas/login.jsp">Biblioteca</a></li>
                            <li><a class="dropdown-item" href="/Spin/telas/about.jsp">Sobre</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" id="logoff">Log-off</a></li>
                        </ul>
                        <%}%>

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
                <img src="..." class="rounded me-2" id="toast-icon" alt="...">
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
        
        document.getElementById('logoff').addEventListener('click', () => {
                logout();
                location.reload();
            });
        };

        function showToast(status, message){
            const toastLiveExample = document.getElementById('liveToast');
            document.getElementById('toast-message').innerHTML = message;
            document.getElementById('toast-status').innerHTML = status;
            const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample);
            
            toastBootstrap.show();
        }
        
        function logout(){
            document.cookie = 'spin_user_logged_in_object'+'=; Max-Age=-99999999;';  
        }
        </script>
</html>
