<#include "header.ftl">
	
	<#include "menu.ftl">

	<main class="container content-wrapper">
		<div class="page-header">
			<h1>Trails</h1>
		</div>
		<#list db.getPublishedContent("trail") as post>
	  		<#if (post.status == "published")>
	  		    <div class="trail-item">
	      			<a href="${post.uri}"><h1>${post.title}</h1></a>
	      			<p class="trail-date">${post.date?string("dd MMMM yyyy")}</p>
	      			<div class="trail-summary">${post.body}</div>
	  		    </div>
	  		</#if>
	  	</#list>
	</main>
	
	<hr />
	
<#include "footer.ftl">