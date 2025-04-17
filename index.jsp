<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        #map {
            height: 400px;
            width: 100%;
        }
    </style>
    <title>Google Maps Display</title>
</head>
<body>

<%
    // Retrieve and parse latitude and longitude parameters
    double lati = 0.0;
    double longi = 0.0;
    try {
        lati = Double.parseDouble(request.getParameter("t1"));
        longi = Double.parseDouble(request.getParameter("t2"));
    } catch (Exception e) {
        out.println("<p>Error parsing coordinates. Please make sure you provided valid numbers.</p>");
    }
%>

<h3>Google Maps</h3>
<div id="map"></div>

<script>
    function initMap() {
        var info = { lat: <%= lati %>, lng: <%= longi %> };
        var map = new google.maps.Map(document.getElementById("map"), {
            zoom: 8,
            center: info
        });
        var marker = new google.maps.Marker({
            position: info,
            map: map
        });
    }
</script>

<!-- Replace YOUR_API_KEY with your actual Google Maps API key -->
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAFvoZs-LHkG4qDJfz0Nwre2VRCRNPZz54&callback=initMap">
</script>

</body>
</html>
