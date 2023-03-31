<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Billing</span>
</h1>

<table class="table hover">
    <colgroup>
        <col class="table-name" />
        <col />
        <col />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Method</td>
            <td>Resource</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("apisystem/tariffsection/tariffget") %>">Get tariff</a></td>
            <td><a href="<%= Url.Action("apisystem/tariffsection/tariffget") %>">GET /api/tariff/get</a></td>
            <td>Portal pricing plan change.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("apisystem/tariffsection/tariffset") %>">Set tariff</a></td>
            <td><a href="<%= Url.Action("apisystem/tariffsection/tariffset") %>">PUT /api/tariff/set</a></td>
            <td>Portal pricing plan change.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
