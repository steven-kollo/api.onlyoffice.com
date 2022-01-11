<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Changelog
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Changelog</span>
    </h1>

    <p class="dscr">The list of changes for ONLYOFFICE Document Builder API.</p>
    <h2 id="70" class="copy-link">Version 7.0</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apirun/getprevious") %>">ApiRun/GetPrevious</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apirun/getnext") %>">ApiRun/GetNext</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/api/convertdocument") %>">Api/ConvertDocument</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/tohtml") %>">ApiDocument/ToHtml</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/tomarkdown") %>">ApiDocument/ToMarkdown</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#SortOrientation">SortOrientation</a> global type.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#SortHeader">SortHeader</a> global type.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#SortOrder">SortOrder</a> global type.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/setsort") %>">ApiRange/SetSort</a> method to Spreadsheet API.</li>
    </ul>

    <h2 id="64" class="copy-link">Version 6.4</h2>
    <ul>
        <li>Changed the return value of the <a href="<%= Url.Action("textdocumentapi/api/createrange") %>">Api/CreateRange</a> method of Text document API.</li>
        <li>Deleted the <em>Api/GetFirstRunInArray</em> method from Text document API.</li>
        <li>Deleted the <em>Api/GetLastRunInArray</em> method from Text document API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("textdocumentapi/apichart/setlegendfontsize") %>">ApiChart/SetLegendFontSize</a> method of Text document API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("textdocumentapi/apidocument/getelement") %>">ApiDocument/GetElement</a> method of Text document API.</li>
        <li>Added the return value to the <a href="<%= Url.Action("textdocumentapi/apidocument/push") %>">ApiDocument/Push</a> method of Text document API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getelement") %>">ApiDocumentContent/GetElement</a> method of Text document API.</li>
        <li>Added the return value to the <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/push") %>">ApiDocumentContent/Push</a> method of Text document API.</li>
        <li>Deleted parameters from the <a href="<%= Url.Action("textdocumentapi/apirange/select") %>">ApiRange/Select</a> method of Text document API.</li>
        <li>Added the <em>oCell</em> parameter to the <a href="<%= Url.Action("textdocumentapi/apitable/addelement") %>">ApiTable/AddElement</a> method of Text document API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("spreadsheetapi/api/getrange") %>">Api/GetRange</a> method of Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apicomment/getclasstype") %>">ApiComment/GetClassType</a> method to Spreadsheet API.</li>
        <li>Deleted the <em>ApiDocument/Last</em> method from Spreadsheet and Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/getcols") %>">ApiRange/GetCols</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/end") %>">ApiRange/End</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/getcells") %>">ApiRange/GetCells</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/getorientation") %>">ApiRange/GetOrientation</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/setorientation") %>">ApiRange/SetOrientation</a> method to Spreadsheet API.</li>
        <li>Added the <em>Cols</em> and <em>Orientation</em> properties to the <a href="<%= Url.Action("spreadsheetapi/apirange") %>">ApiRange</a> object of Spreadsheet API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("spreadsheetapi/apiworksheet/getcells") %>">ApiWorksheet/GetCells</a> method of Spreadsheet API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("presentationapi/api/creategroup") %>">Api/CreateGroup</a> method of Presentation API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("presentationapi/apichart/setlegendfontsize") %>">ApiChart/SetLegendFontSize</a> method of Presentation API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("presentationapi/apipresentation/replacecurrentimage") %>">ApiPresentation/ReplaceCurrentImage</a> method of Presentation API.</li>
    </ul>

</asp:Content>
