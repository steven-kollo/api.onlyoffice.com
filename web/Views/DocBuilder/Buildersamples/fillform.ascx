<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<%@ Register TagPrefix="UserControl"
    TagName="Generator"
    Src="~/Views/DocBuilder/Buildersamples/samplegenerator.ascx" %>

<h1>
    <a class="up" href="<%= Url.Action("buildersamples/") %>"></a>
    <span class="hdr">Filling form</span>
</h1>
<p class="dscr">Fill a form with data stored in the object:</p>
<ul>
    <li>open existing form and get all forms (<a href="<%= Url.Action("textdocumentapi/apidocument/getallforms") %>">ApiDocument/GetAllForms</a>);</li>
    <li>run a loop for each form, check the form type an set data corresponding to the form key (<a href="<%= Url.Action("textdocumentapi/apiformbase/getformtype") %>">ApiFormBase/GetFormType</a>, 
        <a href="<%= Url.Action("textdocumentapi/apiformbase/getformkey") %>">ApiFormBase/GetFormKey</a>, <a href="<%= Url.Action("textdocumentapi/apipictureform/setimage") %>">ApiPictureForm/SetImage</a>, <a href="<%= Url.Action("textdocumentapi/apicomboboxform/settext") %>">ApiComboBoxForm/SetText</a>)</li>
</ul>

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
