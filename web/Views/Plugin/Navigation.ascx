<%@ Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="treeheader">Get Started</div>
<ul class="side-nav treeview root">
    <li>
        <%= Html.MenuActionLink("Introduction", "basic", "plugin", "selected") %>
    </li>
</ul>

<div class="treeheader">Documentation</div>
<ul class="side-nav treeview root">
    <li>
        <%= Html.MenuActionLink("Plugin structure", "structure", "plugin", "selected") %>
        <ul class="treeview">
            <li>
                <%= Html.MenuActionLink("config.json", "config", "plugin", "selected") %>
            </li>
            <li>
                <%= Html.MenuActionLink("index.html", "indexhtml", "plugin", "selected") %>
            </li>
            <li>
                <%= Html.MenuActionLink("Plugin code", "code", "plugin", "selected") %>
            </li>
            <li>
                <%= Html.MenuActionLink("window.Asc.plugin object", "plugin", "plugin", "selected") %>
                <ul class="treeview">
                    <li>
                        <%= Html.MenuActionLink("button", "button", "plugin", "selected") %>
                    </li>
                    <li>
                        <%= Html.MenuActionLink("executeCommand", "executecommand", "plugin", "selected") %>
                    </li>
                    <li>
                        <%= Html.MenuActionLink("info object", "info/", "plugin", "selected") %>
                        <ul class="treeview">
                            <li>
                                <%= Html.MenuActionLink("data", "info/data", "plugin", "selected") %>
                            </li>
                            <li>
                                <%= Html.MenuActionLink("editorType", "info/editorType", "plugin", "selected") %>
                            </li>
                            <li>
                                <%= Html.MenuActionLink("guid", "info/guid", "plugin", "selected") %>
                            </li>
                            <li>
                                <%= Html.MenuActionLink("height", "info/height", "plugin", "selected") %>
                            </li>
                            <li>
                                <%= Html.MenuActionLink("imgSrc", "info/imgsrc", "plugin", "selected") %>
                            </li>
                            <li>
                                <%= Html.MenuActionLink("mmToPx", "info/mmToPx", "plugin", "selected") %>
                            </li>
                            <li>
                                <%= Html.MenuActionLink("objectId", "info/objectId", "plugin", "selected") %>
                            </li>
                            <li>
                                <%= Html.MenuActionLink("recalculate", "info/recalculate", "plugin", "selected") %>
                            </li>
                            <li>
                                <%= Html.MenuActionLink("resize", "info/resize", "plugin", "selected") %>
                            </li>
                            <li>
                                <%= Html.MenuActionLink("width", "info/width", "plugin", "selected") %>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <%= Html.MenuActionLink("init", "init", "plugin", "selected") %>
                    </li>
                    <li>
                        <%= Html.MenuActionLink("onExternalMouseUp", "onExternalMouseUp", "plugin", "selected") %>
                    </li>
                </ul>
            </li>
        </ul>
    </li>
    <li>
        <%= Html.MenuActionLink("Plugin installation", "installation", "plugin", "selected") %>
    </li>
    <li>
        <%= Html.MenuActionLink("Plugin example", "example", "plugin", "selected") %>
    </li>
</ul>
