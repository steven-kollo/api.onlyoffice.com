<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Input</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents") %>"></a>
</h1>

<p class="dscr">Input field for single-line strings.</p>
<p><b>Interface</b>: IInput.</p>
<p>See the parameters of this component in <a href="https://storybook.onlyoffice.io/?path=/docs/components-textinput--docs" target="_blank">storybook</a>.</p>
<img alt="Input" class="screenshot" src="<%= Url.Content("~/content/img/docspace/input.png") %>" />
<p>To change the input size, use <b>InputSize</b> (<em>base, middle, big, huge, large</em>), for the input types, use <b>InputType</b> (<em>text</em> or <em>password</em>),
    and for the autocomplete feature, use <b>InputAutocomplete</b> (<em>on</em> or <em>off</em>).
    More information can be found <a href="https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/interfaces/components/IInput.ts" target="_blank">here</a>.</p>

<div class="header-gray">Example</div>
<pre>
import {IInput, InputSize, InputType, IMessage, Actions, InputAutocomplete} from "@onlyoffice/docspace-plugin-sdk";

const onChange = (value: string) =&gt; {
    input.value = value;

    const message: IMessage = {
        "actions": [Actions.updateProps],
        "newProps": input,
    };

        return message;
};

const input: IInput = {
    "value": "",
    onChange,
    "scale": true,
    "size": InputSize.base,
    "type": InputType.text,
    "autoComplete": InputAutocomplete.off,
};
</pre>
