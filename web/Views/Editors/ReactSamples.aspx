<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    React samples
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%= Html.Partial("ReactSamples/"+ (Model ?? "Default")) %>
</asp:Content>
