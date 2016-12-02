<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("signature/") %>"></a>
    <span class="hdr">Request</span>
</h1>

<p class="dscr">When performing the requests with the commands from the <b>document storage service</b> to the <a href="<%= Url.Action("command") %>">document command service</a> and <a href="<%= Url.Action("conversionapi") %>">document conversion service</a>, an authorization title with the <em>token</em> is added to validate the request.</p>

<p>The <em>payload</em> for the JSON Web Token contains the following fields:</p>
<ul>
    <li><b>query</b> - the key-value object containing the request query parameters.</li>
</ul>

<div class="header-gray">Sample of request to receive the status of the document.</div>
<p><b>http://documentserver/coauthoring/CommandService.ashx?c=info&amp;key=Khirz6zTPdfd7</b></p>
<div class="header-gray">Sample payload</div>
<pre>
{
    "query": {
        "c": "info",
        "key": "Khirz6zTPdfd7",
    },
}
</pre>
<div class="header-gray">Sample request</div>
<pre>
GET coauthoring/CommandService.ashx?c=info&amp;key=Khirz6zTPdfd7 HTTP/1.1
Host: documentserver
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJxdWVyeSI6eyJjIjoiaW5mbyIsImtleSI6IktoaXJ6NnpUUGRmZDcifX0.zvc6UFK_KU5U17o-vwAqNVExAXv25nxcH0OH8L_9miM
</pre>
