﻿<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>
<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<MsDocEntryPoint>>"
%>

<% var entryPoints = Model as List<MsDocEntryPoint>; %>

<div class="treeheader">Get Started</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("basic") %>">Basic concepts</a>
    </li>
    <li>
        <a href="<%= Url.Action("auth") %>">Passing authentication</a>
    </li>
</ul>

<% if (entryPoints != null && entryPoints.Any())
   { %>
<div class="treeheader">API backend</div>
<ul class="side-nav root">
    <% foreach (var entryPoint in entryPoints.OrderBy(x => x.Name).ToList())
       { %>
    <li>
        <a href="<%= Url.DocUrl(entryPoint, null, "docspace") %>"><%= entryPoint.Name %></a>
        <% var categories = entryPoint.Methods.Where(x => !string.IsNullOrEmpty(x.Category)).GroupBy(x => x.Category).OrderBy(x => x.Key).ToList(); %>
        <% var rootMethods = entryPoint.Methods.Where(x => string.IsNullOrEmpty(x.Category)).OrderBy(x => x.FunctionName).ToList(); %>
        <% if (categories.Any() || rootMethods.Any()) { %>
        <ul>
            <% if (categories.Any()) { %>
                <% foreach (var category in categories)
                   { %>
                    <li>
                        <a href="<%= Url.DocUrl(entryPoint.Name, category.Key, null, null, "docspace") %>"><%= category.Key %></a>
                        <% var methods = category.OrderBy(x => x.FunctionName).ToList(); %>
                        <% if (methods.Any()) { %>
                            <ul>
                                <% foreach (var method in methods) { %>
                                    <li>
                                        <a href="<%= Url.DocUrl(entryPoint, method, "docspace") %>"><%= method.FunctionName %></a>
                                    </li>
                                <% } %>
                            </ul>
                        <% } %>
                    </li>
                <% } %>
            <% } %>
            <% if (rootMethods.Any()) { %>
                <% foreach (var method in rootMethods)
                   { %>
                    <li>
                        <a href="<%= Url.DocUrl(entryPoint, method, "docspace") %>"><%= method.FunctionName %></a>
                    </li>
                <% } %>
            <% } %>
        </ul>
        <% } %>
    </li>
    <% } %>
</ul>
<% } %>

<div class="treeheader">API system</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("apisystem/") %>">Basic concepts</a>
    </li>
    <li>
        <a href="<%= Url.Action("apisystem/authentication") %>">Authentication</a>
    </li>
    <li>
        <a href="<%= Url.Action("apisystem/portalsection") %>">Portals</a>
        <ul>
            <li>
                <a href="<%= Url.Action("apisystem/portalsection/portalget") %>">Get portals</a>
            </li>
            <li>
                <a href="<%= Url.Action("apisystem/portalsection/portalregister") %>">Register portal</a>
            </li>
            <li>
                <a href="<%= Url.Action("apisystem/portalsection/portalremove") %>">Portal deletion</a>
            </li>
            <li>
                <a href="<%= Url.Action("apisystem/portalsection/portalstatus") %>">Portal status</a>
            </li>
            <li>
                <a href="<%= Url.Action("apisystem/portalsection/validateportalname") %>">Validate portal name</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("apisystem/tariffsection") %>">Billing</a>
        <ul>
            <li>
                <a href="<%= Url.Action("apisystem/tariffsection/tariffget") %>">Get tariff</a>
            </li>
            <li>
                <a href="<%= Url.Action("apisystem/tariffsection/tariffset") %>">Set tariff</a>
            </li>
        </ul>
    </li>
</ul>


<div class="treeheader">Frame SDK</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("framesdk/") %>">Basic concepts</a>
    </li>
    <li>
        <a href="<%= Url.Action("framesdk/initmethods") %>">Initialization methods</a>
        <ul>
            <li>
                <a href="<%= Url.Action("framesdk/initmethods/initeditor") %>">initEditor</a>
            </li>
            <li>
                <a href="<%= Url.Action("framesdk/initmethods/initeditorviewer") %>">initEditorViewer</a>
            </li>
            <li>
                <a href="<%= Url.Action("framesdk/initmethods/initfileselector") %>">initFileSelector</a>
            </li>
            <li>
                <a href="<%= Url.Action("framesdk/initmethods/initmanager") %>">initManager</a>
            </li>
            <li>
                <a href="<%= Url.Action("framesdk/initmethods/initroomselector") %>">initRoomSelector</a>
            </li>
            <li>
                <a href="<%= Url.Action("framesdk/initmethods/initsystem") %>">initSystem</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("framesdk/config") %>">Config</a>
    </li>
</ul>


<div class="treeheader">More information</div>
<ul class="side-nav root">
    <li>
        <a href="/docspace-storybook" target="_blank">Storybook</a>
    </li>
    <li>
        <a href="<%= Url.Action("faq") %>">FAQ</a>
    </li>
    <li>
        <a href="<%= Url.Action("filters") %>">Filtering</a>
    </li>
    <li>
        <a href="<%= Url.Action("batch") %>">Batching</a>
    </li>
</ul>
