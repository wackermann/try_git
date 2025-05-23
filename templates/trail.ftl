<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${content.title}</title>
    <link rel="stylesheet" href="${content.rootpath}css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/leaflet.css" />
</head>
<body>
    <#include "header.ftl">

    <main>
        <h1>${content.title}</h1>
        <#if content.date??>
            <p><em>Published on: ${content.date?string("MMMM dd, yyyy")}</em></p>
        </#if>
        <#if content.difficulty??>
            <p><strong>Difficulty:</strong> ${content.difficulty}</p>
        </#if>
        <#if content.length??>
            <p><strong>Length:</strong> ${content.length}</p>
        </#if>

        <article>
            ${content.body}
        </article>

        <#if content.gpx_file?? && content.gpx_file?has_content>
            <div class="map-container">
                <h2>Trail Map</h2>
                <div id="mapid" style="height: 500px; width: 100%;"></div>
                <p><a href="${content.rootpath}${content.gpx_file}" download>Download GPX Track</a></p>
            </div>
        </#if>
    </main>

    <#include "footer.ftl">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/leaflet.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet-gpx/2.2.0/gpx.min.js"></script>
    <#if content.gpx_file?? && content.gpx_file?has_content>
    <script type="text/javascript">
        // Initialize the map
        var map = L.map('mapid');

        // Add OpenStreetMap tiles
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(map);

        // GPX track
        var gpxFile = "${content.rootpath}${content.gpx_file}";

        new L.GPX(gpxFile, {
            async: true,
            marker_options: {
                startIconUrl: '${content.rootpath}assets/img/pin-icon-start.png', // Assuming a start pin icon
                endIconUrl: '${content.rootpath}assets/img/pin-icon-end.png',     // Assuming an end pin icon
                shadowUrl: '${content.rootpath}assets/img/pin-shadow.png'       // Assuming a shadow for pins
            }
        }).on('loaded', function(e) {
            map.fitBounds(e.target.getBounds());
        }).addTo(map);
    </script>
    </#if>
</body>
</html>
