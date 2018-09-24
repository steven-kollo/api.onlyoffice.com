<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("signature/") %>"></a>
    <span class="hdr">Request with token in body</span>
</h1>

<p class="dscr">
    When performing the HTTP requests from ONLYOFFICE Document Server the <em>token</em> is added to the parameters to validate the data.
    When performing the HTTP requests to ONLYOFFICE Document Server the <em>token</em> must be added to the parameters to validate the data.
</p>

<div class="note">
    The token in body parameters is used in <b>Document Server</b> starting with version 5.2.
    <br />
    To enable it set the <em>services.CoAuthoring.token.inbox.inBody</em> and <em>services.CoAuthoring.token.outbox.inBody</em> in configuration file to <b>true</b>.
</div>

<p>The <em>payload</em> for the JSON Web Token contains the request body parameters.</p>

<h2>Incoming request</h2>

<p id="command" class="copy-link">Validation is performed for incoming requests with the commands from the <b>document storage service</b> to the <a href="<%= Url.Action("command") %>">document command service</a>.</p>

<div class="header-gray">Sample parameters of request to receive the status of the edited document</div>
<pre>
{
    "c": "info",
    "key": "Khirz6zTPdfd7"
}
</pre>
<div class="header-gray">Sample of request to receive the status of the edited document</div>
<pre>
POST coauthoring/CommandService.ashx HTTP/1.1
Host: documentserver
Content-Type: application/json

{
    "c": "info",
    "key": "Khirz6zTPdfd7",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjIjoiaW5mbyIsImtleSI6IktoaXJ6NnpUUGRmZDcifQ.r_6sThjFABsHMNHhkVdHDSz4jwkbXRQNYdvawkBGJgg"
}
</pre>


<p id="conversion" class="copy-link">Validation is performed for incoming requests with the commands from the <b>document storage service</b> to the <a href="<%= Url.Action("conversionapi") %>">document conversion service</a>.</p>

<div class="header-gray">Sample parameters of request to convert the document</div>
<pre>
{
    "filetype": "docx",
    "key": "Khirz6zTPdfd7",
    "outputtype": "pdf",
    "title": "Example Document Title.docx",
    "url": "https://example.com/url-to-example-document.docx"
}
</pre>
<p>Where the <b>example.com</b> is the name of the the server where <b>document manager</b> and <b>document storage service</b> are installed. See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.</p>
<div class="header-gray">Sample of request to convert the document</div>
<pre>
POST ConvertService.ashx HTTP/1.1
Host: documentserver
Content-Type: application/json

{
    "filetype": "docx",
    "key": "Khirz6zTPdfd7",
    "outputtype": "pdf",
    "title": "Example Document Title.docx",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxldHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3Iiwib3V0cHV0dHlwZSI6InBkZiIsInRpdGxlIjoiRXhhbXBsZSBEb2N1bWVudCBUaXRsZS5kb2N4IiwidXJsIjoiaHR0cDovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.U-YAfuuy7clWjn-xOncfJ-sxVG5DlcYn0AOzJYkoR0M",
    "url": "https://example.com/url-to-example-document.docx"
}
</pre>
<p>Where the <b>example.com</b> is the name of the the server where <b>document manager</b> and <b>document storage service</b> are installed. See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.</p>


<h2>Outgoing requests</h2>

<p id="callbackUrl" class="copy-link">Validation is performed for outgoing requests to "<a href="<%= Url.Action("config/editor") %>#callbackUrl">callbackUrl</a>" address by <b>document editing service</b>.</p>

<div class="header-gray">Sample parameters of request to "callbackUrl" address by document editing service when the last user closed the document for editing without changes</div>
<pre>
{
    "key": "Khirz6zTPdfd7",
    "status": 4
}
</pre>
<div class="header-gray">Sample of request to "callbackUrl" address by document editing service when the last user closed the document for editing without changes</div>
<pre>
POST url-to-callback.ashx HTTP/1.1
Host: example.com
Content-Type: application/json

{
    "key": "Khirz6zTPdfd7",
    "status": 4,
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJrZXkiOiJLaGlyejZ6VFBkZmQ3Iiwic3RhdHVzIjo0fQ.gCyNKPpg6ISAnhvFQmRiY6BRqG6WPcEGgnK79hREdkU"
}
</pre>
<p>Where the <b>example.com</b> is the name of the the server where <b>document manager</b> and <b>document storage service</b> are installed. See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.</p>


<p>When performing the GET requests from ONLYOFFICE Document Server an <a href="<%= Url.Action("signature/request") %>">authorization header</a> with the token is added.</p>

<p id="download" class="copy-link">
    Validation is performed for outgoing requests to <b>document storage service</b> for file download.
</p>

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
