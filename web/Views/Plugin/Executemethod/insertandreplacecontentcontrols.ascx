<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod(InsertAndReplaceContentControls, [args])</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">This method inserts a content control that contains data. The data is specified by the <em>js</em> code for <a href="<%= Url.Action("basic", "docbuilder") %>">Document Builder</a>, or by the link to a shared document.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod("InsertAndReplaceContentControls", [obj]);
</pre>
<p>Where <em>obj</em> is a JSON array:</p>
<pre>
[
    {"Props" : 
      {   
        "Id" : Number,
        "Tag" : "{String}",   
        "Lock" : Number 
      }, 
    "Script" : "var oDocument = Api.GetDocument();var oParagraph = Api.CreateParagraph();oParagraph.AddText('Hello world!');oDocument.InsertContent([oParagraph]);" 
    }
]
</pre>
<p>Each new element in the array will create a new content control.</p>
<pre>
[ {"Props": {...}, "Url": "http://"}, {"Props": {...}, "Url": "http://."}, {...}, {...}]
</pre>
<p>The <em>Props</em> key has the values that can be the following:</p>
<ul>
    <li>"Id" (e.g. <em>{"Id": 2}</em> ) is a unique identifier of the content control. It can be used to search for a certain content control and make reference to it in your code.</li>
    <li>"Tag" ( e.g. <em>{"Tag": "String"}</em> ) is a tag assigned to the content control. One and the same tag can be assigned to several content controls so that you can make reference to them in your code.</li>
    <li>"Lock" (e.g. <em>{"Lock": 0}</em> ) is a value that defines if it is possible to delete and/or edit the content control or not. The values can be the following:</li>
</ul>
<table class="table">
       <thead>
            <tr class="tablerow">
                <td>Numeric value</td>
                <td>Edit</td>
                <td>Delete</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td><b>0</b></td>
                <td>No</td>
                <td>Yes</td>
            </tr>
            <tr class="tablerow">
                <td><b>1</b></td>
                <td>No</td>
                <td>No</td>
            </tr>
            <tr class="tablerow">
                <td><b>2</b></td>
                <td>Yes</td>
                <td>No</td>
            </tr>
            <tr class="tablerow">
                <td><b>3</b></td>
                <td>Yes</td>
                <td>Yes</td>
            </tr>
        </tbody>
</table>

<p>Besides the <em>Props</em> key, there must be a Key/Value pair containing the <em>Url</em> or <em>Script</em> key, that defines the data that will be contained in the content control. If the <em>Url</em> key is used, its value must be a link to a shared file. If the <em>Script</em> key is used, its value must be a script that will be executed to generate the data within the content control.</p>

<div class="header-gray">Example 1</div>

<pre>
{"Url":"https://personal.onlyoffice.com/products/files/httphandlers/filehandler.ashx?action=view&fileid=1617658&version=0&doc=aEE1OEk0THZWakI4bC9Ydm1CaFdQaGRpOFdLMURzaUFkV3cvRFlXS1dUND0_IjE2MTc2NTgi0"}
</pre>

<div class="header-gray">Example 2</div>

<pre>
"Script" : "var oDocument = Api.GetDocument();
var oParagraph=Api.CreateParagraph();
oParagraph.AddText('Helloworld!');
oDocument.InsertContent([oParagraph]);"
</pre>

<div class="header-gray">Returns</div>

<p>The method returns the data which the created content control contains (in JSON format)</p>
<pre>
[{"Tag":"Document","Id":0,"Lock":0,"InternalId":"1_713"}]
</pre>