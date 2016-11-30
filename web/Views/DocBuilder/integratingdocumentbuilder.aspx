<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Integrating ONLYOFFICE Document Builder into your own application
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Integrating ONLYOFFICE Document Builder into your own application</span>
    </h1>

    <p class="dscr">To start integrating <b>ONLYOFFICE Document Builder</b> into your own application you need to do the following:</p>
    <ol>
        <li>
            <p>Download <b>ONLYOFFICE Document Builder</b> application and install it to your computer</p>
            <a href="http://www.onlyoffice.com/document-builder.aspx" class="button" target="blank">Download</a>
        </li>
        <li>
            <p>Select the programming language and download the code for the sample of <b>ONLYOFFICE Document Builder</b> integration into your application</p>
            
            <div class="docbuilder_examples_list">
                        <ul class="docbuilder_examples_blocks">
                            <li>
                                <a class="button" href="<%= Url.Content("~/app_data/rails-docbuilder-example-master.zip") %>">Ruby example</a>
                                <a class="db_examples" target="_blank" href="<%= Url.Action("rubyexample") %>">Read instructions</a>
                            </li>
                            <li>
                                <a class="button" href="<%= Url.Content("~/app_data/docbuilder-net-mvc-example.zip") %>">.Net (C# MVC) example</a>
                                <a class="db_examples" target="_blank" href="<%= Url.Action("csharpexample") %>">Read instructions</a>
                            </li>
                            <li>
                                <a class="button" href="<%= Url.Content("~/app_data/docbuilder-net-asp-example.zip") %>">.Net (C#) example</a>
                                <a class="db_examples" target="_blank" href="<%= Url.Action("csharpexample") %>">Read instructions</a>
                            </li>
                        </ul>
                    </div>
        </li>
        <li>
            <p>Run the example on your computer to get acquainted with the basic <b>ONLYOFFICE Document Builder</b> features before you start creating your own application. If everything is alright you will see the example website page with the form elements like the ones below.</p>
        </li>
    </ol>
    <p>Or you can try and write the application yourself using the <a href="<%= Url.Action("integrationapi/cdocbuilder") %>">integration API documentation</a>.</p>
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
    
</asp:Content>
