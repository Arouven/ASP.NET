(function ($) {

    $('.message a').click(function () {
        $('.form div').animate({ height: "toggle", opacity: "toggle" }, "slow");
    });

    $(document).ready(function () {
        $("#loginout").click(function () {
            var hideshow = $('#logindiv').css("display");

            if (hideshow == 'none') {
                $('#logindiv').fadeIn("slow");
                $('#blurme').css("-webkit-filter", "blur(10px)");
            }
            else {
                $('#logindiv').fadeOut("slow");
                $('#blurme').css("-webkit-filter", "blur(0px)");
            }
            return false;
        });        
    });


})(jQuery);