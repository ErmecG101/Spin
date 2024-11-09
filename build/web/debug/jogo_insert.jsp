<%-- 
    Document   : jogo_insert.jsp
    Created on : Nov 8, 2024, 10:34:58 PM
    Author     : Otavio
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
                Inserir Jogo:
            </div>
        
        <!--todo make validations.-->
        <form name="frm" method="post" class="needs-validation"  action="../JogoController?acao=1" novalidate>
            
        <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><image src="../icons/material/description_24dp_E8EAED_FILL0_wght400_GRAD0_opsz24.svg"/></span>
            <input type="text" class="form-control" placeholder="Nome" aria-label="Nome" aria-describedby="basic-addon1" id="nome" name="nome" required>
            <div class="invalid-feedback">
                Nome obrigatório
            </div>
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><image src="../icons/material/attach_money_24dp_E8EAED_FILL0_wght400_GRAD0_opsz24.svg"/></span>
            <input type="number" class="form-control" placeholder="Valor" aria-label="Valor" aria-describedby="basic-addon1" id="valor" name="valor" required>
            <div class="invalid-feedback">
                Valor obrigatório
            </div>
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><image src="../icons/material/published_with_changes_24dp_E8EAED_FILL0_wght400_GRAD0_opsz24.svg"/></span>
            <input type="text" class="form-control" placeholder="Publicado Por" aria-label="Publicado Por" aria-describedby="basic-addon1" id="publicadopor" name="publicadopor" required>
            <div class="invalid-feedback">
                Publicadora obrigatória
            </div>
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><image src="../icons/material/code_24dp_E8EAED_FILL0_wght400_GRAD0_opsz24.svg"/></span>
            <input type="text" class="form-control" placeholder="Desenvolvedora" aria-label="Desenvolvedora" aria-describedby="basic-addon1" id="desenvolvedora" name="desenvolvedora" required>
            <div class="invalid-feedback">
                Desenvolvedora obrigatória
            </div>
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><image src="../icons/material/calendar_today_24dp_E8EAED.svg"/></span>
            <input type="date" class="form-control" placeholder="Data de Lançamento" aria-label="Data de Lançamento" aria-describedby="basic-addon1" id="dataLanc" name="dataLanc" required>
            <div class="invalid-feedback">
                Data de lançamento obrigatório
            </div>
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><image src="../icons/material/upload_file_24dp_E8EAED_FILL0_wght400_GRAD0_opsz24.svg"/></span>
            <input type="file" class="form-control" accept=".png,.jpeg,.jpg" placeholder="Capa do Jogo" aria-label="Capa do Jogo" aria-describedby="basic-addon1" id="capa" name="capa" required>
            <div class="invalid-feedback">
                Capa obrigatória.
            </div>
            <input type="hidden" id="capaBase64" name="capaBase64"/>
        </div>
        <br><br>
        <input type="hidden" name="url" value="index.jsp"/>
        <button class="btn btn-primary" type="submit">Salvar</button>
        </form>
        
        <script type="text/javascript">
            
               
                
            window.onload = function(){
                document.getElementById('capa').addEventListener('change', () => {
                    try{
                        getFile();
                    }catch(erro){
                        console.log(erro);
                        showToast("Erro", "Erro ao subir o arquivo!")
                    }
                });
                
                var forms = document.querySelectorAll('.needs-validation')
                Array.prototype.slice.call(forms)
                    .forEach(function (form) {
                        form.addEventListener('submit', function (event) {
                            if (!form.checkValidity()) {
                                event.preventDefault()
                                event.stopPropagation()
                            }

                            form.classList.add('was-validated')
                        }, false);
                    });
            };
            
            function getFile(){
                const fileInput = document.getElementById('capa');
                const selectedFile = fileInput.files[0];
                toBase64(selectedFile);
            }
            
            function toBase64(file) {
                var reader = new FileReader();
                reader.readAsDataURL(file);
                reader.onload = function () {
                    document.getElementById('capaBase64').value = reader.result.split(',')[1];
                };
                reader.onerror = function (error) {
                    
                    showToast("Erro", "Erro ao subir o arquivo!");
                };
            }
        </script>
    </body>
</html>
