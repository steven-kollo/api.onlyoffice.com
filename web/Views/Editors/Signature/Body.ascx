<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("signature/") %>"></a>
    <span class="hdr">Request with token in body</span>
</h1>

<p class="dscr">
    When performing the HTTP requests from ONLYOFFICE Document Server the <em>token</em> is added to the parameters to validate the data.
    When performing the HTTP requests to ONLYOFFICE Document Server the <em>token</em> must be added to the parameters to validate the data.
</p>

<p>
    Starting with version 5.2 it is possible to use the token in body parameters with <b>Document Server</b>.
    To enable it set the <em>services.CoAuthoring.token.inbox.inBody</em> and <em>services.CoAuthoring.token.outbox.inBody</em> in configuration file to <b>true</b>.
</p>

<div class="note">
    Token in body is used for POST requests only. For the GET requests <a href="<%= Url.Action("signature/request") %>">token in header</a> is used.
</div>

<div class="header-gray">Parameters</div>

<table class="table">
    <colgroup>
        <col style="width: 300px;" />
        <col />
        <col style="width: 100px;" />
        <col style="width: 100px;" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Parameter</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.inbox.inBody</td>
            <td>Specifies the enabling the token validation in the request body to the <b>document command service</b> and <b>document conversion service</b>.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.outbox.inBody</td>
            <td>Specifies the enabling the token generation for the request body by <b>document editing service</b> to <b>document storage service</b>.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
    </tbody>
</table>


<div class="header-gray">Sample local.json configuration</div>
<pre>
{
    "services": {
        "CoAuthoring": {
            "token": {
                "inbox": {
                    "inBody": true,
                },
                "outbox": {
                    "inBody": true
                }
            }
        }
    }
}
</pre>


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

<p>These parameters must be encoded into the token so that the request looked like this:</p>

<div class="header-gray">Sample of request to receive the status of the edited document</div>
<pre>
POST coauthoring/CommandService.ashx HTTP/1.1
Host: documentserver
Content-Type: application/json

{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjIjoiaW5mbyIsImtleSI6IktoaXJ6NnpUUGRmZDcifQ.r_6sThjFABsHMNHhkVdHDSz4jwkbXRQNYdvawkBGJgg"
}
</pre>

<p>As you can see there is no need to include the above parameters into the request body, as all of them are already encoded into the token and sent within it.</p>

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
<p>Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed. See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.</p>
<div class="header-gray">Sample of request to convert the document</div>
<pre>
POST ConvertService.ashx HTTP/1.1
Host: documentserver
Content-Type: application/json

{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxldHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3Iiwib3V0cHV0dHlwZSI6InBkZiIsInRpdGxlIjoiRXhhbXBsZSBEb2N1bWVudCBUaXRsZS5kb2N4IiwidXJsIjoiaHR0cDovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.U-YAfuuy7clWjn-xOncfJ-sxVG5DlcYn0AOzJYkoR0M"
}
</pre>
<p>Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed. See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.</p>


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
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJrZXkiOiJLaGlyejZ6VFBkZmQ3Iiwic3RhdHVzIjo0fQ.gCyNKPpg6ISAnhvFQmRiY6BRqG6WPcEGgnK79hREdkU"
}
</pre>
<p>Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed. See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.</p>


<p>When performing the GET requests from ONLYOFFICE Document Server an <a href="<%= Url.Action("signature/request") %>">authorization header</a> with the token is added.</p>

<p id="download" class="copy-link">
    Validation is performed for outgoing requests to <b>document storage service</b> for file download.
</p>

<div class="header-gray">Sample payload of request to document storage service for file download</div>
<pre>
{
    "url: "http://example.com/url-to-example-document.docx"
}
</pre>
<div class="header-gray">Sample of request to document storage service for file download</div>
<pre>
GET url-to-example-document.docx HTTP/1.1
Host: example.com
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJodHRwOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQuZG9jeCJ9.-DBTpvYH2srNUc3Xy2N4QozEXO6VF1XS89K7Li0JM68
</pre>
<p>Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed. See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.</p>
<p>The token includes the payload (the full URL to the document, in the example above it is <em>{"url: "http://example.com/url-to-example-document.docx"}</em>), which is also duplicated in the header as the <b>Host</b> (<em>example.com</em>) and the document address the GET request is sent to (<em>url-to-example-document.docx</em>).</p>
