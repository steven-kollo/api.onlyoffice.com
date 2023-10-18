<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Button</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents") %>"></a>
</h1>

<p class="dscr">A component that is used for an action on a page.</p>
<p><b>Interface</b>: IButton.</p>
<p>See the parameters of this component in <a href="https://storybook.onlyoffice.io/?path=/docs/components-button--docs" target="_blank">storybook</a>.</p>
<img alt="Button" class="screenshot" src="<%= Url.Content("~/content/img/docspace/button.png") %>" />
<p>To set the button size, use <a href="https://github.com/ONLYOFFICE/onlyoffice-docspace-plugin-sdk/blob/develop/src/interfaces/components/IButton.ts" target="_blank">ButtonSize</a> which can have the following values: <em>extraSmall, small, normal, medium</em>.</p>

<div class="header-gray">Parameters from Storybook</div>
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
            <td id="label" class="copy-link">label</td>
            <td>The button text.</td>
            <td>string</td>
            <td>"Convert file"</td>
        </tr>
        <tr class="tablerow">
            <td id="size" class="copy-link">size</td>
            <td>The button size. The normal size is equal to 36x40 px on the Desktop and Touchcreen devices.
            Can be: <em>extraSmall, small, normal, medium</em>. The default value is <em>extraSmall</em>.</td>
            <td>ButtonSize</td>
            <td>normal</td>
        </tr>
        <tr class="tablerow">
            <td id="onClick" class="copy-link">onClick</td>
            <td>Sets a function which specifies an action initiated upon clicking the button.</td>
            <td>func</td>
            <td>() =&gt; {}</td>
        </tr>
        <tr class="tablerow">
            <td id="primary" class="copy-link">primary</td>
            <td>
                Specifies if the button is primary or not. If the button is primary, it is colored blue.
                <p><img alt="Primary button" class="screenshot" src="<%= Url.Content("~/content/img/docspace/primary-button.png") %>" /></p>
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="scale" class="copy-link">scale</td>
            <td>Specifies if the button  width will be scaled to 100% or not.</td>
            <td>boolean </td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="isLoading" class="copy-link">isLoading</td>
            <td>
                Specifies if the button will be displayed as a loader icon or not.
                <p><img alt="Loading button" class="screenshot" src="<%= Url.Content("~/content/img/docspace/loading-button.png") %>" /></p>
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="isDisabled" class="copy-link">isDisabled</td>
            <td>
                Specifies if the button is disabled or not. The disabled button is blurred.
                <p><img alt="Disabled button" class="screenshot" src="<%= Url.Content("~/content/img/docspace/disabled-button.png") %>" /></p>
            </td>
            <td>boolean  </td>
            <td>false</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Extra parameters</div>
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
            <td id="withLoadingAfterClick" class="copy-link">withLoadingAfterClick</td>
            <td>Specifies whether to set the <a href="#isLoading">isLoading</a> state to the button after it is clicked until the action is completed.</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="disableWhileRequestRunning" class="copy-link">disableWhileRequestRunning</td>
            <td>Specifies whether to set the <a href="#isDisabled">isDisabled</a> state for the button when the <em>withLoadingAfterClick</em> parameter is set to <b>true</b>,
            and it is clicked either on the page or in the dialog box.</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
<pre>
import {IButton, ButtonSize} from "@onlyoffice/docspace-plugin-sdk";

const buttonProps: IButton = {
    "label": "Convert file",
    "primary": true,
    "size": ButtonSize.normal,
    "scale": true,
    "isDisabled": false,
    "withLoadingAfterClick": true,
    "onClick": () =&gt; {},
};
</pre>
