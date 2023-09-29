<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<%@ Register TagPrefix="UserControl"
    TagName="Generator"
    Src="~/Views/DocBuilder/Buildersamples/samplegenerator.ascx" %>

<h1>
    <a class="up" href="<%= Url.Action("buildersamples/") %>"></a>
    <span class="hdr">Creating chart presentation</span>
</h1>
<p class="dscr">Create a chart presentation:</p>
<ul>
    <li>get first slide in the current presentation (<a href="<%= Url.Action("presentationapi/api/createslide") %>">Api/CreateSlide</a>,
        <a href="<%= Url.Action("presentationapi/api/getpresentation") %>">Api/GetPresentation</a>, <a href="<%= Url.Action("presentationapi/apipresentation/getslidebyindex") %>">ApiPresentation/GetSlideByIndex</a>);</li>
    <li>set the background gradient (<a href="<%= Url.Action("presentationapi/apigradientstop") %>">PresentationApi/ApiGradientStop</a>,
        <a href="<%= Url.Action("presentationapi/apislide/setbackground") %>">ApiSlide/SetBackground</a>);</li>
    <li>set the slide title and text in the specified style (<a href="<%= Url.Action("presentationapi/api/createparagraph") %>">Api/CreateParagraph</a>, 
        <a href="<%= Url.Action("presentationapi/api/createshape") %>">Api/CreateShape</a>,<a href="<%= Url.Action("presentationapi/apiparagraph/addtext") %>">ApiParagraph/AddText</a>,
        <a href="<%= Url.Action("presentationapi/apiparagraph/setjc") %>">ApiParagraph/SetJc</a>, <a href="<%= Url.Action("presentationapi/apiparagraph/setspacingafter") %>">ApiParagraph/SetSpacingAfter</a>,
        <a href="<%= Url.Action("presentationapi/apiparagraph/setspacingbefore") %>">ApiParagraph/SetSpacingBefore</a>, <a href="<%= Url.Action("presentationapi/apirun/setbold") %>">ApiRun/SetBold</a>,
        <a href="<%= Url.Action("presentationapi/apirun/setfill") %>">ApiRun/SetFill</a>, <a href="<%= Url.Action("presentationapi/apirun/setfontfamily") %>">ApiRun/SetFontFamily</a>,
        <a href="<%= Url.Action("presentationapi/apirun/setfontsize") %>">ApiRun/SetFontSize</a>, <a href="<%= Url.Action("presentationapi/apishape/getdoccontent") %>">ApiShape/GetDocContent</a>, <a href="<%= Url.Action("presentationapi/apislide/addobject") %>">ApiSlide/AddObject</a>);</li>
    <li>create and apply the chart (<a href="<%= Url.Action("presentationapi/api/createchart") %>">Api/CreateChart</a>, <a href="<%= Url.Action("presentationapi/apislide/addobject") %>">ApiSlide/AddObject</a>)</li>

</ul>
<br />

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
<div id="generator">
    <UserControl:Generator runat="server" docTitle="Chart presentation" documentType="slide" ext="pptx" zoom="40" />
</div>
