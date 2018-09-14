<%-- 
    Document   : tabela-price
    Created on : 11/09/2018, 16:12:21
    Author     : Billy
    Alter      : Thalisson F Pereira 
    Date       : 12/09/2018
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grupo 03 | Tabela Price</title>

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
        <div id="container">
            <center><h2><b>Tabela Price</b></h2></center><br/><br/>
                        <%
                            double capital = 0;
                            double taxa = 0;
                            double devedor = 0;
                            double amortizao = 0;
                            double prestacao = 0;
                            int meses = 0;

                            try {
                                capital = Double.parseDouble(request.getParameter("txtcapital"));
                            } catch (Exception e) {

                            }
                            try {
                                taxa = Double.parseDouble(request.getParameter("txtjuros"));
                            } catch (Exception e) {
                            }
                            try {
                                meses = Integer.parseInt(request.getParameter("txtmeses"));
                            } catch (Exception e) {
                            }
                            taxa = taxa / 100;
                            double linha1 = capital * taxa;
                            double x = Math.pow((1 + taxa), meses);
                            double linha2 = 1 - (1 / x);

                        %>

            <form class="text-center jumbotron">
                <div class="mb-3">
                    <label for="C"><b>Capital</b></label>
                    <input type="text" name="txtcapital" id="txtcapital">
                </div>

                <div class="mb-3">
                    <label for="m"><b>Meses</b></label>
                    <input type="text" name="txtmeses" id="txtmeses">
                </div>

                <div class="mb-3">
                    <label for="j"><b>Juros</b></label>
                    <input type="text" name="txtjuros" id="txtjuros">
                </div>
                <br/>
                <input type="submit" value="Gerar Amortização" class="btn">
                <br/><br/>
            </form>

            <hr>
            <%if (capital > 0 && meses > 0 && taxa > 0) {%>
            <table border="1" class="tabela table">
                <thead class="thead-dark">
                <th>Parcelas</th>
                <th>Saldo Devedor</th>
                <th>Valor da Prestação</th>
                <th>Valor dos Juros</th>
                <th>Amortização</th>
                </thead>
                <%for (int i = 1; i <= meses; i++) {

                        double juros = 0;

                        if (i == 1) {
                            devedor = capital;
                            prestacao = 0;
                            juros = 0;
                            amortizao = 0;
                        } else {
                            prestacao = linha1 / linha2;
                            juros = devedor * taxa;
                            devedor = (devedor + juros) - prestacao;
                            amortizao = prestacao - juros;
                        }
                %>                
                <tr>
                    <td><%=i%></td>
                    <td><%=String.format("R$ %.2f", devedor)%></td>
                    <td><%=String.format("R$ %.2f", prestacao)%></td>
                    <td><%=String.format("R$ %.2f", juros)%></td>
                    <td><%=String.format("R$ %.2f", amortizao)%></td>
                </tr>
                <%}%>
            </table><%} else { %>
            <td>
            <tr > <p style="color:red;font-size:20px;" >Valores incorretos, Favor verificar os numeros informados. <p>   </tr>
                </td>
                <%}%>
        </div>

        <%@include file="WEB-INF/jspf/includeRodape.jspf" %>
    </body>
</html>