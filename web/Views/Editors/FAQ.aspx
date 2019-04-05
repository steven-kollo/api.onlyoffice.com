<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>
<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="FaqHead" ContentPlaceHolderID="HeadContent" runat="server">
    <%= Scripts.Render("~/bundles/faq") %>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Frequently asked questions
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%= Html.Partial("FAQ/"+ (Model ?? "Default")) %>
</asp:Content>
