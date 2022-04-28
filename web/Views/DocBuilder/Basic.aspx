<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Overview
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Overview</span>
    </h1>

    <span class="pvl_product">ONLYOFFICE DocumentBuilder</span><span class="pvl_version">v<%= Products.Get("docbuilder").Version %></span>

    <p class="dscr">
        <b>ONLYOFFICE Document Builder</b> allows you to build a document easily without the need to actually run a document processing editor.
         It also allows the developers to automate document building using the templates you create or inserting the data from some database of yours into a document or a set of documents. It has all the features of a common document editor but is lightweight and can be easily integrated into your document management system, CRM system, etc. using its JavaScript API.
    </p>

    <%
        Html.RenderPartial("DocBuilderShared/DocBuilderAction");
    %>

    <h2>Want to learn how it works?</h2>
    <p><a href="<%= Url.Action("gettingstarted") %>">Get started here</a> and find out the main principles of <b>ONLYOFFICE Document Builder</b> work, or read the <a href="<%= Url.Action("integrationapi") %>">Integration API</a>, <a href="<%= Url.Action("textdocumentapi") %>">Text document API</a>, <a href="<%= Url.Action("spreadsheetapi") %>">Spreadsheet API</a>, <a href="<%= Url.Action("presentationapi") %>">Presentation API</a> or <a href="<%= Url.Action("formsapi") %>">Forms API</a> articles to find out how to automate your document creation using <b>ONLYOFFICE Document Builder</b>.</p>

    <h2>Get help</h2>

    <p>If you have any questions or feature requests about ONLYOFFICE Document Builder, please visit <a href="https://github.com/ONLYOFFICE/DocumentBuilder/issues" target="_blank">GitHub</a>.</p>
    <p>You can also ask our developers on <a href="https://forum.onlyoffice.com/c/document-builder/37" target="_blank">ONLYOFFICE forum</a> (registration required).</p>

</asp:Content>
