<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">ProfileMenuPlugin</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugintypes") %>"></a>
</h1>

<p class="dscr">The plugin that is embedded in the profile menu.</p>
<p><b>Interface</b>: IProfileMenuPlugin.</p>

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
            <td id="profileMenuItems" class="copy-link">profileMenuItems</td>
            <td>Stores a collection of elements where the keys are the <em>key</em> parameters from the <a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems/profilemenuitem") %>">ProfileMenuItem</a> objects.
                A list for embedding into the profile menu is generated based on this collection.</td>
            <td>collection of IProfileMenuItem</td>
            <td></td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Methods and their description:</h2>
<ul>
    <li>
        <p><b id="addProfileMenuItem" class="copy-link">addProfileMenuItem</b> - add a new  profile menu item.</p>
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
                    <td>profileMenuItems</td>
                    <td>Defines a profile menu item.</td>
                    <td>IProfileMenuItem</td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p><b id="getProfileMenuItems" class="copy-link">getProfileMenuItems</b> - get all the profile menu items.</p>
    </li>
    <li>
        <p><b id="updateProfileMenuItem" class="copy-link">updateProfileMenuItem</b> - update the profile menu item.</p>
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
                    <td>profileMenuItems</td>
                    <td>Defines a new profile menu item.</td>
                    <td>IProfileMenuItem</td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
</ul>

<div class="header-gray">Example</div>
<pre>
import {IProfileMenuPlugin, IProfileMenuItem} from "@onlyoffice/docspace-plugin-sdk";

class Plugin implements IProfileMenuPlugin{
    profileMenuItems: Map&lt;string, IProfileMenuItem&gt; = new Map();

    addProfileMenuItem = (item: IProfileMenuItem): void =&gt; {
        this.profileMenuItems.set(item.key, item);
    };

    getProfileMenuItems = (): Map&lt;string, IProfileMenuItem&gt; =&gt; {
        return this.profileMenuItems;
    };

    updateProfileMenuItem = (item: IProfileMenuItem): void =&gt; {
        this.profileMenuItems.set(item.key, item);
    };
}
</pre>
