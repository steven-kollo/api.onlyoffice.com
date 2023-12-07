<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">ContextMenuPlugin</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugintypes") %>"></a>
</h1>

<p class="dscr">The plugin that is embedded in the context menu of files, folders, rooms, images, video (audio).</p>
<p><b>Interface</b>: IContextMenuPlugin.</p>

<div class="header-gray">Variables</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td id="contextMenuItems" class="copy-link">contextMenuItems</td>
            <td>Stores a collection of elements where the keys are the <em>key</em> parameters from the <a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems/contextmenuitem") %>">ContextMenuItem</a> objects.
                A list for embedding into the context menu is generated based on this collection.</td>
            <td>collection of IContextMenuItem</td>
            <td></td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Methods and their description:</h2>
<ul>
    <li>
        <p><b id="addContextMenuItem" class="copy-link">addContextMenuItem</b> - add a new context menu item.</p>
        <div class="header-gray">Parameters</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Name</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Example</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>contextMenuItem</td>
                    <td>Defines a context menu item.</td>
                    <td>IContextMenuItem</td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p><b id="getContextMenuItems" class="copy-link">getContextMenuItems</b> - get all the context menu items.</p>
    </li>
    <li>
        <p><b id="getContextMenuItemsKeys" class="copy-link">getContextMenuItemsKeys</b> - get all the keys of the context menu items.</p>
    </li>
    <li>
        <p><b id="updateContextMenuItem" class="copy-link">updateContextMenuItem</b> - update the context menu item.</p>
        <div class="header-gray">Parameters</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Name</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Example</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>contextMenuItem</td>
                    <td>Defines a new context menu item.</td>
                    <td>IContextMenuItem</td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
</ul>

<div class="header-gray">Example</div>
<pre>
import {IContextMenuPlugin, IContextMenuItem} from "@onlyoffice/docspace-plugin-sdk";

class Plugin implements IContextMenuPlugin {
    contextMenuItems: Map&lt;string, IContextMenuItem&gt; = new Map();

    addContextMenuItem = (item: IContextMenuItem): void =&gt; {
        this.contextMenuItems.set(item.key, item);
    };

    getContextMenuItems = (): Map&lt;string, IContextMenuItem&gt; =&gt; {
        return this.contextMenuItems;
    };

    getContextMenuItemsKeys = (): string[] =&gt; {
        const keys = Array.from(this.contextMenuItems).map(([key, item]) =&gt; key);

        return keys;
    };

    updateContextMenuItem = (item: IContextMenuItem): void =&gt; {
        this.contextMenuItems.set(item.key, item);
    };
}
</pre>
