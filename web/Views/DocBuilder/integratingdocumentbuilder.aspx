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

    <p class="dscr">To start integrating <b>ONLYOFFICE Document Builder</b> into your own application you need to do the following:</p>
    <ol>
        <li>
            <p>Download <b>ONLYOFFICE Document Builder</b> application and install it to your computer:</p>
            <a href="https://www.onlyoffice.com/download-builder.aspx?from=api" class="button" target="blank">Get ONLYOFFICE Document Builder</a>
        </li>

        <li>
            <p>Select the programming language and download the code for the sample of <b>ONLYOFFICE Document Builder</b> integration into your application</p>
            <ul class="list-buttons">
                <li>
                    <a class="button" href="https://github.com/ONLYOFFICE/document-builder-integration/releases/latest/download/DotNet.Csharp.Example.zip" target="_blank">DotNet.Csharp.Example</a>
                </li>
                <li>
                    <a class="button" href="https://github.com/ONLYOFFICE/document-builder-integration/releases/latest/download/DotNet.Csharp.MVC.Example.zip" target="_blank">DotNet.Csharp.MVC.Example</a>
                </li>
                <li>
                    <a class="button" href="https://github.com/ONLYOFFICE/document-builder-integration/releases/latest/download/Node.js.Example.zip" target="_blank">Node.js.Example</a>
                </li>
                <li>
                    <a class="button" href="https://github.com/ONLYOFFICE/document-builder-integration/releases/latest/download/PHP.Example.zip" target="_blank">PHP.Example</a>
                </li>
                <li>
                    <a class="button" href="https://github.com/ONLYOFFICE/document-builder-integration/releases/latest/download/Ruby.Example.zip" target="_blank">Ruby.Example</a>
                </li>
            </ul>
        </li>
        <li>
            <p>Run the example on your computer to get acquainted with the basic <b>ONLYOFFICE Document Builder</b> features before you start creating your own application. If everything is alright you will see the example website page with the form elements like the ones below.</p>
        </li>
    </ol>
    <p>Or you can try and write the application yourself using the <a href="<%= Url.Action("framework") %>">Builder.Framework</a>.</p>

</asp:Content>
