<%@  Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Getting started with macros
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Getting started with macros</span>
    </h1>

    <p class="dscr">In ONLYOFFICE editors macros are small scripts used to facilitate your day-to-day routine work with different types of documents.
        Macros use JavaScript language syntax and <b>ONLYOFFICE Document Builder</b> <a href="<%= Url.Action("basic", "docbuilder") %>">API</a> scripting notation,
        thus the methods available in JavaScript and all the methods supported by <b>ONLYOFFICE Document Builder</b> are also supported by macros.</p>

    <p>You can add your own macros to documents (all document types are supported: text, spreadsheet, presentation), edit, save them with the document -
        anything to make your work with document files easier and more convenient.</p>

    <p>Let&#8217;s see how to write the simplest <b>Hello world!</b> macro, which inserts the <em>Hello World!</em> phrase into the document.</p>
    <ol>
        <li>
            <p>Open or create a document of the necessary type, click the <b>Macros</b> button on the <b>Plugins</b> tab.
                The macros window will be opened. Click <b>New</b> to create a new macro.</p>
        </li>
        <li>
            <p>Explore the <b>ONLYOFFICE Document Builder</b> <a href="<%= Url.Action("basic", "docbuilder") %>">API documentation</a> first to see
                which methods you need to complete the task.</p>
            <p>The following methods will be used for the <b>Hello world!</b> macro:</p>
            <ul>
                <li><a href="<%= Url.Action("textdocumentapi/api/getdocument", "docbuilder") %>">GetDocument</a></li>
                <li><a href="<%= Url.Action("textdocumentapi/api/createparagraph", "docbuilder") %>">CreateParagraph</a></li>
                <li><a href="<%= Url.Action("textdocumentapi/apiparagraph/addtext", "docbuilder") %>">AddText</a></li>
                <li><a href="<%= Url.Action("textdocumentapi/apidocument/insertcontent", "docbuilder") %>">InsertContent</a></li>
            </ul>
        </li>
        <li>
            <p>Write code for your macro. It will look like this:</p>
            <pre>
(function(){
    oDocument = Api.GetDocument();
    oParagraph = Api.CreateParagraph();
    oParagraph.AddText("Hello world!");
    oDocument.InsertContent([oParagraph]);
})();
</pre>
        </li>
        <li>
            <p>That’s it! When ready, click <b>Run</b> to run your code onto the document and make sure it works as you expected.
                If not, try to find and fix a bug and run it again. The result will look the following way:</p>
            <img alt="Macros window" src="<%= Url.Content("~/content/img/plugins/macro-window.png") %>" />
        </li>
    </ol>

    <p>You can also <b>rename</b> your macro to distinguish it from the other ones in case they are used in the same document, or <b>delete</b> the unnecessary ones.</p>

    <note>Unlike plugins, macros are attached to a specific document and there is no possibility to make them global.</note>

</asp:Content>
