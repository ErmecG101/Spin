<%-- 
    Document   : configuracoes_dados_pagamentos
    Created on : 21 de nov. de 2024, 21:31:06
    Author     : arman
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PagamentoDadosDAO"%>
<%@page import="java.util.List"%>
<%@page import="vo.PagamentoDados"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Date"%>
<%@page import="vo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Usuario u = (Usuario) request.getSession(true).getAttribute("spin_user_logged_in_object");
    List<PagamentoDados> listPagamentosDados;
    if(u != null)
        listPagamentosDados = new PagamentoDadosDAO().selectAllByUser(u.getCodigoUsuario());
    else
        listPagamentosDados = new ArrayList<>();
        
    int codigo_dados_pagamentos = 0;
    PagamentoDados pagamentoDadosAEditar = null;
    JsonElement jsonEditar = null; 
    String[] separatedValidade = null;
    if(request.getParameter("codigo_dados_pagamentos") != null){
        codigo_dados_pagamentos = Integer.parseInt(request.getParameter("codigo_dados_pagamentos"));
        for(PagamentoDados itemValidando : listPagamentosDados){
            if(itemValidando.getCodigoPagamentoDados() == codigo_dados_pagamentos){
                pagamentoDadosAEditar = itemValidando;
                jsonEditar = new Gson().fromJson(pagamentoDadosAEditar.getDadosCompra(), JsonElement.class); 
                separatedValidade = jsonEditar.getAsJsonObject().get("validade_cartao").getAsString().split("/");
                break;
            }
        }
    }
%>
<!DOCTYPE html>
<html>
    <jsp:include page="../generics/header_config.jsp"/>
    <body>
        <% if(u != null){ %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-5 container-background row">
                    <% if(listPagamentosDados.isEmpty()){ %>
                    <p> Nenhum dado de pagamento encontrado, será necessário que você cadastre ao menos um para realizar compras usando cartão de crédito ou débito. </p>
                    <%}else{
                        for(PagamentoDados item : listPagamentosDados){ 
                        JsonElement json = new Gson().fromJson(item.getDadosCompra(), JsonElement.class); 
                        String[] validade =  json.getAsJsonObject().get("validade_cartao").getAsString().split("/");%>
                    <div class="col-sm-6 mb-3 mb-sm-0">
                        <form method="POST" action="/Spin/PagamentoDadosController?acao=4">
                        <input type="hidden" name="url" value="telas/configuracoes_dados_pagamentos.jsp"/>
                        <div class="card">
                          <div class="card-body">
                              <h5 class="card-title"><%= json.getAsJsonObject().get("identificacao_dados").getAsString() %></h5>
                            <p class="card-text"><%= json.getAsJsonObject().get("nome_tit_cartao").getAsString() %></p>
                            <p class="card-text"><%= json.getAsJsonObject().get("numero_cartao").getAsString() %></p>
                            <p class="card-text"><%= String.format("Validade: %02d/%s", Integer.parseInt(validade[0]), validade[1].substring(2)) %></p>
                            <a href="../telas/configuracoes_dados_pagamentos.jsp?codigo_dados_pagamentos=<%= item.getCodigoPagamentoDados() %>" class="btn disabled"><i class="bi bi-pencil-fill"></i></a>
                            <button class="btn" name="row_to_delete" id="row_to_delete" value="<%= item.getCodigoPagamentoDados() %>"><i class="bi bi-trash-fill"></i></button>
                          </div>
                        </div>
                        </form>
                    </div>
                    <%}}%>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-4 container-background" style="text-align: left">
                    <div class="container-fluid">
                        

                    <h3 style="text-align: center"><%= codigo_dados_pagamentos == 0 ?"Cadastrar" : "Editar" %> Dados de Pagamento</h3>
                    <hr>
                    <form method="POST" action="/Spin/PagamentoDadosController?acao=<%= codigo_dados_pagamentos == 0 ? "2" : "3" %>">
                        <input type="hidden" name="url" value="telas/configuracoes_dados_pagamentos.jsp"/>
                        <div class="form-text">Nenhum dado vai ser compartilhado.</div>
                        <br>
                        <div class="mb-3">
                          <label for="ident_dados" class="form-label">Identificação dos dados</label>
                          <input value="<%= pagamentoDadosAEditar == null ? "" : jsonEditar.getAsJsonObject().get("identificacao_dados").getAsString()  %>" type="text" value="" class="form-control" id="ident_dados" name="ident_dados" required>
                        </div>
                        <div class="mb-3">
                          <label for="exampleInputPassword1" class="form-label">Numero do Cartão</label>
                          <input value="<%= pagamentoDadosAEditar == null ? "" : jsonEditar.getAsJsonObject().get("numero_cartao").getAsString()  %>" type="text" maxlength="19" placeholder="1234 5678 9012 3456" class="form-control" id="num_cartao" name="num_cartao" required>
                        </div>
                        <div class="mb-3">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="exampleInputPassword1" class="form-label">Nome do Titular</label>
                                </div>
                                <div class="col-md-6" style="text-align: right">
                                    <label for="exampleInputPassword1" class="form-label">Validade do Cartão</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-8">
                                    <input value="<%= pagamentoDadosAEditar == null ? "" : jsonEditar.getAsJsonObject().get("nome_tit_cartao").getAsString()  %>" type="text" class="form-control" id="nom_tit_cartao" name="nom_tit_cartao" required>
                                </div>
                                <div class="col-md-2" style="text-align: right">
                                    <select style="text-align: center" class="form-control" id="expiry-month" name="expiry-month" required>
                                        <option value="" disabled <%= pagamentoDadosAEditar == null ? "selected" : "" %>>Mês</option>
                                        <%for(int i = 1; i<=12; i++){%>
                                        <option <%= pagamentoDadosAEditar != null ? Integer.parseInt(separatedValidade[0]) == i ? "selected" : "" : "" %> value="<%= i %>"><%= String.format("%02d", i) %></option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="col-md-2" style="text-align: right">
                                    <select style="text-align: center" class="form-control" id="expiry-year" name="expiry-year" required>
                                        <option value="" disabled <%= pagamentoDadosAEditar == null ? "selected" : "" %>>Ano</option>
                                        <%for(int i = new GregorianCalendar().get(Calendar.YEAR); i<=new GregorianCalendar().get(Calendar.YEAR)+15; i++){%>
                                        <option <%= pagamentoDadosAEditar != null ? Integer.parseInt(separatedValidade[1]) == i ? "selected" : "" : "" %> value="<%= i %>"><%= String.valueOf(i).substring(2) %></option>
                                        <%}%>
                                     </select>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
                <div class="col-md-1"></div>
                </div>
            </div>
        </div>
        <%} else {%>
        
            <div class="mx-auto text-center">
                <i class="bi bi-three-dots" style="font-size: 18rem;"></i>
                <a href="/Spin/telas/login.jsp?backurl=telas/configuracoes_dados_pagamentos.jsp"><h3>Você está deslogado, favor realizar login para obter essas informações.</h3>        </a>
            </div>

        <%}%>
    </body>
    
        <style>
        .container-background{
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
</html>
