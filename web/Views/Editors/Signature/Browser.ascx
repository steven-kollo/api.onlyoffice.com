<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("signature/") %>"></a>
    <span class="hdr">Browser</span>
</h1>
<p class="dscr">When performing the client-side browser requests to ONLYOFFICE Document Server a <em>token</em> must be added to the parameters to validate the data.</p>

<h2 id="open" class="copy-link">Opening file</h2>

<p id="config" class="copy-link">When a file is <a href="<%= Url.Action("open") %>">opened</a> for editing in ONLYOFFICE Document Server, the <a href="<%= Url.Action("config/") %>#token">token</a> must be added to the configuration to validate the parameters.</p>

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
<p>
    Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
    See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
</p>

<div class="header-gray">Sample token</div>
<pre>eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwicGVybWlzc2lvbnMiOnsiZG93bmxvYWQiOnRydWUsImVkaXQiOnRydWUsInByaW50Ijp0cnVlLCJyZXZpZXciOnRydWV9LCJ0aXRsZSI6IkV4YW1wbGUgRG9jdW1lbnQgVGl0bGUuZG9jeCIsInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQuZG9jeCJ9LCJlZGl0b3JDb25maWciOnsiY2FsbGJhY2tVcmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1jYWxsYmFjay5hc2h4IiwibW9kZSI6ImVkaXQiLCJ1c2VyIjp7ImlkIjoiNzhlMWU4NDEiLCJuYW1lIjoiU21pdGgifX19.zHrHSYqSxJFGQzDWRxwcxomcXVmyPVULW8C7_jDaIVI</pre>


<h2 id="methods" class="copy-link">Methods</h2>

<p id="insertImage" class="copy-link">When calling the <a href="<%= Url.Action("methods") %>#insertImage">insertImage</a> method to insert an image into the file, the <a href="<%= Url.Action("config/") %>#token">token</a> must be added to validate the parameters.</p>

<p>
    The <em>payload</em> for the JWT token in the JSON format must have the same structure as the method parameter.
    The parameter list to be signed is not strictly regulated, but we recommend that you specify all the parameter sent:
</p>

<pre>
{
    "fileType": "png",
    "url": "https://example.com/url-to-example-image.png"
}
</pre>
<p>
    Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
    See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
</p>

<div class="header-gray">Sample token</div>
<pre>eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6InBuZyIsInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtaW1hZ2UucG5nIn0.FXuC3GUvPq3japwyzo4i-utUe3g1rfSDt1ytuK_VyCc</pre>


<p id="setHistoryData" class="copy-link">When calling the <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> method to view the document <a href="<%= Url.Action("history") %>">history</a> version in ONLYOFFICE Document Server, the <a href="<%= Url.Action("config/") %>#token">token</a> must be added to validate the parameters.</p>

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
<p>
    Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
    See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
</p>

<div class="header-gray">Sample token</div>
<pre>eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaGFuZ2VzVXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tY2hhbmdlcy56aXAiLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwicHJldmlvdXMiOnsia2V5IjoiYWY4NkM3ZTcxQ2E4IiwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tdGhlLXByZXZpb3VzLXZlcnNpb24tb2YtdGhlLWRvY3VtZW50LmRvY3gifSwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1kb2N1bWVudC5kb2N4IiwidmVyc2lvbiI6Mn0.7gaOe1_4OvgRLYD0oGk_bMrVdPaLmgZVNIgQCUQdgoE</pre>


<p id="setMailMergeRecipients" class="copy-link">When calling the <a href="<%= Url.Action("methods") %>#setMailMergeRecipients">setMailMergeRecipients</a> method to insert recipient data for mail merge into the file, the <a href="<%= Url.Action("config/") %>#token">token</a> must be added to validate the parameters.</p>

<p>
    The <em>payload</em> for the JWT token in the JSON format must have the same structure as the method parameter.
    The parameter list to be signed is not strictly regulated, but we recommend that you specify all the parameter sent:
</p>

<pre>
{
    "fileType": "xlsx",
    "url": "https://example.com/url-to-example-recipients.xlsx"
}
</pre>
<p>
    Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
    See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
</p>

<div class="header-gray">Sample token</div>
<pre>eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLXJlY2lwaWVudHMueGxzeCJ9.P3TjOyX1Tv3xAVRAc8qtNb-uFLD6FH_WErag_rbI6nQ</pre>


<p id="setRevisedFile" class="copy-link">When calling the <a href="<%= Url.Action("methods") %>#setRevisedFile">setRevisedFile</a> method to select a document for comparing, the <a href="<%= Url.Action("config/") %>#token">token</a> must be added to validate the parameters.</p>

<p>
    The <em>payload</em> for the JWT token in the JSON format must have the same structure as the method parameter.
    The parameter list to be signed is not strictly regulated, but we recommend that you specify all the parameter sent:
</p>

<pre>
{
    "fileType": "docx",
    "url": "https://example.com/url-to-example-document.docx"
}
</pre>
<p>
    Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
    See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
</p>

<div class="header-gray">Sample token</div>
<pre>eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.t8660n_GmxJIppxcwkr_mUxmXYtE8cg-jF2cTLMtuk8</pre>
