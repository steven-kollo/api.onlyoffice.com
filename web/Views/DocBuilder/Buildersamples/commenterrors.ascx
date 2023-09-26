<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<%@ Register TagPrefix="UserControl"
    TagName="Generator"
    Src="~/Views/DocBuilder/Buildersamples/samplegenerator.ascx" %>

<h1>
    <span class="hdr">Commenting spreadsheet errors</span>
</h1>
<p>This script checks all used cells for formula errors like "#DIV/0!" and comments each error. After script finishing you can simply find and fix errors.<br />
    You can edit script, run it again with the <b>start script</b> button and see updated result.</p>
<textarea id="builderScript" name="builderScript" data-easy="true" class="docbuilder-script" spellcheck="false"></textarea>

<ul class="list-buttons doc-builder-list-buttons">
    <li>
        <a id="startButton" class="button red">Start script</a>
    </li>
    <li>
        <a id="clearButton" class="button">Clear</a>
    </li>
</ul>

<h2>Resulting document</h2>

<div id="editorSpace">
    <div id="placeholder"></div>
</div>
<script>
    <% var defMethod = DocBuilderDocumentation.Instance.GetSample("commenterrors"); %>
    $("#builderScript").val("<%= Regex.Replace(defMethod.Script.Replace("\"", "\\\""), @"\r\n|\n", "\\n") %>");
</script>
<div id="generator">
    <UserControl:Generator runat="server" docTitle="Data with comments" documentType="cell" ext="xlsx" template="data_with_errors" />
</div>
