<%-- 
    Document   : carrinho_detalhes
    Created on : 21 de nov. de 2024, 01:23:36
    Author     : arman
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="vo.PagamentoDados"%>
<%@page import="vo.PagamentoMetodo"%>
<%@page import="dao.PagamentoMetodoDAO"%>
<%@page import="dao.PagamentoDadosDAO"%>
<%@page import="dao.JogoDAO"%>
<%@page import="vo.Jogo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CompraCarrinhoDAO"%>
<%@page import="vo.Usuario"%>
<%@page import="vo.CompraCarrinho"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Usuario u = (Usuario) request.getSession(true).getAttribute("spin_user_logged_in_object");
    
    List<CompraCarrinho> listItens;
    if(u != null && u.getCodigoUsuario() > 0)
        listItens = new CompraCarrinhoDAO().selectAllByUser(u.getCodigoUsuario());
    else
        listItens = new ArrayList<>();
        
    String[] urlParts = request.getRequestURI().split("/");
    int siteHomePos = 0;
    for(int i = 0; i<urlParts.length; i++){
        if(urlParts[i].equals("Spin")){
            siteHomePos = i;
            break;
        }
    }
    StringBuilder pageUrl = new StringBuilder();
    for(int i = siteHomePos+1; i< urlParts.length; i++){
        pageUrl.append(urlParts[i]);
        if(i < urlParts.length-1)
            pageUrl.append("/");
    }
    double valorTotal = 0f;
%>

<!DOCTYPE html>
<html>
    <jsp:include page="../generics/header_config.jsp"/>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-3 cart-background">
                    <ul class="list-group list-group-flush">
                    <% if(listItens.isEmpty()){ %>
                    <li>Nenhum item no carrinho</li>
                    <%}else{%>
                    <%for(CompraCarrinho item: listItens){
                        Jogo jogoCarrinho = new JogoDAO().selectOne(item.getJogo().getCodigoJogo());
                        valorTotal += jogoCarrinho.getValor(); %>
                        <li class="list-group-item" style="border-radius: 8px;">
                            <form method="POST" action="/Spin/CompraCarrinhoController?acao=1">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1"><%= jogoCarrinho.getNome() %></h5>
                                <button class="btn" name="item_to_delete" value="<%= item.getCodigoCompraCarrinho() %>">
                                    <input type="hidden" name="url" value="<%= pageUrl.toString() %>"/>
                                    <i class="bi bi-trash-fill"></i>
                                </button>
                            </div>
                                <p class="mb-1" style="text-align: left">R$ <%= String.format("%.2f", jogoCarrinho.getValor()) %></p>
                            </form>
                        </li>
                    <%}%>
                    <% }%>
                   </ul>
                </div>
                <div class="col-md-1">
                </div>
                   <div class="col-md-6 cart-background">
                       <form method="POST" action="/Spin/CompraController?acao=1">
                           <input type="hidden" name="url" value="telas/biblioteca.jsp"/>
                           <h2>Finalizar Compra</h2>
                           <h4>Valor total: RS <%= String.format("%.2f", valorTotal) %></h4>
                           <div class="row g-3">
                               <div class="col-auto mx-auto">
                            <label class="col-form-label" for="metodo_pagamento">Método de Pagamento:</label>
                               </div>
                               <div class="col-auto mx-auto">
                            <select onchange="updateFormFields(1)" name="metodo_pagamento" id="metodo_pagamento" class="form-select">
                                <option disabled selected value> -- Selecione um Método -- </option>
                                 <% PagamentoMetodoDAO pgmDao = new PagamentoMetodoDAO();
                                  List<PagamentoMetodo> listMetodosPagamento = pgmDao.selectAll();
                                  for(PagamentoMetodo metodo: listMetodosPagamento){ 
                                    if(metodo.getCodMetodoPagamento() != 1){%>
                                  <option value="<%= metodo.getCodMetodoPagamento() %>"><%= metodo.getDescricao() %></option>
                                  <%}}%>
                                  
                             </select>
                               </div>
                             <div id="formFields">
                                 
                             </div>
                                  <div>
                                      <button name="finalizar_compra" id="finalizar_compra" class="btn btn-primary disabled">Finalizar Compra</button>
                                  </div>
                           </div>
                       </form>
                   </div>
                <div class="col-md-1"></div>
            </div>
        </div>
    </body>
    
    <style>
        .cart-background{
            height: 600px;
            background-color: rgba(127,127,127,.2);
            border-color: rgba(177,177,177,.2);
            border-width: 2px;
            border-style: solid;
            border-radius: 10px;
            overflow-y: auto;
            padding-top: 16px;
            padding-bottom: 16px;
            padding-left: 8px;
            padding-right: 8px;
            text-align: center;
        }
    </style>
    
    <script type="text/javascript">
        function updateFormFields(option) {
        
        if (option === 1){
            const selectedOption = document.getElementById('metodo_pagamento').value;
            const formFields = document.getElementById('formFields');
            document.getElementById('finalizar_compra').classList.remove("disabled");

            formFields.innerHTML = ''; // Clear existing fields
            if (selectedOption === '1') {
              formFields.innerHTML = `
              `;
            } else {
              document.getElementById('finalizar_compra').classList.add("disabled");
              formFields.innerHTML = `
                <select onchange="updateFormFields(2)" name="select_dados_pagamento" id="select_dados_pagamento" class="form-select" aria-label="Default select example">
                    <option value="nao_selecionado" selected disabled> -- Selecionar dados de Pagamento --</option>
            <% List<PagamentoDados> listPagamentoDados = new PagamentoDadosDAO().selectAllByUser(u == null ? 0 : u.getCodigoUsuario());
            
            for(PagamentoDados pagamentoDado : listPagamentoDados){
            JsonElement json = new Gson().fromJson(pagamentoDado.getDadosCompra(), JsonElement.class); 
            String[] numberDivided = json.getAsJsonObject().get("numero_cartao").getAsString().split(" ");
            String identificacao = json.getAsJsonObject().get("identificacao_dados").getAsString()+" Card: " + numberDivided[numberDivided.length-1];  %>
                    <option value="<%= pagamentoDado.getCodigoPagamentoDados() %>"><%=  identificacao%></option>
            <%}%>
                  </select>
                            <br>
                <div class="row g-3 align-items-center">
                <div class="col-auto">
                <label for="cvc" class="form-label">CVC:</label>
                </div>
                <div class="col-auto">
                <input id="cvc" maxlength="3" onKeyUp="updateFormFields(2)"  name="cvc" type="text" class="form-control" required>
                </div>
                </div>
              `;
            }
            }else if(option === 2){
                if(document.getElementById("cvc") !== null && document.getElementById("cvc").value !== "" &&
                        document.getElementById("select_dados_pagamento") !== null && document.getElementById("select_dados_pagamento").value !== "nao_selecionado")
                    document.getElementById('finalizar_compra').classList.remove("disabled");
        }
        
      }
    </script>
</html>
