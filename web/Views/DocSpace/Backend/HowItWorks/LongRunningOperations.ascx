<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Long-running operations</span>
</h1>

<p>The user initiates a long-running operation by sending a request to the appropriate API endpoint,
    which returns an object containing information about the initiated operation.
    An <a href="<%= Url.DocUrl("files", null, "put", "api/2.0/files/rooms/{id}/archive", "docspace") %>">example</a> of such a request and response:</p>
<div class="header-gray">Request</div>
<pre>
PUT api/2.0/files/rooms/1234/archive
Host: yourportal.onlyoffice.com
Content-Type: application/json
Accept: application/json

{
  "DeleteAfter": true
}
</pre>

<div class="header-gray">Response</div>
<pre>
{
    "error": "",
    "finished": false,
    "id": "00000000-0000-0000-0000-000000000000",
    "operation": 0,
    "processed": "0",
    "progress": 0
}
</pre>

<p>The following endpoints return the operation status:</p>
<ul>
    <li><a href="<%= Url.DocUrl("files", null, "put", "api/2.0/files/rooms/{id}/archive", "docspace") %>">PUT api/2.0/files/rooms/{id}/archive</a></li>
    <li><a href="<%= Url.DocUrl("files", null, "put", "api/2.0/files/fileops/delete", "docspace") %>">PUT api/2.0/files/fileops/delete</a></li>
    <li><a href="<%= Url.DocUrl("files", null, "delete", "api/2.0/files/file/{fileid}", "docspace") %>">DELETE api/2.0/files/file/{fileid}</a></li>
</ul>

<h2 id="monitoring-operation-status" class="copy-link">Monitoring the operation status</h2>
<p>To track the operation progress, you must periodically execute a GET request to the following <a href="<%= Url.DocUrl("files", null, "get", "api/2.0/files/fileops", "docspace") %>">endpoint</a>:</p>
<pre>
GET api/2.0/files/fileops
</pre>
<p>This request returns an array of the current operations as objects similar to the one described above.</p>
<p>In this array, the ID of the previously initiated operation is returned.
    If <em>finished</em> is not true, or <em>progress</em> or <em>percents</em> is not 100, wait a while and then execute the <em>files/fileops/</em> request again.
    This loop is repeated until the operation completes or the error text appears in the <em>error</em> property.</p>
