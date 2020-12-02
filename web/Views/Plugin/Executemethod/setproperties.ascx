<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod("SetProperties", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows setting the properties to the document.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod("SetProperties", [obj]);
</pre>
<p>Where <em>obj</em> is a JSON object of the following form (JSON):</p>
<pre>
{
    "copyoutenabled" : boolean,
    "hideContentControlTrack " : boolean,
    "watermark_on_draw" : "string"
}
</pre>
<p>The <em>obj</em> object can have the following values:</p>
<ul>
    <li>"copyoutenabled" (e.g. <em>{"copyoutenabled": true}</em>) disables copying from the editor if it is set to <b>true</b>;</li>
    <li>"hideContentControlTrack" (e.g. <em>{"hideContentControlTrack": true}</em>) disables tracking the content control if it is set to <b>true</b>;</li>
    <li>"watermark_on_draw" (e.g. <em>{"watermark_on_draw": "{watermark}"</em>) is a string value for watermark in json format.</li>
</ul>

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
