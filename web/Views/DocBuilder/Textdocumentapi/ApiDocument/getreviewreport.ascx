<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetReviewReport</span>
</h1>

<h4 class="header-gray" id="GetReviewReport">GetReviewReport()</h4>

<p class="dscr">Get a report about every change which was made to the document in the review mode.</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd><em>object</em></dd>
</dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.OpenFile("DocumentWithReview.docx");
var oDocument = Api.GetDocument();
GlobalVariable["ReviewReport"] = oDocument.GetReviewReport();
builder.CloseFile();

builder.CreateFile("docx");
var oReviewReport = GlobalVariable["ReviewReport"];
var oDocument = Api.GetDocument();
var oParagraph = Api.CreateParagraph();
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oDocument.Push(oParagraph);
oParagraph.AddText("Review report");
var nRows = 1;
for (var sUserName in oReviewReport)
{
    nRows += oReviewReport[sUserName].length;
}
nCols = 4;
oTable = Api.CreateTable(nCols, nRows);
oDocument.Push(oTable);
function privateFillCell(nCurRow, nCurCol, sText)
{
    var oRow         = oTable.GetRow(nCurRow);
    var oCell        = oRow.GetCell(nCurCol);
    var oCellContent = oCell.GetContent();
    var oRun         = oCellContent.GetElement(0).AddText(sText);
    return {Cell : oCell, Run : oRun};
}
privateFillCell(0, 0, "Name");
privateFillCell(0, 1, "Date");
privateFillCell(0, 2, "Action");
privateFillCell(0, 3, "");
var nCurRow = 1;
for (var sUserName in oReviewReport)
{
    var arrUserChanges = oReviewReport[sUserName];
    var arrCells = [];
    for (var nIndex = 0, nCount = arrUserChanges.length; nIndex < nCount; ++nIndex, ++nCurRow)
    {
        var oChangeInfo = arrUserChanges[nIndex];
        arrCells.push(privateFillCell(nCurRow, 0, "").Cell);
        privateFillCell(nCurRow, 1, (new Date(oChangeInfo["Date"])).toString());
        var sType = oChangeInfo["Type"];
        if ("TextAdd" === sType)
        {
            privateFillCell(nCurRow, 2, "Added text");
            privateFillCell(nCurRow, 3, oChangeInfo["Value"]);
        }
        else if ("TextRem" === sType)
        {
            privateFillCell(nCurRow, 2, "Removed text");
            privateFillCell(nCurRow, 3, oChangeInfo["Value"]).Run.SetStrikeout(true);
        }
        else if ("TextPr" === sType)
        {
            privateFillCell(nCurRow, 2, "Formatted text");
        }
        else if ("ParaAdd" === sType)
        {
            privateFillCell(nCurRow, 2, "Added paragraph");
        }
        else if ("ParaRem" === sType)
        {
            privateFillCell(nCurRow, 2, "Removed paragraph");
        }
        else if ("ParaPr" === sType)
        {
            privateFillCell(nCurRow, 2, "Formatted paragraph");
        }
        else
        {
            privateFillCell(nCurRow, 2, "Unknown change");
        }
    }
    var oMergedCell = oTable.MergeCells(arrCells);
    if (oMergedCell)
    {
        var oCellContent = oMergedCell.GetContent();
        oCellContent.GetElement(0).AddText(sUserName);
    }
    else if (arrCells.length > 0)
    {
        var oCellContent = arrCells[0].GetContent();
        oCellContent.GetElement(0).AddText(sUserName);
    }
}
oTable.SetStyle(oDocument.GetStyle("Bordered"));
builder.SaveFile("docx", "GetReviewReport.docx");
builder.CloseFile();</pre>

<p>An example of the document with review can be taken <a target="_blank" href="https://bit.ly/2A2axm2">here</a>.</p>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5235513&doc=MGJ2NUl4cUU0ZzVOVE9mcW45WEM4R2h3NVNhNTdxVVlXclZ1VzV4ckdlOD0_IjUyMzU1MTMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
