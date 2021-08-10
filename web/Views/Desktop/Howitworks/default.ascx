<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">How it works</span>
</h1>

<p class="dscr">This page describes what is going on in ONLYOFFICE Desktop Editors when you work with documents. Learn the information described in this section 
to understand the following processes:</p>
<ul>
    <li><a href="<%= Url.Action("howitworks/encryptinglocaldocuments") %>">Encrypting local documents</a></li>
    <li><a href="<%= Url.Action("howitworks/encryptingclouddocuments") %>">Encrypting cloud documents</a></li>
</ul>
