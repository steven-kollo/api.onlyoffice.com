<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("SetProperties", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows setting the properties to the document.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("SetProperties", [obj]);
</pre>
<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col style="width: 100px;" />
        <col />
        <col style="width: 100px;" />
        <col style="width: 150px;" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Parameter</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>obj</td>
            <td>
                The document properties. This object can have the following values:
                <ul>
                    <li>
                        <b>copyoutenabled</b> disables copying from the editor if it is set to <b>false</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: false;
                        <br />
                    </li>
                    <li>
                        <b>hideContentControlTrack</b> disables tracking the content control if it is set to <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                        <br />
                    </li>
                    <li>
                        <b>watermark_on_draw</b> - a string value for <a href="#watermark-properties">watermark properties</a> in JSON format,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "{watermark}".
                        <br />
                    </li>
                    <li>
                        <b>disableAutostartMacros</b> sets a flag that specifies that macros are started automatically when the editor opens,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                        <br />
                    </li>
                    <li>
                        <b>fillForms</b> sets rules in JSON format for filling document <a href="#forms-properties">forms</a> by tags,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "{forms}".
                        <br />
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td></td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div id="watermark-properties" class="header-gray copy-link">Watermark properties</div>
<table class="table">
    <colgroup>
        <col style="width: 170px;" />
        <col />
        <col style="width: 100px;" />
        <col style="width: 150px;" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Parameter</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>transparent</td>
            <td>The watermark transparency degree.</td>
            <td>float</td>
            <td>0.3</td>
        </tr>
        <tr class="tablerow">
            <td>type</td>
            <td>The <a href="<%= Url.Action("global", "docbuilder") %>#ShapeType">shape type</a> which specifies the preset shape geometry for the current watermark.</td>
            <td>string</td>
            <td>"rect"</td>
        </tr>
        <tr class="tablerow">
            <td>width</td>
            <td>The watermark width measured in millimeters.</td>
            <td>integer</td>
            <td>100</td>
        </tr>
        <tr class="tablerow">
            <td>height</td>
            <td>The watermark height measured in millimeters.</td>
            <td>integer</td>
            <td>100</td>
        </tr>
        <tr class="tablerow">
            <td>rotate</td>
            <td>The watermark rotation angle measured in degrees.</td>
            <td>integer</td>
            <td>-45</td>
        </tr>
        <tr class="tablerow">
            <td>margins</td>
            <td>The text margins measured in millimeters in the watermark shape.</td>
            <td>array of integers</td>
            <td>[10, 10, 10, 10]</td>
        </tr>
        <tr class="tablerow">
            <td>fill</td>
            <td>The watermark fill color in the RGB format. The empty array [] means that the watermark has no fill.</td>
            <td>array of integers</td>
            <td>[255, 0, 0]</td>
        </tr>
        <tr class="tablerow">
            <td>stroke-width</td>
            <td>The watermark stroke width measured in millimeters.</td>
            <td>integer</td>
            <td>1</td>
        </tr>
        <tr class="tablerow">
            <td>stroke</td>
            <td>The watermark stroke color in the RGB format. The empty array [] means that the watermark stroke has no fill.</td>
            <td>array of integers</td>
            <td>[0, 0, 255]</td>
        </tr>
        <tr class="tablerow">
            <td>align</td>
            <td>The vertical text align in the watermark shape: 0 - bottom, 1 - center, 4 - top.</td>
            <td>integer</td>
            <td>1</td>
        </tr>
        <tr class="tablerow">
            <td>paragraphs</td>
            <td>The array with paragraphs from the current watermark with their properties.</td>
            <td>array of objects</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td>paragraphs.align</td>
            <td>The horizontal text align in the current paragraph: 0 - right, 1 - left, 2 - center, 3 - justify.</td>
            <td>integer</td>
            <td>2</td>
        </tr>
        <tr class="tablerow">
            <td>paragraphs.fill</td>
            <td>The paragraph highlight in the RGB format. The empty array [] means that the paragraph is not highlighted.</td>
            <td>array of integers</td>
            <td>[255, 0, 0]</td>
        </tr>
        <tr class="tablerow">
            <td>paragraphs.linespacing</td>
            <td>The text linespecing in the current paragraph.</td>
            <td>integer</td>
            <td>1</td>
        </tr>
        <tr class="tablerow">
            <td>paragraphs.runs</td>
            <td>
                The array with runs from the current paragraph with their properties:
                <ul>
                    <li>
                        <b>text</b> - the run text,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "Do not steal, %user_name%!";
                        <br />
                    </li>
                    <li>
                        <b>fill</b> - the text highlight in the RGB format. The empty array [] means that the text is not highlighted,
                        <br />
                        <b>type</b>: array of integers,
                        <br />
                        <b>example</b>: [0, 0, 0];
                        <br />
                    </li>
                    <li>
                        <b>font-family</b> - the text font family,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "Arial";
                        <br />
                    </li>
                    <li>
                        <b>font-size</b> - the text font size measured in points (pt),
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: 40;
                        <br />
                    </li>
                    <li>
                        <b>bold</b> - defines if the current text is displayed bold or not,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                        <br />
                    </li>
                    <li>
                        <b>italic</b> - defines if the current text is displayed italic or not,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: false;
                        <br />
                    </li>
                    <li>
                        <b>strikeout</b> - defines if the current text is displayed struck through or not,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: false;
                        <br />
                    </li>
                    <li>
                        <b>underline</b> - defines if the current text is displayed underlined or not,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: false.
                        <br />
                    </li>
                </ul>
            </td>
            <td>array of objects</td>
            <td></td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div id="forms-properties" class="header-gray copy-link">Form properties</div>
<table class="table">
    <colgroup>
        <col style="width: 100px;" />
        <col />
        <col style="width: 100px;" />
        <col style="width: 150px;" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Parameter</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>tags</td>
            <td>
                The form tags which specify the content for each form type with such a tag:
                <ul>
                    <li>
                        <b>text</b> - the text field value (some text),
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "OnlyOffice";
                        <br />
                    </li>
                    <li>
                        <b>checkBox</b> - the checkbox form value ("true" - checked, "false" - unchecked),
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "true";
                        <br />
                    </li>
                    <li>
                        <b>picture</b> - the image form value (a link to the image),
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "https://upload.wikimedia.org/wikipedia/commons/9/91/ONLYOFFICE_logo.png";
                        <br />
                    </li>
                    <li>
                        <b>comboBox</b> - the combo box form value (one of the items from the combo box list values),
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "item1".
                        <br />
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td></td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Returns</div>

<p>The method returns the <em>undefined</em> value.</p>
<div class="header-gray">Example</div>

<pre>
initSettings = {
    "copyoutenabled" : false,
    "hideContentControlTrack" : false,
    "watermark_on_draw" : JSON.stringify({
        "transparent" : 0.3,
        "type" : "rect",
        "width" : 100,
        "height" : 100,
        "rotate" : -45,
        "margins" : [ 10, 10, 10, 10 ],
        "fill" : [255, 0, 0],
        "stroke-width" : 1,
        "stroke" : [0, 0, 255],
        "align" : 1,
                        
        "paragraphs" : [ {
            "align" : 2,
            "fill" : [255, 0, 0],
            "linespacing" : 1,
                        
            "runs" : [
                        {
                            "text" : "Do not steal, %user_name%!",
                            "fill" : [0, 0, 0],
                            "font-family" : "Arial",
                            "font-size" : 40,
                            "bold" : true,
                            "italic" : false,
                            "strikeout" : false,
                            "underline" : false
                        },
                        {
                            "text" : "&lt;%br%&gt;"
                        }
                    ]
            }
        ]
    }),
    "disableAutostartMacros" : true,
    "fillForms" : JSON.stringify({
        "tags" : {
            "111" : {
                "text" : "Text in form with tag 111",
                "checkBox" : "true",
                "picture" : "https://upload.wikimedia.org/wikipedia/commons/9/91/ONLYOFFICE_logo.png",
                "comboBox" : "item1"
            },
            "222" : {
                "text" : "Text in form with tag 222",
                "checkBox" : "false",
                "comboBox" : "item2"
            },
            "333" : {
                "text" : "OnlyOffice"
            }
        }
    })
};
window.Asc.plugin.executeMethod("SetProperties", [initSettings]);
</pre>
