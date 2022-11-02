<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("macrosamples/") %>"></a>
    <span class="hdr">Unhide all rows and columns</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">This macro unhides all the rows and columns in the active spreadsheet.</p>

<pre>(function()
{
  var activeSheet = Api.ActiveSheet;
  var indexRowMax = 1048576;
  var n = 1;
    for (let i = 0; i < indexRowMax; i++) {
        activeSheet.GetRows(n).SetHidden(false);
        n++;
    }
})();</pre>

<p>Methods used:
<a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "docbuilder") %>">GetActiveSheet</a>,
<a href="<%= Url.Action("spreadsheetapi/apirange/getrows", "docbuilder") %>">GetRows</a>,
<a href="<%= Url.Action("spreadsheetapi/apirange/sethidden", "docbuilder") %>">SetHidden</a>,
<a href="<%= Url.Action("spreadsheetapi/api/getrange", "docbuilder") %>">GetRange</a>,
<a href="<%= Url.Action("spreadsheetapi/apirange/setvalue", "docbuilder") %>">SetValue</a>
</p>

<div class="header-gray">Result</div>
</br >
<img alt="Next blank row" src="<%= Url.Content("~/content/img/plugins/unhide_all_rows.png") %>" />
