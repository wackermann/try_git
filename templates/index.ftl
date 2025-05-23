<#include "header.ftl">
	
	<#include "menu.ftl">

	<div class="page-header">
		<h1>Trails</h1>
	</div>
	<#list db.getPublishedContent("trail") as post>
  		<#if (post.status == "published")>
  			<a href="${post.uri}"><h1>${post.title}</h1></a>
  			<p>${post.date?string("dd MMMM yyyy")}</p>
  			<p>${post.body}</p>
  		</#if>
  	</#list>
	
	<hr />
	
<#include "footer.ftl">