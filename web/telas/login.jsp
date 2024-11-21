<%-- 
    Document   : login.jsp
    Created on : 9 de nov. de 2024, 02:57:57
    Author     : arman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../generics/header_config_nonav.jsp"/>
    <body>
        <form action="../UsuarioController?acao=2" method="post"> 
            <div class="mx-auto text-center" style="width: 30%">     
                <div class="mx-auto text-center" style="width: 80%">    
            <img class="mb-4" src=""  alt="logo" width="72" height="57" style="margin-top: 50%">
                </div>
            <h1 class="h3 mb-3 fw-normal">Por favor, realize o Login</h1>

            <div class="form-floating">
                <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="email" id="email">
                <label for="floatingInput">Email</label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="senha" id="senha">
                <label for="floatingPassword">Senha</label>
            </div>

            <div class="form-check text-start my-3">
                <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
                <label class="form-check-label" for="flexCheckDefault">
                    Lembrar de mim
                </label>
            </div>
            <input type="hidden" name="url" value="<%= request.getParameter("backurl") != null ? request.getParameter("backurl") : "index.jsp"%>"/>
            <input type="hidden" name="erroUrl" value="telas/login.jsp"/>
            <button class="btn btn-primary w-100 py-2" type="submit">Entrar</button>
            <a href="/Spin/telas/signup.jsp">Ainda não possui conta? Cadstre-se aqui</a>
            <p class="mt-5 mb-3 text-body-secondary">© 2024–2024</p>
            </div>
            </div>
        </form>
    </body>
</html>
