<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<%@ Register TagPrefix="UserControl"
    TagName="Generator"
    Src="~/Views/DocBuilder/Buildersamples/samplegenerator.ascx" %>

<h1>
    <span class="hdr">Filling form</span>
</h1>
<p>This script fills <a href="<%= Url.Action("buildersamples/createadvancedform") %>">advanced form</a> from another builder sample with data stored in an object.<br />
    You can edit script, run it again with the <b>start script</b> button and see updated result.</p>
<p>Check <a href="<%= Url.Action("howitworks/globalvariable") %>">Exchanging data among files</a> and <a href="<%= Url.Action("integrationapi/arguments") %>">Using command line arguments</a> to learn more options for passing external data in the DocBuilder script.</p>

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
    <% var defMethod = DocBuilderDocumentation.Instance.GetSample("fillform"); %>
    $("#builderScript").val("<%= Regex.Replace(defMethod.Script.Replace("\"", "\\\""), @"\r\n|\n", "\\n") %>");
</script>
<div id="generator">
    <UserControl:Generator runat="server" docTitle="Filled form" documentType="word" ext="docx" template="empty_form" zoom="80" />
</div>
