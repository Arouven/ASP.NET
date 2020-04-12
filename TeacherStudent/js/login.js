(function ($) {

    $('.message a').click(function () {
        $('.form div').animate({ height: "toggle", opacity: "toggle" }, "slow");
    });

})(jQuery);