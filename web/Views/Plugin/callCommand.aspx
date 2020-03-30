<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    callCommand
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <a class="up" href="<%= Url.Action("plugin") %>"></a>
        <span class="hdr">window.Asc.plugin.callCommand(fCommand, isClose)</span>
    </h1>

    <div class="header-gray">Description</div>

    <p class="dscr">Defines the method used to send the data back to the editor. It replaces the <a href="<%= Url.Action("executeCommand") %>">executeCommand</a> method when working with texts in order to simplify the syntax of the script that is necessary to pass to the editors using <b>ONLYOFFICE Document Builder</b> <a href="<%= Url.Action("basic", "docbuilder") %>">API</a>. It allows the plugin to send structured data that can be inserted to the resulting document file (formatted paragraphs, tables, text parts and separate words, etc.).</p>

    NB:<div class="note"><b>ONLYOFFICE Document Builder</b> commands can be only used to create content and insert it to the document editor (using the <em>Api.GetDocument().InsertContent(...))</em>. This limitation exists due to the co-editing feature in the online editors. If it is necessary to create a plugin for desktop editors to work with local files, no such limitation is applied.</div>

    <div class="header-gray">Parameters</div>

    <table class="table">
        <colgroup>
            <col style="width: 100px;" />
            <col />
            <col style="width: 100px;" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Description</td>
                <td>Type</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td>fCommand</td>
                <td>The command JavaScript code, which forms the structured data which can be inserted to the resulting document file (formatted paragraphs, tables, text parts and single words, etc.) to be sent to the editors. Must be compatible with <a href="<%= Url.Action("basic", "docbuilder") %>">ONLYOFFICE Document Builder</a> syntax.</td>
                <td>string</td>
            </tr>
            <tr class="tablerow">
                <td>isClose</td>
                <td>Specifies either the plugin window must be closed after the code execution or be left open and wait for some other command or action. The <em>true</em> value is used to close the plugin window after executing the function in the <em>fCommand</em> parameter. The <em>false</em> is used to execute the command and leave the window open, awaiting for the next command.</td>
                <td>boolean</td>
            </tr>
        </tbody>
    </table>

    <p>The <em>window.Asc.plugin.callCommand</em> method is executed in its own context, isolated from other JavaScript code data. If you want to pass some parameters or other data to it, you will need to use the <a href="<%= Url.Action("scope") %>">Asc.scope</a> object for that.</p>

    <div class="header-gray">Example</div>

    <pre>
window.Asc.plugin.init = function () {
    this.callCommand(function() {
        var oDocument = Api.GetDocument();
        var oParagraph = Api.CreateParagraph();
        oParagraph.AddText("Hello world!");
        oDocument.InsertContent([oParagraph]);
    }, true);
};
</pre>

</asp:Content>
