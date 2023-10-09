<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<%@ Register TagPrefix="UserControl"
    TagName="Generator"
    Src="~/Views/DocBuilder/Buildersamples/samplegenerator.ascx" %>

<h1>
    <a class="up" href="<%= Url.Action("buildersamples/") %>"></a>
    <span class="hdr">Creating mail merge receptions</span>
</h1>
<p class="dscr">Create mail merge receptions in the separate documents:</p>
<ul>
    <li>load mail merge data from the opened <em>xlsx</em> file to the current document (<a href="<%= Url.Action("spreadsheetapi/api/getmailmergedata") %>">Api/GetMailMergeData</a>,
        <a href="<%= Url.Action("textdocumentapi/api/loadmailmergedata") %>">Api/LoadMailMergeData</a>);</li>
    <li>get the mail merge template document (<a href="<%= Url.Action("textdocumentapi/api/getmailmergetemplatedoccontent") %>">Api/GetMailMergeTemplateDocContent</a>);</li>
    <li>count a number of the mail merge receptions (<a href="<%= Url.Action("textdocumentapi/api/getmailmergereceptionscount") %>">Api/GetMailMergeReceptionsCount</a>);</li>
    <li>run the mail merge process for each mail merge reception and save the results to the separate files (<a href="<%= Url.Action("textdocumentapi/api/mailmerge") %>">Api/MailMerge</a>);</li>
    <li>replace the resulting document content after each mail merge action with the mail merge template document content in order to use it later for the next mail merge (<a href="<%= Url.Action("textdocumentapi/api/replacedocumentcontent") %>">Api/ReplaceDocumentContent</a>).</li>
</ul>
<br />
<textarea disabled="disabled" id="builderScript" name="builderScript" data-easy="true" class="docbuilder-script" spellcheck="false"></textarea>

<h2>Resulting document</h2>

<div id="editorSpace">
    <div id="placeholder"></div>
</div>
<script>
    <% var defMethod = DocBuilderDocumentation.Instance.GetSample("mailmergereceptions"); %>
    $("#builderScript").val("<%= Regex.Replace(defMethod.Script.Replace("\"", "\\\""), @"\r\n|\n", "\\n") %>");
</script>
<div id="generator">
    <UserControl:Generator runat="server" docTitle="Reception" runScript="false" documentType="word" ext="docx" template="mail_merge_receptions" />
</div>
