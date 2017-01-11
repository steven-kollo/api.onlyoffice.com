<%@ Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>" %>

<h1>ONLYOFFICE Document Builder in action</h1>

<p>This is a live example of how <b>ONLYOFFICE Document Builder</b> works. You may upload your own script for documents using the <b>Upload your own script</b> button and selecting the necessary file on your PC.</p>

<h2>Generate a document from the script below, edit it or upload your own script</h2>

<p>Use the script in the textarea below as is to generate the document or you edit it in the textarea window. Or, in case you have a script of your own, use the button under the textarea to upload it.</p>


<% Html.BeginForm("DocBuilderGenerate", "docbuilder", new { actionName = Html.GetCurrentAction() }, FormMethod.Post); %>

<textarea id="builderScript" name="builderScript" class="builder-code">
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
builder.CloseFile();</textarea>

<button type="submit" id="generateButton" class="builder-run">
    Generate<br />
    document</button>

<% Html.EndForm(); %>


<p>
    <a id="builderFileLink" class="button">Upload your own script</a>
    <input type="file" id="builderFile" />
</p>

<h2>Or create a new file from a sample script with your own data</h2>

<p>Fill the data into the text areas below so that it could appear in the output document. When done use the buttons to the right of the fields to create the appropriate document type with your entered data.</p>


<% Html.BeginForm("DocBuilderCreate", "docbuilder", new { actionName = Html.GetCurrentAction() }, FormMethod.Post); %>

<div class="clearfix">
    <div class="own-data">
        <label>Name: </label>
        <input type="text" name="name" class="clearfix" placeholder="John Smith" />
        <label>Company: </label>
        <input type="text" name="company" class="clearfix" placeholder="ONLYOFFICE" />
        <label>Position/Title: </label>
        <input type="text" name="title" class="clearfix" placeholder="Commercial director" />
    </div>

    <button type="submit" id="createPdf" name="format" value="pdf" class="builder-run">
        Create<br />
        PDF</button>
    <button type="submit" id="createXlsx" name="format" value="xlsx" class="builder-run">
        Create<br />
        spreadsheet</button>
    <button type="submit" id="createDocx" name="format" value="docx" class="builder-run">
        Create<br />
        document</button>
</div>
<% Html.EndForm(); %>
