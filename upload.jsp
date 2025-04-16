<%@page import="java.io.BufferedOutputStream" %>
<%@page import="java.io.FileOutputStream" %>
<%@page import="java.io.FileInputStream" %>
<%@page import="java.io.BufferedInputStream" %>
<%@page import="javax.imageio.stream.FileImageInputStream" %>
<%@page import="java.io.File" %>
<%@page import="javax.xml.ws.soap.MTOMFeature" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>

<%-- Start web service invocation --%>
<hr/>
<%
    try {
        pkg.ImageWS_Service service = new pkg.ImageWS_Service();
        pkg.ImageWS port = service.getImageWSPort(new MTOMFeature(60000));

        // Initialize WS operation arguments
        String filePath = "c:/Pratham/ABC.jpg";
        File file = new File(filePath);
        FileInputStream fis = new FileInputStream(file);
        BufferedInputStream bis = new BufferedInputStream(fis);

        String filename = file.getName();
        byte[] imageBytes = new byte[(int) file.length()];
        bis.read(imageBytes);

        port.upload(filename, imageBytes);
        bis.close();

        out.println("File uploaded: " + filePath);
    } catch (Exception ex) {
        out.println("Error: " + ex.getMessage());
        // You could also log the exception or handle it as needed
    }
%>
<%-- End web service invocation --%>
<hr/>

</body>
</html>
