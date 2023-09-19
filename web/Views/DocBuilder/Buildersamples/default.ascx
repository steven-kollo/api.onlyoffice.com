<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Builder samples</span>
</h1>

<ul class="sample-block">
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("buildersamples/createformaldocument") %>?zoom=60"><div class="example-sample-img create-formal-document"></div></a>
            <div class="sample-info">
                <p class="name-example-sample"><a href="<%= Url.Action("buildersamples/createformaldocument") %>?zoom=60">Creating formal document</a></p>
                <p>Creates multi-page document with formal styles.</p>
            </div>
        <p class="block_more-sample"><a href="<%= Url.Action("buildersamples/createformaldocument") %>?zoom=60">More</a></p>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("buildersamples/fillspreadsheet") %>?type=cell"><div class="example-sample-img fill-spreadsheet"></div></a>
            <div class="sample-info">
                <p class="name-example-sample"><a href="<%= Url.Action("buildersamples/fillspreadsheet") %>?type=cell">Filling spreadsheet with data</a></p>
                <p>Fills spreadsheet with array-based values.</p>
            </div>
        <p class="block_more-sample"><a href="<%= Url.Action("buildersamples/fillspreadsheet") %>?type=cell">More</a></p>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("buildersamples/commenterrors") %>?type=cell&template=data_with_errors"><div class="example-sample-img comment-errors"></div></a>
            <div class="sample-info">
                <p class="name-example-sample"><a href="<%= Url.Action("buildersamples/commenterrors") %>?type=cell&template=data_with_errors">Commenting formula errors</a></p>
                <p>Comments spreadsheet cells with formula errors.</p>
            </div>
        <p class="block_more-sample"><a href="<%= Url.Action("buildersamples/commenterrors") %>?type=cell&template=data_with_errors">More</a></p>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("buildersamples/createchartpresentation") %>?type=slide&zoom=40"><div class="example-sample-img create-chart-presentation"></div></a>
            <div class="sample-info">
                <p class="name-example-sample"><a href="<%= Url.Action("buildersamples/createchartpresentation") %>?type=slide&zoom=40">Creating chart presentation</a></p>
                <p>Creates single-slide chart presentation.</p>
            </div>
        <p class="block_more-sample"><a href="<%= Url.Action("buildersamples/createchartpresentation") %>?type=slide&zoom=40">More</a></p>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("buildersamples/createbasicform") %>"><div class="example-sample-img create-basic-form"></div></a>
            <div class="sample-info">
                <p class="name-example-sample"><a href="<%= Url.Action("buildersamples/createbasicform") %>">Creating basic form</a></p>
                <p>Creates basic form with text and image inputs.</p>
            </div>
        <p class="block_more-sample"><a href="<%= Url.Action("buildersamples/createbasicform") %>">More</a></p>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("buildersamples/createadvancedform") %>?zoom=80"><div class="example-sample-img create-advanced-form"></div></a>
            <div class="sample-info">
                <p class="name-example-sample"><a href="<%= Url.Action("buildersamples/createadvancedform") %>?zoom=80">Creating advanced form</a></p>
                <p>Create advanced form with table structure.</p>
            </div>
        <p class="block_more-sample"><a href="<%= Url.Action("buildersamples/createadvancedform") %>?zoom=80">More</a></p>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("buildersamples/fillform") %>?template=empty_form&zoom=80"><div class="example-sample-img fill-form"></div></a>
            <div class="sample-info">
                <p class="name-example-sample"><a href="<%= Url.Action("buildersamples/fillform") %>?template=empty_form&zoom=80">Filling form</a></p>
                <p>Fills form with text values and image.</p>
            </div>
        <p class="block_more-sample"><a href="<%= Url.Action("buildersamples/fillform") %>?template=empty_form&zoom=80">More</a></p>
    </li>
</ul>
