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
                A JSON object of the following form:
                <ul>
                    <li>
                        <b>copyoutenabled</b> disables copying from the editor if it is set to <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
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
                        <b>watermark_on_draw</b> - a string value for watermark in json format,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "{watermark}".
                        <br />
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td></td>
        </tr>
    </tbody>
</table>

<div class="header-gray">Returns</div>

<p>The method returns the <em>undefined</em> value.</p>
<div class="header-gray">Example</div>

<pre>
initSettings = {
    copyoutenabled : false,
    hideContentControlTrack : false,
    watermark_on_draw : JSON.stringify({
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
    })
};
window.Asc.plugin.executeMethod("SetProperties", [initSettings]);
</pre>
