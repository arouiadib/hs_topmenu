$(document).ready(function(){
    $(".hamburger").click(function(){
        $(this).toggleClass("is-active");
    });


    // todo: add coockie management
    $(".new-world-close").click(function(){
        $(this).parent().parent().hide();
        $('.right-nav').removeClass('repair');
    });
});