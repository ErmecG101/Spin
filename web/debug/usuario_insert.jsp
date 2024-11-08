<%-- 
    Document   : usuario_insert
    Created on : 8 de nov. de 2024, 17:39:01
    Author     : arman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../generics/header_config.jsp"/>
    <body>
        <div class="mx-auto" style="width: 40%">
                <div class="d-flex justify-content-center">
                    Isso Ã© uma Build de DEBUG!
                </div>
            <div class="d-flex justify-content-center">
                Inserir Usuario:
            </div>
        
        <!--todo make validations.-->
        <form name="frm" method="post" onsubmit="" action="../UsuarioController?acao=1">
            
        <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><image src="../icons/material/account_circle_24dp_E8EAED.svg"/></span>
            <input type="text" class="form-control" placeholder="Nome" aria-label="Nome" aria-describedby="basic-addon1" id="nome" name="nome">
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><image src="../icons/material/lock_24dp_E8EAED.svg"/></span>
            <input type="password" class="form-control" placeholder="Senha" aria-label="Senha" aria-describedby="basic-addon1" id="senha" name="senha">
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><image src="../icons/material/alternate_email_24dp_E8EAED.svg"/></span>
            <input type="email" class="form-control" placeholder="Email" aria-label="Email" aria-describedby="basic-addon1" id="email" name="email">
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><image src="../icons/material/calendar_today_24dp_E8EAED.svg"/></span>
            <input type="date" class="form-control" placeholder="Data" aria-label="Data" aria-describedby="basic-addon1" id="dataNasc" name="dataNasc">
        </div>
        <br><br>
        <input type="hidden" name="url" value="index.jsp"/>
        <button class="btn btn-primary" type="submit">Sign-up</button>
        </form>
    </body>
</html>
