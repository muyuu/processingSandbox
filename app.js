(function($, _){
    var canvas = $("#drawCanvas");

    $(function(){
        $(".js-runSwitcher a").on("click", selectSketch);
    });

    function selectSketch(){
        var data = $(this).data("processing-sources");
        canvas.attr({ "data-processing-sources": data + ".pde" });
        Processing.reload();
    }

})(jQuery, _);
