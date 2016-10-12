<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    executeCommand
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <a class="up" href="<%= Url.Action("plugin") %>"></a>
        <span class="hdr">window.Asc.plugin.executeCommand(type, command)</span>
    </h1>

    <div class="header-gray">Description</div>

    <p class="dscr">Used to send the data back to the editor.</p>

    <p>The second parameter is the JavaScript code for work with <b>ONLYOFFICE Document Builder</b> <a href="https://helpcenter.onlyoffice.com/developers/document-builder/index.aspx">API</a>, which allows the plugin to send structured data which can be inserted to the resulting document file (formatted paragraphs, tables, text parts and single words, etc.).</p>

    <div class="note"><b>ONLYOFFICE Document Builder</b> commands can be only used to create content and insert it to the document editor (using the <em>Api.GetDocument().InsertContent(...))</em>. This limitation is made due to the co-editing possibility in online editors. If you create a plugin for desktop editors working with local files, no such limitation is applied.</div>

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
                <td>type</td>
                <td>The command type. The <em>"close"</em> is used to close the plugin window after executing the function in the <em>command</em> parameter. The <em>"command"</em> is used to execute the command and leave the window open, awaiting for the next command.</td>
                <td>string</td>
            </tr>
            <tr class="tablerow">
                <td>command</td>
                <td>The command JavaScript code, which forms the structured data which can be inserted to the resulting document file (formatted paragraphs, tables, text parts and single words, etc.) to be sent to the editors. Must be compatible with <a href="https://helpcenter.onlyoffice.com/developers/document-builder/index.aspx">ONLYOFFICE Document Builder</a> syntax.</td>
                <td>string</td>
            </tr>
        </tbody>
    </table>

    <p>When creating/editing OLE objects, two extensions are used to work with OLE objects:</p>

    <ul>
        <li><em>Api.asc_addOleObject(window.Asc.plugin.info)</em> - used to create an OLE object in the document;</li>
        <li><em>Api.asc_editOleObject(window.Asc.plugin.info)</em> - used to edit the created OLE object.</li>
    </ul>

    <p>When you create/edit the objects, you can pass their properties to the <a href="<%= Url.Action("info") %>">window.Asc.plugin.info</a> object which is responsible for how the object looks like.</p>

    <div class="header-gray">Example text</div>

    <pre>
window.Asc.plugin.init = function () {
    var sScript = 'var oDocument = Api.GetDocument();';
    sScript += 'oDocument.CreateNewHistoryPoint();';
    sScript += 'oParagraph = Api.CreateParagraph();';
    sScript += 'oParagraph.AddText(\'Hello word!\');';
    sScript += 'oDocument.InsertContent([oParagraph]);';
    window.Asc.plugin.info.recalculate = true;
    this.executeCommand("close", sScript);
};
</pre>

    <div class="header-gray">Example OLE object</div>

    <pre>
window.Asc.plugin.button = function (id) {
    var _info = window.Asc.plugin.info;
    var _method = (_info.objectId === undefined) ? "asc_addOleObject" : "asc_editOleObject";
    _info.width = _info.width ? _info.width : 70;
    _info.height = _info.height ? _info.height : 70;
    _info.widthPix = (_info.mmToPx * _info.width) >> 0;
    _info.heightPix = (_info.mmToPx * _info.height) >> 0;
    _info.imgSrc = window.g_board.getResult(_info.widthPix, _info.heightPix).image;
    _info.data = window.g_board.getData();
    var _code = "Api." + _method + "(" + JSON.stringify(_info) + ");";
    this.executeCommand("close", _code);
};
</pre>
</asp:Content>
