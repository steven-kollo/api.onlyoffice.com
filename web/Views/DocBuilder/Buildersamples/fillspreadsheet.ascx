<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<%@ Register TagPrefix="UserControl"
    TagName="Generator"
    Src="~/Views/DocBuilder/Buildersamples/samplegenerator.ascx" %>

<h1>
    <span class="hdr">Filling Spreadsheet</span>
</h1>
<p>This script fills an empty spreadsheet with data stored in arrays.<br />
    You can edit script, run it again with the <b>start script</b> button and see updated result.</p>
<p>Check <a href="<%= Url.Action("howitworks/globalvariable") %>">Exchanging data among files</a> and <a href="<%= Url.Action("integrationapi/arguments") %>">Using command line arguments</a> to learn more options for passing external data in the DocBuilder script.</p>
<textarea id="builderScript" name="builderScript" data-easy="true" class="docbuilder-script" spellcheck="false"></textarea>



<h2>Resulting document</h2>

<div id="editorSpace">
    <div id="placeholder"></div>
</div>
<script>
    <% var defMethod = DocBuilderDocumentation.Instance.GetSample("fillspreadsheet"); %>
    $("#builderScript").val("<%= Regex.Replace(defMethod.Script.Replace("\"", "\\\""), @"\r\n|\n", "\\n") %>");
</script>
<div id="generator">
    <UserControl:Generator runat="server" docTitle="Spreadsheet with data" documentType="cell" ext="xlsx" />
</div>
