(function($, _){
    var canvas = $("#drawCanvas");

    $(function(){
        $(".js-runSwitcher a").on("click", selectSketch);
    });

    function selectSketch(){
        var data = $(this).data("processing-sources");
        var pdePath = "./assets/pde/" + data + ".pde";
        canvas.attr({ "data-processing-sources": pdePath });
        Processing.reload();
    }

})(jQuery, _);
