(function ($) {
    var displaylogin = false;
    $('.message a').click(function () {
        $('.form div').animate({ height: "toggle", opacity: "toggle" }, "slow");
    });

    $(document).ready(function () {
        $("#loginout").click(function () {
            var hideshow = $('#logindiv').css("display");

            if (hideshow == 'none') {
                $('#logindiv').fadeIn("slow");
                displaylogin = true;
                $('#blurme').css("-webkit-filter", "blur(10px)");
            }
            else {
                $('#logindiv').fadeOut("slow");
                displaylogin = false;
                $('#blurme').css("-webkit-filter", "blur(0px)");
            }
            return false;
        });
    });

    $(document).scroll(function () {
        if (displaylogin == true) {
            checkOffset();
        }
    });
    function checkOffset() {
        if ($('#logindiv').offset().top + $('#logindiv').height() > $('.footer-area').offset().top - 3) {
            $('#logindiv').fadeOut("slow");
        }       
        if ($(document).scrollTop() + window.innerHeight < $('.footer-area').offset().top) {
            $('#logindiv').fadeIn("slow");//.css('position', 'fixed'); // restore when you scroll up
        }
        //if ($(document).scrollTop() + window.innerHeight < $('.footer-area').offset().top) {
        //    $('#logindiv').fadeIn("slow");//.css('position', 'fixed'); // restore when you scroll up
        //}
    }
})(jQuery);