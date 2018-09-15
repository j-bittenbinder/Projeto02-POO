<%-- 
    Document   : home
    Created on : 11/09/2018, 16:11:29
    Author     : Billy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grupo 03 | Home</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/includeMenu.jspf" %>
        <center>
            <h1><b>Bem-vindo!</b></h1>
        <hr/>
        <h4 class="text-center jumbotron" style="line-height: 1.7">Amortização é um processo que extingue dívidas através de pagamentos
            periódicos, é a extinção de uma dívida através da quitação da mesma. 
            A amortização traduz-se pela soma do reembolso do capital ou do 
            pagamento dos juros do saldo devedor.</h4>
            <br/>
        <h5>Utilize o menu acima para realizar os seguintes cálculos:<br/>
            Amortização Constante, Amortização Americana e Tabela Price.</h5>
        <br/>
        <hr/>
        </center>
        
        <%@include file="WEB-INF/jspf/includeRodape.jspf" %>
    </body>
</html>
