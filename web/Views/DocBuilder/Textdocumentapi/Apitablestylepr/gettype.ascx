<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetType</span>
</h1>

<h4 class="header-gray" id="GetType">GetType() &rarr; {<a href="<%= Url.Action("global") %>#TableStyleOverrideType">TableStyleOverrideType</a>}</h4>
<p class="dscr">Get the type of the current table conditional style.</p>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type
                </dt>
                <dd>
                    <a href="<%= Url.Action("global") %>#TableStyleOverrideType">TableStyleOverrideType</a>
                </dd>
            </dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oTable, oTableStyle, oTableStylePr;
oTableStyle = oDocument.GetStyle("Bordered - Accent 5");
oTableStyle.SetName("My Custom Style");
oTable = Api.CreateTable(2, 2);
oTable.SetWidth("percent", 100);
oTableStylePr = oTableStyle.GetConditionalTableStyle("topLeftCell");
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
var oTableStylePrType = oTableStylePr.GetType();
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Style type = " + oTableStylePrType);
builder.SaveFile("docx", "GetType.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<p>The resulting sample document will be available here with the nearest ONLYOFFICE Document Builder API documentation website update.</p>