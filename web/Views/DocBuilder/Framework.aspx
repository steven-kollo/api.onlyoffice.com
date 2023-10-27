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

    <p><b>Builder.Framework</b> is a software tool that contains a collection of libraries, classes, and functions that are used to develop applications.</p>
    <p>When you integrate <b>ONLYOFFICE Document Builder</b> into your C++, COM, or .Net application, you can embed the code for <b>ONLYOFFICE Document Builder</b> together
        with the script code for the document files to be created into your application. In this case you will need to recompile your application each time anything is to be changed
        in the output document files. This option is good when you need a faster native application and you are sure that the resulting document files will always stay the same
        or will only be changed when you recompile your application anyway.</p>
    <p>Currently, the following frameworks are available: <a href="<%= Url.Action("integrationapi/c") %>">C++</a>, <a href="<%= Url.Action("integrationapi/com") %>">COM</a>, <a href="<%= Url.Action("integrationapi/net") %>">.Net</a>.</p>


</asp:Content>
