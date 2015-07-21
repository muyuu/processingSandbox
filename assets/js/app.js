(function($, _){
    var canvas = $("#drawCanvas");

    window.onload = init;

    window.onresize = Processing.reload;


    function init(){
        $("#toggleMenu").on("click", toggleMenuEvent);
        $(".js-runSwitcher a").on("click", selectSketch);
    }

    function toggleMenuEvent(e){
        e.preventDefault();
        toggleMenu();
    }

    function selectSketch(e){
        e.preventDefault();

        var data = $(this).data("processing-sources");
        var pdePath = "./assets/pde/" + data + ".pde";

        canvas.attr({ "data-processing-sources": pdePath });

        Processing.reload();
        toggleMenu();
    }

    function toggleMenu(){
        $(".js-runSwitcher").toggleClass('isShow');
    }

})(jQuery, _);
