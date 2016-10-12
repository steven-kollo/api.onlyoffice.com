<%@ Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="treeheader">Get Started</div>
<ul class="side-nav treeview root">
    <li>
        <a href="<%= Url.Action("basic") %>">Introduction</a>
    </li>
</ul>

<div class="treeheader">Documentation</div>
<ul class="side-nav treeview root">
    <li>
        <a href="<%= Url.Action("structure") %>">Plugin structure</a>
        <ul class="treeview">
            <li>
                <a href="<%= Url.Action("config") %>">config.json</a>
            </li>
            <li>
                <a href="<%= Url.Action("indexhtml") %>">index.html</a>
            </li>
            <li>
                <a href="<%= Url.Action("code") %>">Plugin code</a>
            </li>
            <li>
                <a href="<%= Url.Action("plugin") %>">window.Asc.plugin object</a>
                <ul class="treeview">
                    <li>
                        <a href="<%= Url.Action("button") %>">button</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("executecommand") %>">executeCommand</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("info/") %>">info object</a>
                        <ul class="treeview">
                            <li>
                                <a href="<%= Url.Action("info/data") %>">data</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("info/editorType") %>">editorType</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("info/guid") %>">guid</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("info/height") %>">height</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("info/imgsrc") %>">imgSrc</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("info/mmtopx") %>">mmToPx</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("info/objectId") %>">objectId</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("info/recalculate") %>">recalculate</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("info/resize") %>">resize</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("info/width") %>">width</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="<%= Url.Action("init") %>">init</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("onExternalMouseUp") %>">onExternalMouseUp</a>
                    </li>
                </ul>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("installation") %>">Plugin installation</a>
    </li>
    <li>
        <a href="<%= Url.Action("example") %>">Plugin example</a>
    </li>
</ul>
