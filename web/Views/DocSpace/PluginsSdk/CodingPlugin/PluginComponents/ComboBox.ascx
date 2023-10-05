<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">ComboBox</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents") %>"></a>
</h1>

<p class="dscr">Custom combo box input.</p>
<p><b>Interface</b>: IComboBox.</p>
<p>See the parameters of this component in <a href="https://storybook.onlyoffice.io/?path=/docs/components-combobox--docs" target="_blank">storybook</a>.</p>
<img alt="Combo box" class="screenshot" src="<%= Url.Content("~/content/img/docspace/combobox.png") %>" />
<p>To create a combo box option, use <a href="https://github.com/ONLYOFFICE/onlyoffice-docspace-plugin-sdk/blob/develop/src/interfaces/components/IComboBox.ts" target="_blank">IComboBoxItem</a>.</p>

<div class="header-gray">Example</div>
<pre>
import {IComboBox, IComboBoxItem, Actions, IMessage} from "@onlyoffice/docspace-plugin-sdk";

const options: IComboBoxItem[] = [
    {"key": "auto", "label": "Auto"},
    {"key": "en", "label": "English"},
    {"key": "es", "label": "Español"},
    {"key": "eu", "label": "Euskara"},
];

const onSelect = (option: IComboBoxItem) =&gt; {
    comboBox.selectedOption = option;

    const message: IMessage = {
        "actions": [Actions.updateProps],
        "newProps": langComboBox,
    };

    return message;
};

const comboBox: IComboBox = {
    options,
    "selectedOption": options[0],
    onSelect,
    "scaled": true,
    "dropDownMaxHeight": 400,
    "directionY": "both",
    "scaledOptions": true,
};
</pre>
