<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetName</span>
</h1>

<h4 class="header-gray" id="GetName">GetName() &rarr; {string}</h4>
<p class="dscr">Get the name of the current style.</p>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type
                </dt>
                <dd>
                    <em>string</em>
                </dd>
            </dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oTable, oTableStyle;
oTableStyle = oDocument.GetStyle("Bordered - Accent 5");
oTableStyle.SetName("My Custom Style");
oTable = Api.CreateTable(2, 2);
oTable.SetWidth("percent", 100);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
var oTableStyleName = oTableStyle.GetName();
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Table style name = " + oTableStyleName);
builder.SaveFile("docx", "ApiStyle.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896261&doc=V29laXVJK0Q2RWVUL0NROWJYZytKS1c4bUsvTVRTM0RaUkNFWkx5RkJIND0_IjQ4OTYyNjEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
