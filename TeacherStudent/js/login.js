(function ($) {

    $('.message a').click(function changeForm() {
        $('.form div').animate({ height: "toggle", opacity: "toggle" }, "slow");
    });

    $(document).keypress(function EnterEvent(e) {
        if (e.which == '13') {
            e.preventDefault();
        }
    });


    //$(document).ready(function () {
    //    $("#loginout").click(function () {
    //        var hideshow = $('#logindiv').css("display");

    //        if (hideshow == 'none') {
    //            $('#logindiv').fadeIn("slow");
    //            displaylogin = true;
    //            $('#blurme').css("-webkit-filter", "blur(10px)");
    //        }
    //        else {
    //            $('#logindiv').fadeOut("slow");
    //            displaylogin = false;
    //            $('#blurme').css("-webkit-filter", "blur(0px)");
    //        }
    //        return false;
    //    });
    //});


})(jQuery);