<%-- 
    Document   : compras
    Created on : 24 de nov. de 2024, 01:03:18
    Author     : arman
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="dao.PagamentoDadosDAO"%>
<%@page import="vo.PagamentoDados"%>
<%@page import="dao.PagamentoMetodoDAO"%>
<%@page import="vo.PagamentoMetodo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.PagamentoDAO"%>
<%@page import="vo.Pagamento"%>
<%@page import="dao.JogoDAO"%>
<%@page import="vo.Jogo"%>
<%@page import="dao.CompraDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Compra"%>
<%@page import="java.util.List"%>
<%@page import="vo.Usuario"%>
<%@page import="vo.Compra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario u = (Usuario) request.getSession(true).getAttribute("spin_user_logged_in_object");
    
    List<Compra> listCompras = new ArrayList<>();
    if(u != null)
        listCompras = new CompraDAO().selectAllByUser(u.getCodigoUsuario());
%>
<!DOCTYPE html>
<html>
    <jsp:include page="../generics/header_config.jsp"/>
    <body>
        <% if(u == null){%>
        <div class="mx-auto text-center">
            <i class="bi bi-question-circle-fill" style="font-size: 12rem"></i>
            <h1>Atenção!</h1>
            <h2>Você não está logado, para acessarmos sua lista de compras um login é necessário<br><a href="/Spin/telas/login.jsp?backurl=telas/configuracoes_compras.jsp">Clique Aqui!</a> para realizar seu login.</h2>
        </div>
        <% }else if(listCompras.isEmpty()){ %>
        <div class="mx-auto text-center">
            <i class="bi bi-exclamation-circle-fill" style="font-size: 12rem"></i>
            <h1>Atenção!</h1>
            <h2>Você ainda não realizou compras, compre jogos na aba <a href="/Spin/telas/loja.jsp">Loja</a></h2>
        </div>
        <%}else{%>
        <div class="container-fluid">
            <h1>Compras:</h1><br>
            <%for(int i = 1; i<=listCompras.size(); i++){
            int index = i-1;
            Pagamento pagamento = new PagamentoDAO().selectOne(listCompras.get(index).getPagamento().getCodPagamento());
            PagamentoDados dadosPagamento = new PagamentoDadosDAO().selectOne(pagamento.getPagamentoDados().getCodigoPagamentoDados());
            JsonElement jsonPagamento = new Gson().fromJson(dadosPagamento.getDadosCompra(), JsonElement.class);
            List<Jogo> listJogosCompra = new JogoDAO().selectAllByCompra(listCompras.get(index).getCodigoCompra()); 
            PagamentoMetodo metodoPagamento = new PagamentoMetodoDAO().selectOne(pagamento.getPagamentoMetodo().getCodMetodoPagamento());
            String[] numerosCartao = jsonPagamento.getAsJsonObject().get("numero_cartao").getAsString().split(" ");
            %>
            <div class="row">
                <p>
                  <a class="card btn btn-secondary" style="padding: 8px; text-align: left" data-bs-toggle="collapse" href="#collapseCompra<%= i %>" role="button" aria-expanded="false" aria-controls="collapseExample">
                      Compra #<%= listCompras.get(index).getCodigoCompra() %> Finalizada em: <%= new SimpleDateFormat("dd/MM/yyyy").format(listCompras.get(index).getDataCriado() ) %>
                  </a>
                  <div class="collapse" id="collapseCompra<%= i %>">
                    <div class="card card-body" style="margin-bottom: 16px">
                        <div class="row">
                            <label for="div_jogos">Jogos</label>
                            <div id="div_jogos" name="div_jogos" class="col-md-4 list-bg">
                                <div class="list-group">
                                    <% for(Jogo jogoListado : listJogosCompra){ %>
                                    <a class="list-group-item" aria-current="true">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h5 class="mb-1"><%=jogoListado.getNome() %></h5>
                                        </div>
                                            <p class="mb-1"><%= String.format("R$ %.02f", jogoListado.getValor()) %></p>
                                        <small><%= "Desenvolvida por: "+jogoListado.getDesenvolvedora() %></small>
                                    </a>
                                    <%}%>
                                </div>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-7">
                                <h2><%= String.format("Valor total: R$ %.02f",pagamento.getValor()) %></h2>
                                <h5>Método de pagamento: <%=metodoPagamento.getDescricao() %></h5>
                                <p>Compra realizada com os dados de pagamento: <%= jsonPagamento.getAsJsonObject().get("identificacao_dados").getAsString() %></p>
                                <p>Cartão finalizado por: <%= numerosCartao[numerosCartao.length-1] %></p>

                            </div>
                        </div>

                    </div>
                </div>
                </p>

            </div>
            <%}}%>
        </div>
    </body>
    
    <style>
        .list-bg{
            height: 250px;
            background-color: rgba(127,127,127, .4);
            overflow-y: scroll;
            border-color: rgba(127,127,127, .8);
            border-style: solid;
            border-width: 2px;
            border-radius: 8px;
            -ms-overflow-style: none;  /* IE and Edge */
            scrollbar-width: none; 
        }
        .list-bg::-webkit-scrollbar {
            display: none;
        }
    </style>
</html>
