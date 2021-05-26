$(function () {

    var currentFilter = null;
    var $plugins = $(".plugin-block").children();
    var $filterItems = $(".filter-item");

    $("#filter-plugin").on("click", toggleFilterButton)
    $("#back-drop").on("click", closeFilter)

    $(".filter-item").on("click", function () {
        toggleFilterButton();
        var selectedFilter = $(this).attr('id')

        if ( selectedFilter === currentFilter) {
            currentFilter = null;
            showAll();
            highlightSelectedFilter();
            return
        } else {
            currentFilter = selectedFilter
            highlightSelectedFilter();
        }
        showAll();
        for (var plugin of $plugins) {
            var data = plugin.dataset.types
            if (!data) {
                $(plugin).addClass("hidden")
                continue
            } 

            var types = plugin.dataset.types.split(",")

            let showPlugin = false

            for (var type of types) {
                if (type === currentFilter) {
                    showPlugin = true
                    break
                }
            }

            if (!showPlugin) {
                $(plugin).addClass("hidden")
            }
        }
    })

    function showAll() {
        for (var plugin of $plugins) {
            $(plugin).removeClass("hidden")
        }
    }

    function highlightSelectedFilter() {

        for (var item of $filterItems) {
            var itemId = $(item).attr('id')

            if (itemId === currentFilter) {
                $(item).addClass("selected")
            } else {
                $(item).removeClass("selected")
            }
        }
    }

    function closeFilter() {
        $(".filter-selector").removeClass("show");
    }

    function toggleFilterButton() {
        if ($(".filter-selector").hasClass("show")) {
            $(".filter-selector").removeClass("show");
        }
        else {
            $(".filter-selector").addClass("show");
        }
    }
});


$(function () {
    $("#filter-button").on("click", function () {
        if ($(".filter-selector").hasClass("show")) {
            $(".img-plugin").addClass("rotate");
        }
        else {
            $(".img-plugin").removeClass("rotate");
        }
    })
});


