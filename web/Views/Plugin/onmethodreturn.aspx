<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    onMethodReturn
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <a class="up" href="<%= Url.Action("plugin") %>"></a>
        <span class="hdr">window.Asc.plugin.onMethodReturn</span>
    </h1>

    <div class="header-gray">Description</div>

    <p class="dscr">The <em>window.Asc.plugin</em> object method that allows to return the result of the previously executed method. It can be used to return data after the execution of the <a href="<%= Url.Action("executemethod") %>">executeMethod(...)</a> method.</p>

    <div class="header-gray">Usage</div>
    <p>This method should be used in the following way:</p>

    <pre>window.Asc.plugin.onMethodReturn = function(returnValue){...}</pre>

    <div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod("InsertAndReplaceContentControls", [_obj]);
 window.Asc.plugin.onMethodReturn = function(returnValue) {
  if (window.Asc.plugin.info.methodName == "InsertAndReplaceContentControls") {
   window.Asc.plugin.executeMethod("GetAllContentControls");
 } else if("GetAllContentControls") {
   window.Asc.plugin.executeCommand("close", console.log(JSON.stringify(returnValue)));
  } 
 };
</pre>
</asp:Content>
