<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("signature/") %>"></a>
    <span class="hdr">Request with token in header</span>
</h1>

<p class="dscr">
    When performing the HTTP requests from ONLYOFFICE Docs an authorization header with the <em>token</em> is added to validate the request.
    When performing the HTTP requests to ONLYOFFICE Docs an authorization header with the <em>token</em> must be added to validate the request.
</p>

<p>The <em>payload</em> for the JSON Web Token contains the following fields:</p>
<ul>
    <li><b>payload</b> - the object containing the request body parameters in JSON format if not empty.</li>
</ul>


<h2 id="incoming" class="copy-link">Incoming request</h2>

<ul>
    <li>
        <p><b id="command" class="copy-link">Request to receive the status of the edited document</b></p>
        <p>Validation is performed for incoming requests with the commands from the <b>document storage service</b> to the <a href="<%= Url.Action("command") %>">document command service</a>.</p>

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
    </li>
    <li>
        <p><b id="conversion" class="copy-link">Request to convert the document</b></p>
        <p>Validation is performed for incoming requests from the <b>document storage service</b> to the <a href="<%= Url.Action("conversionapi") %>">document conversion service</a>.</p>

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
        <p>
            Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.
        </p>
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
        <p>
            Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.
        </p>
    </li>
    <li>
        <p><b id="builder" class="copy-link">Request to document builder service</b></p>
        <p>Validation is performed for incoming requests from the <b>document storage service</b> to the <a href="<%= Url.Action("documentbuilderapi") %>">document builder service</a>.</p>

        <div class="header-gray">Sample payload of request to document builder service</div>
        <pre>
{
    "payload": {
        "async": true,
        "url": "https://example.com/url-to-example-script.docbuilder"
    }
}
</pre>
        <p>
            Where the <b>example.com</b> is the name of the server where <b>document storage service</b> are installed.
            See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.
        </p>
        <div class="header-gray">Sample of request to document builder service</div>
        <pre>
POST docbuilder HTTP/1.1
Host: documentserver
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImFzeW5jIjp0cnVlLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLXNjcmlwdC5kb2NidWlsZGVyIn19.JpHp_TB3XDacAhTTB4I0CE7SIESSE9aQUGDulbpYKTE

{
    "async": true,
    "url": "https://example.com/url-to-example-script.docbuilder"
}
</pre>
        <p>
            Where the <b>example.com</b> is the name of the server where <b>document storage service</b> are installed.
            See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.
        </p>
    </li>
</ul>

<h2 id="outgoing" class="copy-link">Outgoing requests</h2>

<ul>
    <li>
        <p><b id="callbackUrl" class="copy-link">Request to "callbackUrl" address by document editing service when the last user closed the document for editing without changes</b></p>
        <p>Validation is performed for outgoing requests to "<a href="<%= Url.Action("config/editor") %>#callbackUrl">callbackUrl</a>" address by <b>document editing service</b>.</p>

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
        <p>
            Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.
        </p>
    </li>
    <li>
        <p><b id="download" class="copy-link">Request to document storage service for file download</b></p>
        <p>Validation is performed for outgoing requests to <b>document storage service</b> for file download.</p>

        <div class="header-gray">Sample payload of request to document storage service for file download</div>
        <pre>
{
    "payload": {
        "url": "https://example.com/url-to-example-document.docx"
    }
}
</pre>
        <div class="header-gray">Sample of request to document storage service for file download</div>
        <pre>
GET url-to-example-document.docx HTTP/1.1
Host: example.com
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7InVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQuZG9jeCJ9fQ.DnhdBVtn8sFo9Adfl6GuT_v53NVV5cQ0Vi9c8xRzrjs
</pre>
        <p>
            Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.
        </p>
        <p>The token includes the payload (the full URL to the document, in the example above it is <em>{"url: "http://example.com/url-to-example-document.docx"}</em>), which is also duplicated in the header as the <b>Host</b> (<em>example.com</em>) and the document address the GET request is sent to (<em>url-to-example-document.docx</em>).</p>
    </li>
    <li>
        <p><b id="file-changes" class="copy-link">Request to document storage service for document changes data download</b></p>
        <p>Validation is performed for outgoing requests to <b>document storage service</b> for document changes data download.</p>

        <div class="header-gray">Sample payload of request to document storage service for document changes data download</div>
        <pre>
{
    "payload": {
        "url": "https://example.com/url-to-document-changes.zip"
    }
}
</pre>
        <div class="header-gray">Sample of request to document storage service for document changes data download</div>
        <pre>
GET url-to-changes.zip HTTP/1.1
Host: example.com
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7InVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWRvY3VtZW50LWNoYW5nZXMuemlwIn19.4CJ4F8x7VDMW72ss9VnIYGIwjRpBMYBBRXZ5aX2r2Y4
</pre>
        <p>
            Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.
        </p>
        <p>The token includes the payload (the full URL to the document, in the example above it is <em>{"url: "http://example.com/url-to-document-changes.zip"}</em>), which is also duplicated in the header as the <b>Host</b> (<em>example.com</em>) and the document address the GET request is sent to (<em>url-to-document-changes.zip</em>).</p>
    </li>
</ul>
