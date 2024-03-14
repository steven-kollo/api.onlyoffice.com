<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="IndexHead" ContentPlaceHolderID="HeadContent" runat="server">
    <%= Styles.Render("~/content/plugins-and-macros") %>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Macro examples
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%= Html.Partial("macros/macrosamples/"+ (Model ?? "default")) %>
</asp:Content>
