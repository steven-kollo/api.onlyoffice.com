<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetType</span>
</h1>

<h4 class="header-gray" id="GetType">GetType() &rarr; {<a href="<%= Url.Action("global") %>#StyleType">StyleType</a>}</h4>
<p class="dscr">Get the type of the current style.</p>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type
                </dt>
                <dd>
                    <a href="<%= Url.Action("global") %>#StyleType">StyleType</a>
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
var oTableStyleType = oTableStyle.GetType();
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Style type = " + oTableStyleType);
builder.SaveFile("docx", "GetType.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896267&doc=dDVhYzdTWTlIbk94a3R1WFI5QVN2UEFSTldPNlQ4aEdZT0FKbWZNOERQQT0_IjQ4OTYyNjci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>