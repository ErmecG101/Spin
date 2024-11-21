<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <jsp:include page="./generics/header_config_debug.jsp"/>
    <body>
        <div class="mx-auto" style="width: 80%">     
            <div class="d-flex justify-content-center">
                <h1>Bem Vindo a SPIN (DEBUG)</h1>
            </div>
            <div class="d-flex justify-content-center">
                <div class="column">
                    <div>
                        <a href="./debug/usuario_insert.jsp">
                            <button class="btn btn-primary">Usuario</button>
                        </a> 
                        <a href="./debug/jogo_insert.jsp">
                            <button class="btn btn-primary">Jogos</button>
                        </a> 
                        <a href="./debug/dados_pagamento_insert.jsp">
                            <button class="btn btn-primary">Pagamento Dados</button>
                        </a> 
                    </div>
                    <br>
                    <div>
                        <a href="./debug/metodo_pagamento_insert.jsp">
                            <button class="btn btn-primary">Pagamento Metodo</button>
                        </a> 
                        <a href="">
                            <button class="btn btn-primary" disabled>Compra Carrinho</button>
                        </a> 
                        <a href="">
                            <button class="btn btn-primary" disabled>Compra</button>
                        </a> 
                    </div>
                </div>
            </div>     
        </div>
    </body>
</html>
