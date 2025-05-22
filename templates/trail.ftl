<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${content.title}</title>
    <link rel="stylesheet" href="${content.rootpath}css/style.css">
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

        <#if content.osm_embed_code??>
            <div class="map-container">
                <h2>Trail Map</h2>
                ${content.osm_embed_code}
            </div>
        </#if>
    </main>

    <#include "footer.ftl">
</body>
</html>
