<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<%@ Register TagPrefix="UserControl"
             TagName="Generator"
             Src="~/Views/DocBuilder/Buildersamples/samplegenerator.ascx" %>

    <h1>
        <span class="hdr">Creating chart presentation</span>
    </h1>
    <p>You can do this for the that with the method to use its script in the text area below. Or, in case you have a script of your own, use the button under the text area to upload it. You can select the necessary editor.</p>

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
        <% var defMethod = DocBuilderDocumentation.Instance.GetSample("createchartpresentation"); %>
        $("#builderScript").val("<%= Regex.Replace(defMethod.Script.Replace("\"", "\\\""), @"\r\n|\n", "\\n") %>");
    </script>
    <div id="generator"><UserControl:Generator runat="server" /></div>
