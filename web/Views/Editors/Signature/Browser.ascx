<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("signature/") %>"></a>
    <span class="hdr">Browser</span>
</h1>
<p class="dscr">When performing the client-side browser requests to ONLYOFFICE Document Server a <em>token</em> must be added to the parameters to validate the data.</p>

<p id="config">When a file is <a href="<%= Url.Action("open") %>">opened</a> for editing in ONLYOFFICE Document Server, the <a href="<%= Url.Action("config/") %>#token">token</a> must be added to the configuration to validate the parameters.</p>

<p>
    The <em>payload</em> for the JWT token in the JSON format must have the same structure as the <a href="<%= Url.Action("advanced") %>">config</a>.
    The parameter list to be signed is not strictly regulated, but we recommend that you specify the following parameters:
</p>

<pre>
{
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "permissions": {
            "download": true,
            "edit": true,
            "print": true,
            "review": true
        },
        "title": "Example Document Title.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "editorConfig": {
        "callbackUrl": "https://example.com/url-to-callback.ashx",
        "mode": "edit",
        "user": {
            "id": "78e1e841",
            "name": "Smith"
        }
    }
}
</pre>
<p>Where the <b>example.com</b> is the name of the the server where <b>document manager</b> and <b>document storage service</b> are installed. See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.</p>

<div class="header-gray">Sample token</div>
<pre>eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwicGVybWlzc2lvbnMiOnsiZG93bmxvYWQiOnRydWUsImVkaXQiOnRydWUsInByaW50Ijp0cnVlLCJyZXZpZXciOnRydWV9LCJ0aXRsZSI6IkV4YW1wbGUgRG9jdW1lbnQgVGl0bGUuZG9jeCIsInVybCI6Imh0dHA6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1kb2N1bWVudC5kb2N4In0sImVkaXRvckNvbmZpZyI6eyJjYWxsYmFja1VybCI6Imh0dHA6Ly9leGFtcGxlLmNvbS91cmwtdG8tY2FsbGJhY2suYXNoeCIsIm1vZGUiOiJlZGl0IiwidXNlciI6eyJpZCI6Ijc4ZTFlODQxIiwibmFtZSI6IlNtaXRoIn19fQ.dQLHmsYqKoAG6vpcLngrIUkstAycpi8dFfP4lHPk0Uc</pre>


<p id="setHistoryData">When calling the <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> method to view the document <a href="<%= Url.Action("history") %>">history</a> version in ONLYOFFICE Document Server, the <a href="<%= Url.Action("config/") %>#token">token</a> must be added to validate the parameters.</p>

<p>
    The <em>payload</em> for the JWT token in the JSON format must have the same structure as the method parameter.
    The parameter list to be signed is not strictly regulated, but we recommend that you specify all the parameter sent:
</p>

<pre>
{
    "changesUrl": "https://example.com/url-to-changes.zip",
    "key": "Khirz6zTPdfd7",
    "previous": {
        "key": "af86C7e71Ca8",
        "url": "https://example.com/url-to-the-previous-version-of-the-document.docx"
    },
    "url": "https://example.com/url-to-example-document.docx",
    "version": 2
}
</pre>
<p>Where the <b>example.com</b> is the name of the the server where <b>document manager</b> and <b>document storage service</b> are installed. See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.</p>

<div class="header-gray">Sample token</div>
<pre>eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaGFuZ2VzVXJsIjoiaHR0cDovL2V4YW1wbGUuY29tL3VybC10by1jaGFuZ2VzLnppcCIsImtleSI6IktoaXJ6NnpUUGRmZDciLCJwcmV2aW91cyI6eyJrZXkiOiJhZjg2QzdlNzFDYTgiLCJ1cmwiOiJodHRwOi8vZXhhbXBsZS5jb20vdXJsLXRvLXRoZS1wcmV2aW91cy12ZXJzaW9uLW9mLXRoZS1kb2N1bWVudC5kb2N4In0sInVybCI6Imh0dHA6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1kb2N1bWVudC5kb2N4IiwidmVyc2lvbiI6Mn0.9dgDsaVLFQ6RtoX_1s2pBVJHGnyMjxDXKC2TpC2nXb4</pre>
