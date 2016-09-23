<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Troubleshooting
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Troubleshooting</span>
    </h1>
    <p class="dscr">The most common problems with the editors integration and the ways to solve them.</p>

    <h2 id="download">Download failed</h2>
    <img alt="Download failed" src="<%= Url.Content("~/content/img/editor/e-download.png") %>" />
    <p>The "Download failed" message is displayed at the editors loading process.</p>
    <p>The <b>Document editing service</b> cannot upload the file for editing.</p>
    <p>Check if the link to the file specified in the <a href="<%= Url.Action("config/document") %>#url" class="underline">document.url</a> is correct. The link must be accessible from the <b>document editing service</b>.</p>

    <h2 id="callbackurl">No changes</h2>
    <p>When closing the editor after the editing, the file is unchanged in the <b>document manager</b>.</p>
    <p>The <b>document editing service</b> could not send the data to the <b>document storage service</b>.</p>
    <p>Check if the <a href="<%= Url.Action("config/editor") %>#callbackUrl" class="underline">editorConfig.callbackUrl</a> link is correct. The saving in the <b>document manager</b> must be implemented through the <a href="<%= Url.Action("callback") %>#implement" class="underline">Callback handler</a></p>

    <h2 id="error0">Could not be saved</h2>
    <img alt="Could not be saved" src="<%= Url.Content("~/content/img/editor/e-error0.png") %>" />
    <p>The editor is loaded with the "The document could not be saved" message.</p>
    <p>The <b>document editing service</b> cannot connect to the <b>document storage service</b> at the <a href="<%= Url.Action("config/editor") %>#callbackUrl" class="underline">editorConfig.callbackUrl</a> address.</p>
    <p>Check if the <a href="<%= Url.Action("callback") %>#implement" class="underline">Callback handler</a> is working correctly. The <b>document storage service</b> must return <a href="<%= Url.Action("callback") %>#error-0" class="underline">{"error": 0}</a> in response.</p>

    <h2 id="key">The file version has been changed</h2>
    <img alt="The file version has been changed" src="<%= Url.Content("~/content/img/editor/e-key.png") %>" />
    <p>The editor is loaded with the "The file version has been changed. The page will be reloaded" message.</p>
    <p>The <b>document editing service</b> cannot open the previously edited and saved file for editing.</p>
    <p>Do not forget that every time the document is edited and saved, the <a href="<%= Url.Action("config/document") %>#key" class="underline">document.key</a> must be generated anew.</p>

    <h2 id="coedit">No collaborative editing</h2>
    <img alt="No collaborative editing" src="<%= Url.Content("~/content/img/editor/e-coedit.png") %>" />
    <p>No co-editing is available when the document is opened for editing by different users.</p>
    <p>The <b>document editing service</b> opens <b>two different</b> files for editing.</p>
    <p>Check if the <a href="<%= Url.Action("config/document") %>#key" class="underline">document.key</a> values coincide to be able to co-edit the same document. The <em>key</em> value must change after the save, must differ for different documents and coincide when co-editing one and the same document.</p>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptPlaceholder"></asp:Content>
