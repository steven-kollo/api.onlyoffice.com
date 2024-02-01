<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Checkbox</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents") %>"></a>
</h1>

<p class="dscr">Custom checkbox input.</p>
<p><b>Interface</b>: ICheckBox.</p>
<p>See the parameters of this component in <a href="https://storybook.onlyoffice.io/?path=/docs/components-checkbox--docs" target="_blank">storybook</a>.</p>
<img alt="Checkbox" class="screenshot" src="<%= Url.Content("~/content/img/docspace/checkbox.png") %>" />

<div class="header-gray">Example</div>
<pre>
import {ICheckbox, IMessage, Actions} from "@onlyoffice/docspace-plugin-sdk";

const onChange = () =&gt; {
    cbProps.isChecked = !cbProps.isChecked;

    const message: IMessage = {
        "actions": [Actions.updateProps],
        "newProps": cbProps,
    };

    return message;
};

const cbProps: ICheckbox = {
    "label": "Checkbox",
    "title": "Checkbox",
    "isChecked": false,
    onChange,
};
</pre>
