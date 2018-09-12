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
        <title>Tabela Price</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/includes.jspf" %>
        <div id="container">
            <h2>Tabela Price</h2>
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
            <form> 
                <label for="C"><b>Capital</b></label><br>
                <input type="text" name="txtcapital" id="txtcapital">
                <br>
                <label for="m"><b>Meses</b></label><br>
                <input type="text" name="txtmeses" id="txtmeses">
                <br>
                <label for="j"><b>Juros</b></label><br>
                <input type="text" name="txtjuros" id="txtjuros">

                <br><br>
                <input type="submit" value="Gerar Amortização" class="btn">
                <br/><br/>
            </form>
            <hr>
            <%if (capital > 0 && meses > 0 && taxa > 0) {%>
            <table border="1" class="tabela">
                <th>Parcelas</th>
                <th>Saldo Devedor</th>
                <th>Valor da Prestação</th>
                <th>Valor dos Juros</th>
                <th>Amortização</th>

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
</body>
</html>