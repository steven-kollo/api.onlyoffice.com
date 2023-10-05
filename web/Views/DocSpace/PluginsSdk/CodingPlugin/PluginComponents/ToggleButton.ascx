<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">ToggleButton</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents") %>"></a>
</h1>

<p class="dscr">Custom toggle button input.</p>
<p><b>Interface</b>: IToggleButton.</p>
<p>See the parameters of this component in <a href="https://storybook.onlyoffice.io/?path=/docs/components-togglebutton--docs" target="_blank">storybook</a>.</p>
<img alt="Toggle button" class="screenshot" src="<%= Url.Content("~/content/img/docspace/toggle-button.png") %>" />

<div class="header-gray">Example</div>
<pre>
import {IToggleButton, IMessage, Actions} from "@onlyoffice/docspace-plugin-sdk";

const onChange = () =&gt; {
    toggleButtonProps.isChecked = !toggleButtonProps.isChecked;

    const message: IMessage = {
        "actions": [Actions.updateProps],
        "newProps": toggleButtonProps,
    };

    return message;
};

const libToggleButtonProps: IToggleButton = {
    "isChecked": false,
    onChange,
    style: {"position": "relative", "gap": "0px"},
};
</pre>
