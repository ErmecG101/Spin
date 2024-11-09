<%-- 
    Document   : header_config_debug
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
    </head>
    
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
