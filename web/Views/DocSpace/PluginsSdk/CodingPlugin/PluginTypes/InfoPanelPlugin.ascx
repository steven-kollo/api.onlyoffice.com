<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">InfoPanelPlugin</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugintypes") %>"></a>
</h1>

<p class="dscr">The plugin that is embedded as a separate tab in the file info panel.</p>
<p><b>Interface</b>: IInfoPanelPlugin.</p>

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
            <td id="infoPanelItems" class="copy-link">infoPanelItems</td>
            <td>Stores a collection of elements where the keys are the key parameters from the <a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems/infopanelitem") %>">InfoPanelItem</a> objects.
                A list for embedding into the info panel is generated based on this collection.</td>
            <td>array of IInfoPanelItem</td>
            <td></td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Methods and their description:</h2>
<ul>
    <li>
        <p><b id="addInfoPanelItem" class="copy-link">addInfoPanelItem</b> - add a new info panel item.</p>
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
                    <td>infoPanelItem</td>
                    <td>Defines an info panel item.</td>
                    <td>IInfoPanelItem</td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p><b id="getInfoPanelItems" class="copy-link">getInfoPanelItems</b> - get all the info panel items.</p>
    </li>
    <li>
        <p><b id="updateInfoPanelItem" class="copy-link">updateInfoPanelItem</b> - update the  info panel item.</p>
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
                    <td>infoPanelItem</td>
                    <td>Defines a new info panel item.</td>
                    <td>IInfoPanelItem</td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
</ul>


<div class="header-gray">Example</div>
<pre>
import {IInfoPanelPlugin, IInfoPanelItem} from "@onlyoffice/docspace-plugin-sdk";

class Plugin implements IInfoPanelPlugin {
    infoPanelItems: Map&lt;string, IInfoPanelItem&gt; = new Map();

    addInfoPanelItem = (item: IInfoPanelItem): void =&gt; {
        this.infoPanelItems.set(item.key, item);
    };

    getInfoPanelItems = (): Map&lt;string, IInfoPanelItem&gt; =&gt; {
        return this.infoPanelItems;
    };

    updateInfoPanelItem = (item: IInfoPanelItem): void =&gt; {
        this.infoPanelItems.set(item.key, item);
    };
}
</pre>
