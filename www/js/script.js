$(document).ready(function() {
    $("#div1").click(function() {
       $(".sidebar a[href=\'#customerinsights\']").tab("show");
setTimeout(function(){
        var top = $("#rfmGraphPlot").position().top;
        $(window).scrollTop( top );
        }, 300);
    });
});