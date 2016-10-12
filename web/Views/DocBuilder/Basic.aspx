<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ONLYOFFICE Document Builder
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">ONLYOFFICE Document Builder</span>
    </h1>

    <p class="dscr"><b>ONLYOFFICE Document Builder</b> allows you to build a document easily without the need to actually run a document processing editor. It also allows the developers to automate document building using the templates you create or inserting the data from some database of yours into a document or a set of documents. It has all the features of a common document editor but is lightweight and can be easily integrated into your document management system, CRM system, etc. using its JavaScript API.</p>

    <h1>ONLYOFFICE Document Builder in action</h1>

    <p>This is a live example of how <b>ONLYOFFICE Document Builder</b> works. You may upload your own script for documents using the <b>Upload your own script</b> button and selecting the necessary file on your PC.</p>

    <h2>Generate a document from the script below, edit it or upload your own script</h2>

    <p>Use the script in the textarea below as is to generate the document or you edit it in the textarea window. Or, in case you have a script of your own, use the button under the textarea to upload it.</p>
    
    <pre>
builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Dear John Smith.");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("ONLYOFFICE is glad to announce that starting today, you are appointed Commercial director to the company of your dream.");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oRun = Api.CreateRun();
oRun.SetBold(true);
oRun.AddText("Please note: ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.AddText("this text is used to demonstrate the possibilities of ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.SetBold(true);
oRun.AddText("ONLYOFFICE Document Builder");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.AddText(" and cannot be used as real appointment to the position in any real company.");
oParagraph.AddElement(oRun);
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Best regards,");
oParagraph.AddLineBreak();
oParagraph.AddText("ONLYOFFICE Document Builder Team");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SampleText.docx");
builder.CloseFile();
</pre>
    <h2>Or create a new file from a sample script with your own data</h2>
    <p>Fill the data into the text areas below so that it could appear in the output document. When done use the buttons to the right of the fields to create the appropriate document type with your entered data.</p>
    <h2>Want to learn how it works?</h2>
    <p>Get started here and find out the main principles of <b>ONLYOFFICE Document Builder</b> work, or read the Integration API, Text document API, Spreadsheet API or Presentation API articles to find out how to automate your document creation using <b>ONLYOFFICE Document Builder</b>.</p>
</asp:Content>
