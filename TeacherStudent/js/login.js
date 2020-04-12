(function ($) {

    $('.message .toggler').click(function () {
        $('.form div').animate({ height: "toggle", opacity: "toggle" }, "slow");
    });

})(jQuery);