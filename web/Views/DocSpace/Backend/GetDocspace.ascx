<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="System.Web.Optimization" %>

<h1>
    <span class="hdr">Get ONLYOFFICE DocSpace</span>
</h1>

<%= Styles.Render("~/content/get-docs") %>

<p class="dscr">
    <a href="https://www.onlyoffice.com/download-docspace.aspx?from=api#docspace-enterprise" target="_blank">ONLYOFFICE DocSpace</a> is available for Windows, Linux and Docker.
</p>

<p>To install it on your local server, follow the instructions in <b>ONLYOFFICE Help Center</b>:</p>
<ul class="get-docs-block">
    <li class="get-docs-option">
        <a href="https://helpcenter.onlyoffice.com/installation/docspace-enterprise-install-windows.aspx?from=api" target="_blank"><div class="get-docs-img windows"></div></a>
        <p class="get-docs-link"><a href="https://helpcenter.onlyoffice.com/installation/docspace-enterprise-install-windows.aspx?from=api" target="_blank">Get ONLYOFFICE DocSpace for Windows</a></p>
    </li>
    <li class="get-docs-option">
        <a href="https://helpcenter.onlyoffice.com/installation/docspace-enterprise-install-script.aspx?from=api" target="_blank"><div class="get-docs-img linux"></div></a>
        <p class="get-docs-link"><a href="https://helpcenter.onlyoffice.com/installation/docspace-enterprise-install-script.aspx?from=api" target="_blank">Get ONLYOFFICE DocSpace for Linux</a></p>
    </li>
    <li class="get-docs-option">
        <a href="https://helpcenter.onlyoffice.com/installation/docspace-enterprise-install-script.aspx?from=api" target="_blank"><div class="get-docs-img docker"></div></a>
        <p class="get-docs-link"><a href="https://helpcenter.onlyoffice.com/installation/docspace-enterprise-install-script.aspx?from=api" target="_blank">Get ONLYOFFICE DocSpace for Docker</a></p>
    </li>
</ul>
