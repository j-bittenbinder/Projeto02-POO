<%-- 
    Document   : amortizacao-americana
    Created on : 11/09/2018, 16:11:56
    Author     : Billy
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grupo 03 | Amortização Americana</title>

        <style>
            form > div {
                width: 15%;
                margin: 0 auto;
            }

            label{
                text-align: left;
                display: block !important;
            }
        </style>

    </head>
    <body>
        <%@include file="WEB-INF/jspf/includeMenu.jspf" %>

    <center><h2><b>Amortização Americana</b></h2></center>
    <hr/>
    <center><h6 style="line-height: 1.5">O Sistema de Amortização Americano, (SAA), 
            é uma forma de pagamento de empréstimos que se caracteriza pelo pagamento 
            apenas dos juros da dívida, deixando o valor da dívida constante, que 
            pode ser paga em apenas um único pagamento: <b>Juros = Valor emprestado x Juros</b></h6></center>
    <br/>
    <form class="text-center jumbotron">
        <div class="mb-3">
            <label for="valor"><b>Valor Financiado</b></label>
            <input id="valor" type="text" name="valor"/>
        </div>

        <div class="mb-3">
            <label for="meses"><b>Meses</b></label>
            <input id="meses" type="text" name="meses"/>
        </div>

        <div class="mb-3">
            <label for="juros"><b>Juros</b></label>
            <input id="juros" type="text" name="juros"/>
        </div>
        <input type="submit" name="enviar" value="Gerar Amortização" class="btn"/>
        
    </form>

    <%  if (request.getParameter("valor") != null
                & request.getParameter("meses") != null
                & request.getParameter("juros") != null) {
            double valor = Double.parseDouble(request.getParameter("valor"));
            int meses = Integer.parseInt(request.getParameter("meses"));
            double juros = Double.parseDouble(request.getParameter("juros")) / 100;
            DecimalFormat formatar = new DecimalFormat("0.##");
            double amortizacao = 0, aux1 = 0, aux2 = 0, aux3 = 0;
    %>
    <br/>
    <br/>
    <table border="2" class="table">
        <thead class="thead-dark">
            <tr>
                <th>#</th><th>Parcelas</th><th>Amortização</th><th>Juros</th><th>Saldo devedor</th>
            </tr>
        </thead>
        <tr>
            <% for (int i = 0; i < meses; i++) {
                    double parcela = valor * juros;
                    double saldoDevedor = valor;
                    if (i == (meses - 1)) {
                        parcela = parcela + valor;
                        amortizacao = valor;
                        saldoDevedor = saldoDevedor - valor;
                    }
            %>
        </tr>
        <tr>
            <td><%= (i + 1)%></td>
            <td><%= formatar.format(parcela)%></td>
            <td><%= formatar.format(amortizacao)%></td>
            <td><%= formatar.format(valor * juros)%></td>
            <td><%= formatar.format(saldoDevedor)%></td>
        </tr>
        <%  aux1 = aux1 + parcela;
                aux2 = aux2 + amortizacao;
                aux3 = aux3 + (valor * juros);
            }%>
        <tr>
            <th>#</th>
            <td><%= aux1%></td>
            <td><%= aux2%></td>
            <td><%= aux3%></td>
            <td><strong>Total</strong></td>
        </tr>
        <%}%>
    </table>

    <hr/>

    <%@include file="WEB-INF/jspf/includeRodape.jspf" %>
</body>
</html>