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
                Inserir Metodo de Pagamento:
            </div>
        
        <!--todo make validations.-->
        <form name="frm" method="post" class="needs-validation" action="../PagamentoMetodoController?acao=1" novalidate>
            
        <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><image src="../icons/material/description_24dp_E8EAED_FILL0_wght400_GRAD0_opsz24.svg"/></span>
            <input type="text" class="form-control" placeholder="Nome do Método de Pagamento" aria-label="Nome do Método de Pagamento" aria-describedby="basic-addon1" id="descricao" name="descricao" required>
            <div class="invalid-feedback">
                Nome do Método de Pagamento Obrigatório.
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
