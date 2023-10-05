<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">EventListenerPlugin</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugintypes") %>"></a>
</h1>

<p class="dscr">The plugin that is given the access to the portal events.</p>
<p><b>Interface</b>: IEventListenerPlugin.</p>

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
            <td id="eventListenerItems" class="copy-link">eventListenerItems</td>
            <td>Stores a collection of elements where the keys are the <em>key</em> parameters from the <a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems/eventlisteneritem") %>">EventListenerItem</a> objects.
                A list of event listeners is generated based on this collection.</td>
            <td>array of IEventListenerItem</td>
            <td></td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Methods and their description:</h2>
<ul>
    <li>
        <p><b id="addEventListenerItem" class="copy-link">addEventListenerItem</b> - add a new event listener item.</p>
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
                    <td>eventListenerItems</td>
                    <td>Defines an event listener item.</td>
                    <td>IEventListenerItem</td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p><b id="getEventListenerItems" class="copy-link">getEventListenerItems</b> - get all the event listener items.</p>
    </li>
</ul>

<div class="header-gray">Example</div>
<pre>
import {IEventListenerPlugin, IEventListenerItem} from "@onlyoffice/docspace-plugin-sdk";

class Plugin implements IEventListenerPlugin {
    eventListenerItems: Map&lt;string, IEventListenerItem&gt; = new Map();

    addEventListenerItem = (item: IEventListenerItem): void =&gt; {
        this.eventListenerItems.set(item.key, item);
    };

    getEventListenerItems = (): Map&lt;string, IEventListenerItem&gt; =&gt; {
        return this.eventListenerItems;
    };
}
</pre>
