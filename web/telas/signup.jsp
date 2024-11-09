<%-- 
    Document   : signup
    Created on : 9 de nov. de 2024, 14:30:17
    Author     : arman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../generics/header_config_nonav.jsp"/>
    <body>
        <form action="../UsuarioController?acao=1" class="needs-validation" novalidate method="post"> 
            <div class="mx-auto text-center" style="width: 30%">     
                <div class="mx-auto text-center" style="width: 80%">    
            <img class="mb-4" src=""  alt="logo" width="72" height="57" style="margin-top: 10%">
                </div>
            <h1 class="h3 mb-3 fw-normal">Por favor, realize o Login</h1>

            <div class="form-floating">
                <input type="text" class="form-control" placeholder="jose" name="nome" id="nome" required>
                <label for="floatingInput">Nome</label>
                <div class="invalid-feedback">
                    Nome obrigatório
                </div>
            </div>
            <div class="form-floating">
                <input type="email" class="form-control" placeholder="name@example.com" name="email" id="email" required>
                <label for="floatingInput">Email</label>
                <div class="invalid-feedback">
                    Email obrigatório
                </div>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" placeholder="Password" name="senha" id="senha" required>
                <label for="floatingPassword">Senha</label>
                <div class="invalid-feedback">
                    Senha obrigatória
                </div>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" placeholder="Password" name="confSenha" id="confSenha" required>
                <label for="floatingPassword">Confirmar Senha</label>
                <div class="invalid-feedback">
                    Confirmação de Senha está incorreta!
                </div>
            </div>
            <div class="form-floating">
                <input type="date" class="form-control" placeholder="19/02/2004" name="dataNasc" id="dataNasc" required>
                <label for="floatingPassword">Data de Nascimento</label>
                <div class="invalid-feedback">
                    Data de Nascimento obrigatória
                </div>
            </div>
            <br> 
            <input type="hidden" name="url" value="telas/login.jsp"/>
            <input type="hidden" name="erroUrl" value="telas/signup.jsp"/>
            <button class="btn btn-primary w-100 py-2" type="submit">Cadastrar</button>
            <a href="/Spin/telas/login.jsp">Já possui uma conta? Entre aqui</a>
            <p class="mt-5 mb-3 text-body-secondary">© 2024–2024</p>
            </div>
            </div>
        </form>
        
        <script type="text/javascript">
            window.onload = function(){
                var forms = document.querySelectorAll('.needs-validation');
                Array.prototype.slice.call(forms)
                    .forEach(function (form) {
                        form.addEventListener('submit', function (event) {
                            if (!form.checkValidity()) {
                                event.preventDefault();
                                event.stopPropagation();
                            }

                            form.classList.add('was-validated');
                        }, false);
                    });
            };
        </script>
    </body>
</html>
