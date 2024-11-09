<%-- 
    Document   : header_config
    Created on : Nov 7, 2024, 9:18:27 PM
    Author     : Otavio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Spin</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
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
                <span class="nav-text dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="./icons/material/account_circle_24dp_E8EAED.svg"/>
                            Guest
                        </a>
                        <ul class="dropdown-menu dropdown-menu-lg-end">
                            <li><a class="dropdown-item" href="./telas/login.jsp">Sign-in</a></li>
                            <li><a class="dropdown-item disabled" href="#">Sign-up</a></li>
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
        };

        function showToast(status, message){
            const toastLiveExample = document.getElementById('liveToast');
            document.getElementById('toast-message').innerHTML = message;
            document.getElementById('toast-status').innerHTML = status;
            const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample);
            
            toastBootstrap.show();
        }
        </script>
</html>
