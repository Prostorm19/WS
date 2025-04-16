
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
        pkg.ImageWS port = service.getImageWSPort(); // No MTOMFeature needed for download unless required

        // Define file name and path
        String filename = "ABC.jpg";
        String filePath = "C:/Pratham/download/"+ filename;

        // Call the web service to download the file
        byte[] fileBytes = port.download(filename);

        // Save the file locally
        FileOutputStream fos = new FileOutputStream(filePath);
        BufferedOutputStream bos = new BufferedOutputStream(fos);
        bos.write(fileBytes);
        bos.close();

        out.println("File downloaded: " + filePath);
    } catch (Exception ex) {
        out.println("Error: " + ex.getMessage());
    }
%>
<%-- End web service invocation --%>
<hr/>

</body>
</html>
