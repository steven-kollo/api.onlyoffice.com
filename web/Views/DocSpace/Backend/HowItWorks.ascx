<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">How it works</span>
</h1>

<p class="dscr">This page describes what is going on in ONLYOFFICE DocSpace when you work with documents. Learn the information described in this section to understand the following processes:</p>
<ul>
    <li><a href="<%= Url.Action("backend/howitworks/auth") %>">Passing authentication</a></li>
    <li><a href="<%= Url.Action("backend/howitworks/longrunningoperations") %>">Long-running operations</a></li>
    <li><a href="<%= Url.Action("backend/howitworks/uploadinglargefiles") %>">Uploading large files</a></li>
    <li><a href="<%= Url.Action("backend/howitworks/webhooks") %>">Webhooks</a></li>
</ul>
