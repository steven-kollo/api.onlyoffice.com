<%@  Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ONLYOFFICE macros
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">ONLYOFFICE macros</span>
    </h1>

    <p class="dscr">In ONLYOFFICE editors macros are small scripts used to facilitate your day-to-day routine work with different types of documents. Macros use JavaScript language syntax and <b>ONLYOFFICE Document Builder</b> <a href="<%= Url.Action("basic", "docbuilder") %>">API</a> scripting notation, thus the methods available in JavaScript and all the methods supported by <b>ONLYOFFICE Document Builder</b> are also supported by macros.</p>

    <p>You can add your own macros to documents (all document types are supported: text, spreadsheet, presentation), edit, save them with the document - anything to make your work with document files easier and more convenient.</p>

    <h2>Getting started with macros</h2>

    <p>Macro is a JavaScript function linked with a document. The simplest function which will insert the "Hello world!" phrase into the text document when run, will look like this:</p>

    <pre>(function()
{
    var oDocument = Api.GetDocument();
    var oParagraph = Api.CreateParagraph();
    oParagraph.AddText("Hello world!");
    oDocument.InsertContent([oParagraph]);
})();</pre>

    <p>In the desktop editor interface this will look the following way:</p>

    <p><img alt="Macros window" src="<%= Url.Content("~/content/img/plugins/macros.png") %>" /></p>

    <p>To access macros, open or create a document of the necessary type, click the <img alt="Plugin button" src="<%= Url.Content("~/content/img/plugins/plugin-button.png") %>" />
        plugin button and select <b>Macros</b>. The macros window will be opened. Click <b>New</b> and enter your script code into the right-side window. When ready, click <b>Run</b> to run your code onto the document.</p>

    <p>That's it, really easy.</p>

    <p>You can also rename your macro, to distinguish it from the other ones in case they are used in the same document, or delete the unnecessary ones.</p>

</asp:Content>
