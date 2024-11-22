<%-- 
    Document   : configuracoes
    Created on : 21 de nov. de 2024, 21:23:18
    Author     : arman
--%>

<%@page import="vo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Usuario u = (Usuario) request.getSession(true).getAttribute("spin_user_logged_in_object");
%>
<html>
    <jsp:include page="../generics/header_config.jsp"/>
    <body>
        <div class="container-fluid">
            <h2>Selecione qual configuração você deseja realizar: </h2>
            <br><br>
        <div class="list-group">
            <a href="#" class="list-group-item disabled list-group-item-action">
              <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1">Editar dados de Usuário</h5>
                <i class="bi bi-caret-right-fill"></i>
              </div>
            </a>
            <a href="<%= u != null ? "/Spin/telas/configuracoes_dados_pagamentos.jsp" : "/Spin/telas/login.jsp?backurl=telas/configuracoes.jsp" %>" class="list-group-item list-group-item-action" aria-current="true">
              <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1">Gerenciar Dados de Pagamentos</h5>
                <i class="bi bi-caret-right-fill"></i>
              </div>
            </a>
        </div>
        </div>
    </body>
</html>
