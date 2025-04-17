<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    <%-- start web service invocation --%><hr/>
    <%
        
        
    double num1 = Double.parseDouble(request.getParameter("txt1"));  
    double num2 = Double.parseDouble(request.getParameter("txt2"));  
    try {
	com.dd.Operation service = new com.dd.Operation();
	com.dd.OperationSoap port = service.getOperationSoap();
	 // TODO initialize WS operation arguments here
	double a = num1;
	double b = num2;
	// TODO process result here
	double result = port.add(a, b);
	out.println("Result = "+result);
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>
    </body>
</html>
