<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Getting started
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Getting started</span>
    </h1>
    <h2>How it works?</h2>
    <p class="dscr">As any document is a composite object consisting of a tree of larger nodes (paragraphs and tables), where it is possible to insert smaller document elements (text runs, images, charts, shapes), <b>ONLYOFFICE Document Builder</b> allows to insert the content and format it to your liking quickly and easily.</p>
    <p><b>ONLYOFFICE Document Builder</b> is a C++ library used to create and edit Office Open XML format files (documents, spreadsheets and presentations) and save them to DOCX, XSLX, PPTX and PDF formats. You can integrate this library into your own presentation or use the provided executive binary wrapper for an easy start.</p>
    <p>To launch <b>ONLYOFFICE Document Builder</b> run the following command:</p>
    <pre>
docbuilder.exe mydocument.docbuilder
    </pre>
    <p>Here <b>docbuilder.exe</b> is the name of <b>ONLYOFFICE Document Builder</b> (together with the path, if the command is run from the folder different from where the executive is placed) executive file (it will look like <b>docbuilder.exe</b> for Windows version, <b>documentbuilder</b> for Linux and Mac OS), and the <b>mydocument.docbuilder</b> parameter is the name (again, together with the path, if needed) of the script file that will form the document contents.</p>
    <p>Read the <a href="<%= Url.Action("integrationapi/cdocbuilder") %>">Integration</a> section for more information on how to integrate <b>ONLYOFFICE Document Builder</b> into your own application.</p>
    <h2>Where to start?</h2>
    <p>If you are not sure where to start, you can use the list of most common tasks below to find where to go and start creating your document:</p>
</asp:Content>
