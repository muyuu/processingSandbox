(function($, _){
    var canvas = $("#drawCanvas");

    window.onload = init;

    window.onresize = Processing.reload;


    function init(){
        $("#toggleMenu").on("click", toggleMenu);
        $(".js-runSwitcher a").on("click", selectSketch);
    }

    function toggleMenu(e){
        e.preventDefault();
        $(".js-runSwitcher").toggleClass('isShow');
    }

    function selectSketch(e){
        e.preventDefault();

        var data = $(this).data("processing-sources");
        var pdePath = "./assets/pde/" + data + ".pde";

        canvas.attr({ "data-processing-sources": pdePath });

        Processing.reload();
        $(".js-runSwitcher").toggleClass('isShow');
    }

})(jQuery, _);
