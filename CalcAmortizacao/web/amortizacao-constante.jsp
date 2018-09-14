<%-- 
    Document   : amortizacao-constante
    Created on : 11/09/2018, 16:11:43
    Author     : Billy
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grupo 03 | Amortização Constante</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/includeMenu.jspf" %>
    <center><h2><b>Amortização Constante</b></h2></center>
    <br/><br/>

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
        <br/>
        <input type="submit" name="enviar" value="Gerar Amortização" class="btn"/>
        <br/><br/>
    </form>


    <%  if (request.getParameter("valor") != null
                & request.getParameter("meses") != null
                & request.getParameter("juros") != null) {
            double valor = Double.parseDouble(request.getParameter("valor"));
            int meses = Integer.parseInt(request.getParameter("meses"));
            double juros = Double.parseDouble(request.getParameter("juros")) / 100;
            DecimalFormat formatar = new DecimalFormat("0.##");
            double amortizacao = 0, prestacao = 0, valorjuros = 0;
    %>
    <br/>
    <br/>
    <table border="2" class="table">
        <thead class="thead-dark">
            <tr>
                <th>#</th><th>Prestção</th><th>Juros</th><th>Saldo devedor</th>
            </tr>
        </thead>
        <tr><td>0</td><td></td><td></td><td>R$<%=formatar.format(valor)%></td></tr>
        <% amortizacao = valor / meses;
            for (int i = 1; i <= meses; i++) {
                valorjuros = valor * juros;
                prestacao = amortizacao + valorjuros;
                valor = valor - amortizacao;
        %>
        <tr>
            <td><%=i%></td>
            <td>R$<%=formatar.format(prestacao)%></td>   
            <td>R$<%=formatar.format(valorjuros)%></td>   
            <td>R$<%=formatar.format(valor)%></td>  
        </tr>   
        <%
            }
        %>


    </table>
    <%
        }
    %>
    <hr/>

    <%@include file="WEB-INF/jspf/includeRodape.jspf" %>
</body>
</html>
