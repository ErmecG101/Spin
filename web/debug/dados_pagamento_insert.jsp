<%-- 
    Document   : usuario_insert
    Created on : 8 de nov. de 2024, 17:39:01
    Author     : arman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../generics/header_config_debug.jsp"/>
    <body>
        <div class="mx-auto" style="width: 40%">
                <div class="d-flex justify-content-center">
                    Isso Ã© uma Build de DEBUG!
                </div>
            <div class="d-flex justify-content-center">
                Inserir Dados de Pagamento:
            </div>
        
        <!--todo make validations.-->
        <form name="frm" method="post" class="needs-validation" action="../PagamentoDadosController?acao=1" novalidate>
            
        <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><image src="../icons/material/account_circle_24dp_E8EAED.svg"/></span>
            <input type="text" class="form-control" placeholder="Usuario" aria-label="Usuario" aria-describedby="basic-addon1" id="usuario" name="usuario" required>
            <div class="invalid-feedback">
                Usuário (id) obrigatório
            </div>
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><image src="../icons/material/file_json_24dp_E8EAED_FILL0_wght400_GRAD0_opsz24.svg"/></span>
            <input type="text" class="form-control" placeholder="Dados de Pagamento" aria-label="Dados de Pagamento" aria-describedby="basic-addon1" id="dadosCompra" name="dadosCompra" required>
            <div class="invalid-feedback">
                Dados de Pagamento (JSON) obrigatório
            </div>
        </div>
        <br><br>
        <input type="hidden" name="url" value="index.jsp"/>
        <button class="btn btn-primary" type="submit">Sign-up</button>
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
