<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">MainButtonPlugin</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugintypes") %>"></a>
</h1>

<p class="dscr">The plugin that is embedded in the main button.</p>
<p><b>Interface</b>: IMainButtonPlugin.</p>

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
            <td id="mainButtonItems" class="copy-link">mainButtonItems</td>
            <td>Stores a collection of elements where the keys are the <em>key</em> parameters from the <a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems/mainbuttonitem") %>">MainButtonItem</a> objects.
                It can also store <a href="https://github.com/ONLYOFFICE/onlyoffice-docspace-plugin-sdk/blob/develop/src/interfaces/items/ISeparatorItem.ts" target="_blank">ISeparatorItem</a> objects. A list for embedding into the main button menu is generated based on this collection.</td>
            <td>array of IMainButtonItem/ISeparatorItem</td>
            <td></td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Methods and their description:</h2>
<ul>
    <li>
        <p><b id="addMainButtonItem" class="copy-link">addMainButtonItem</b> - add a new main button item.</p>
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
                    <td>mainButtonItems</td>
                    <td>Defines a main button item.</td>
                    <td>IMainButtonItem</td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p><b id="getMainButtonItems" class="copy-link">getMainButtonItems</b> - get all the main button items.</p>
    </li>
    <li>
        <p><b id="updateMainButtonItem" class="copy-link">updateMainButtonItem</b> - update the main button item.</p>
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
                    <td>mainButtonItems</td>
                    <td>Defines a new main button item.</td>
                    <td>IMainButtonItem</td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
</ul>

<div class="header-gray">Example</div>
<pre>
import {IMainButtonPlugin, IMainButtonItem} from "@onlyoffice/docspace-plugin-sdk";

    class Plugin implements IMainButtonPlugin{
        mainButtonItems: Map&lt;string, IMainButtonItem&gt; = new Map();

        addMainButtonItem = (item: IMainButtonItem): void =&gt; {
        this.mainButtonItems.set(item.key, item);
    };

    getMainButtonItems = (): Map&lt;string, IMainButtonItem&gt; =&gt; {
        return this.mainButtonItems;
    };

    updateMainButtonItem = (item: IMainButtonItem): void =&gt; {
        this.mainButtonItems.set(item.key, item);
    };
}
</pre>
