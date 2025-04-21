<%@ page import="com.example.MultiplicationServiceService" %>
<%@ page import="com.example.MultiplicationService" %>
<%@ page import="java.io.*" %>
<%
    try {
        int num1 = Integer.parseInt(request.getParameter("num1"));
        int num2 = Integer.parseInt(request.getParameter("num2"));

        // Create the service and port
        MultiplicationServiceService service = new MultiplicationServiceService();
        MultiplicationService port = service.getMultiplicationServicePort();

        int result = port.multiply(num1, num2);
%>
        <h3>Result:</h3>
        <p><%= num1 %> × <%= num2 %> = <strong><%= result %></strong></p>
<%
    } catch (Exception e) {
%>
        <p>Error: <%= e.getMessage() %></p>
<%
    }
%>
<br>
<a href="index.jsp">Back</a>
