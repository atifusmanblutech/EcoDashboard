$(document).ready(function() {
    $("#div1").click(function() {
       $(".sidebar a[href=\'#customerinsights\']").tab("show");
setTimeout(function(){
        var top = $("#sidePlot2").position().top;
        $(window).scrollTop( top );
        }, 300);
    });
});