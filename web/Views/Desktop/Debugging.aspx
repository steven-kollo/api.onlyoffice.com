<%@  Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Debugging
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Debugging</span>
    </h1>

    <p>To run ONLYOFFICE Desktop Editors in debug mode, launch it with <em>--ascdesktop-support-debug-info</em> flag.</p>
    <p>Here is the result:</p>
    <img alt="Debug" src="<%= Url.Content("~/content/img/desktop/debug.png") %>" />
    
</asp:Content>
