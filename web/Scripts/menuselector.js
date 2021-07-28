$(document).ready(function() {
    var $items = $("#nav-all-menu-items").children()

    var heading = "";

    if ($items && $items.length > 0) {
        var selectedItem = $items.filter((i) => {
            return $($items[i]).hasClass("active")
        })

        if (selectedItem) {
            var link = selectedItem.children()
            heading = $(link).text()
        }
    }

    if (heading) {
        $("#variable-heading").text(heading)
    }
})

$(function () {
    $("#header-button").on("click", function () {
        if ($(".pushy").hasClass("pushy-submenu-open")) {
            $(".arrow-header").addClass("rotate");
        }
        else {
            $(".arrow-header").removeClass("rotate");
        }
    })
});

$(function () {
    $("#menu-button").on("click", function () {
        if ($(".layout-side").hasClass("open-menu")) {
            $(".layout-side").removeClass("open-menu");
        }
        else {
            $(".layout-side").addClass("open-menu");
            $(".site-overlay").removeClass('hidden');
            $(".pushy-left")
                .addClass('pushy-submenu-closed')
                .removeClass('pushy-submenu-open');
        }
    })
});

$(function () {

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min)) + min;
    }
    if ($("div.menu-button").length) {
        $("#menu-button").on("click", function () {

            if ($(".layout-table-side").hasClass("close-menu")) {
                $(".layout-table-side")
                    .removeClass('close-menu')
                    .addClass('open-menu');
                $(".site-overlay").removeClass('hidden');
            } else {
                $(".layout-table-side")
                    .addClass('close-menu')
                    .removeClass('open-menu');
                $(".site-overlay").addClass('hidden');
            }
        });
    }
});