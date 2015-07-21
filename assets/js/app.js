(function($, _){
    var canvas = $("#drawCanvas");

    window.onload = init;

    window.onResize = Processing.reload;


    function init(){
        $(".js-runSwitcher a").on("click", selectSketch);
    }

    function selectSketch(){
        var data = $(this).data("processing-sources");
        var pdePath = "./assets/pde/" + data + ".pde";
        canvas.attr({ "data-processing-sources": pdePath });
        Processing.reload();
    }

})(jQuery, _);
