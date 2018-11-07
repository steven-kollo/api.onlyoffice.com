<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Using .docbuilder file</span>
</h1>

<h2 id="DocbuilderStructure">Structure used for .docbuilder file</h2>
            <p class="dscr">All <b>.docbuilder</b> files have simple structure which allows to create them easily. They consist of the following main parts each of them having the appropriate <a href="<%= Url.Action("integrationapi/cdocbuilder") %>">CDocBuilder</a> class method used:</p>
            <ol>
                <li>Preparing to work with the document (either the <a href="<%= Url.Action("integrationapi/cdocbuilder/createfile") %>">CDocBuilder.CreateFile</a> or <a href="<%= Url.Action("integrationapi/cdocbuilder/openfile") %>">CDocBuilder.OpenFile</a> methods are used together with the <a href="<%= Url.Action("integrationapi/cdocbuilder/settmpfolder") %>">CDocBuilder.SetTmpFolder</a> method).
<pre>builder.SetTmpFolder("DocBuilderTemp");
builder.CreateFile("docx");</pre>
                </li>
                <li>Creating the document contents with the help of the <a href="<%= Url.Action("integrationapi/cdocbuilder/executecommand") %>">CDocBuilder.ExecuteCommand</a> method (the method is not used explicitly, the commands themselves are used instead).
<pre>var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = Api.CreateParagraph();
oParagraph.SetJc("center");
oParagraph.AddText("Center");
oDocument.Push(oParagraph);</pre>
                </li>
                <li>Saving the document (using the <a href="<%= Url.Action("integrationapi/cdocbuilder/savefile") %>">CDocBuilder.SaveFile</a> method) and releasing it to finish work with it (the <a href="<%= Url.Action("integrationapi/cdocbuilder/closefile") %>">CloseFile</a> method).
<pre>builder.SaveFile("pdf", "images.pdf");
builder.CloseFile();</pre>
                </li>
            </ol>
            <h2 id="DocbuilderRules">Rules for .docbuilder file</h2>
            <p>There are a few rules used for <b>.docbuilder</b> script file creation for them to work correctly:</p>            
                <ul>
                    <li>The file encoding is always <b>UTF8</b>.</li>
                    <li>All the commands containing <em>builder.</em> are line separated, i.e. you cannot write them in one line, each command <b>must</b> start with its own line.</li>
                    <li>All the common JavaScript commands and methods must be used inside the <em>builder.CreateFile()</em> and <em>builder.SaveFile()</em> lines, otherwise an error will be thrown when executing the code.</li>
                    <li>The comments are allowed. Any line starting with <em>#</em> or <em>//</em> is considered to be a comment.</li>
                    <li>Empty lines are allowed. You can enter any number of empty lines to separate the blocks, the parser will ignore them.</li>
                    <li>All the <em>CDocBuilder</em> methods (except the <a href="<%= Url.Action("integrationapi/cdocbuilder/executecommand") %>">CDocBuilder.ExecuteCommand</a>) are started with <em>builder</em>.</li>
                    <li>The <a href="<%= Url.Action("integrationapi/cdocbuilder/executecommand") %>">CDocBuilder.ExecuteCommand</a> method is not used explicitly, the command itself is used instead. This is done to avoid the parsing complexity and allow the use of common JavaScript commands and methods.</li>
                    <li>The <a href="<%= Url.Action("integrationapi/cdocbuilder/runtexta") %>">CDocBuilder.RunTextA</a>, <a href="<%= Url.Action("integrationapi/cdocbuilder/runtextw") %>">CDocBuilder.RunTextW</a>, <a href="<%= Url.Action("integrationapi/cdocbuilder/initialize") %>">CDocBuilder.Initialize</a> and <a href="<%= Url.Action("integrationapi/cdocbuilder/dispose") %>">CDocBuilder.Dispose</a> methods are not used in <b>.docbuilder</b> files.</li>
                    <li>All the methods in <b>.docbuilder</b> file (except the ones listed above) are used the same way as in C++ code. See the list of the methods below to find more on each of them.</li>
                </ul>            
            <p>Thus the example of the complete working <b>.docbuilder</b> file is available below.</p>

            <h2>Example</h2>
<pre>builder.SetTmpFolder("DocBuilderTemp");
builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.SetJc("center");
oParagraph.AddText("Center");
builder.SaveFile("pdf", "images.pdf");
builder.CloseFile();</pre>
    
