<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetClassType</span>
</h1>

<h4 class="header-gray" id="GetClassType">GetClassType() &rarr; {"style"}</h4>
<p class="dscr">Get the type of this class.</p>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type
                </dt>
                <dd>
                    <em>"style"</em>
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
var oClassType = oTableStyle.GetClassType();
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Class Type = " + oClassType);
builder.SaveFile("docx", "GetClassType.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896260&doc=bmN3dGlKZXp1WXFLcXJrZzB5Q2ZQcEtBbktmRmVkNWMwcllsUHBhQ01CWT0_IjQ4OTYyNjAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>