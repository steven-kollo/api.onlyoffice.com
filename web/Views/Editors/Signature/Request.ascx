<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("signature/") %>"></a>
    <span class="hdr">Request with token in header</span>
</h1>

<p class="dscr">
    When performing the HTTP requests from ONLYOFFICE Document Server an authorization header with the <em>token</em> is added to validate the request.
    When performing the HTTP requests to ONLYOFFICE Document Server an authorization header with the <em>token</em> must be added to validate the request.
</p>

<p>The <em>payload</em> for the JSON Web Token contains the following fields:</p>
<ul>
    <li><b>payload</b> - the object containing the request body parameters in JSON format if not empty.</li>
</ul>


<h2>Incoming request</h2>

<p id="command" class="copy-link">Validation is performed for incoming requests with the commands from the <b>document storage service</b> to the <a href="<%= Url.Action("command") %>">document command service</a>.</p>

<div class="header-gray">Sample payload of request to receive the status of the edited document</div>
<pre>
{
    "payload": {
        "c": "info",
        "key": "Khirz6zTPdfd7"
    }
}
</pre>
<div class="header-gray">Sample of request to receive the status of the edited document</div>
<pre>
POST coauthoring/CommandService.ashx HTTP/1.1
Host: documentserver
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImMiOiJpbmZvIiwia2V5IjoiS2hpcno2elRQZGZkNyJ9fQ.hGQ8kquQWpg4MQYiSYaIzik0wotP1coAop6QfLruenA

{
    "c": "info",
    "key": "Khirz6zTPdfd7"
}
</pre>


<p id="conversion" class="copy-link">Validation is performed for incoming requests with the commands from the <b>document storage service</b> to the <a href="<%= Url.Action("conversionapi") %>">document conversion service</a>.</p>

<div class="header-gray">Sample payload of request to convert the document</div>
<pre>
{
    "payload": {
        "filetype": "docx",
        "key": "Khirz6zTPdfd7",
        "outputtype": "pdf",
        "title": "Example Document Title.docx",
        "url": "https://example.com/url-to-example-document.docx"
    }
}
</pre>
<p>Where the <b>example.com</b> is the name of the the server where <b>document manager</b> and <b>document storage service</b> are installed. See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.</p>
<div class="header-gray">Sample of request to convert the document</div>
<pre>
POST ConvertService.ashx HTTP/1.1
Host: documentserver
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImZpbGV0eXBlIjoiZG9jeCIsImtleSI6IktoaXJ6NnpUUGRmZDciLCJvdXRwdXR0eXBlIjoicGRmIiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50IFRpdGxlLmRvY3giLCJ1cmwiOiJodHRwOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQuZG9jeCJ9fQ.Ec50Gvafu4niR2I1LPgETn1jkvvs1wKm0YeeI1RbRQs

{
    "filetype": "docx",
    "key": "Khirz6zTPdfd7",
    "outputtype": "pdf",
    "title": "Example Document Title.docx",
    "url": "https://example.com/url-to-example-document.docx"
}
</pre>
<p>Where the <b>example.com</b> is the name of the the server where <b>document manager</b> and <b>document storage service</b> are installed. See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.</p>


<h2>Outgoing requests</h2>

<p id="callbackUrl" class="copy-link">Validation is performed for outgoing requests to "<a href="<%= Url.Action("config/editor") %>#callbackUrl">callbackUrl</a>" address by <b>document editing service</b>.</p>

<div class="header-gray">Sample payload of request to "callbackUrl" address by document editing service when the last user closed the document for editing without changes</div>
<pre>
{
    "payload": {
        "key": "Khirz6zTPdfd7",
        "status": 4
    }
}
</pre>
<div class="header-gray">Sample of request to "callbackUrl" address by document editing service when the last user closed the document for editing without changes</div>
<pre>
POST url-to-callback.ashx HTTP/1.1
Host: example.com
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImtleSI6IktoaXJ6NnpUUGRmZDciLCJzdGF0dXMiOjR9fQ.MfVoGT-aYuPJfjQAaxwBv7-CqBylDae2AF9K5TpLf-E

{
    "key": "Khirz6zTPdfd7",
    "status": 4
}
</pre>
<p>Where the <b>example.com</b> is the name of the the server where <b>document manager</b> and <b>document storage service</b> are installed. See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.</p>


<p id="download" class="copy-link">Validation is performed for outgoing requests to <b>document storage service</b> for file download.</p>

<div class="header-gray">Sample payload of request to document storage service for file download</div>
<pre>
{}
</pre>
<div class="header-gray">Sample of request to document storage service for file download</div>
<pre>
GET url-to-example-document.docx HTTP/1.1
Host: example.com
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.LwimMJA3puF3ioGeS-tfczR3370GXBZMIL-bdpu4hOU
</pre>
<p>Where the <b>example.com</b> is the name of the the server where <b>document manager</b> and <b>document storage service</b> are installed. See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.</p>
