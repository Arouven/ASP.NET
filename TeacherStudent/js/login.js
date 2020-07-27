(function ($) {


    $(".openStudentLoginForm").click(function () {
        $('.admin-login-form').hide();
        $('.tutor-login-form').hide();
        $('.student-login-form').slideDown(1000);
    });
    $(".openTutorLoginForm").click(function () {
        $('.admin-login-form').hide();
        $('.student-login-form').hide();
        $('.tutor-login-form').slideDown(1000);
    });
    $(".openAdminLoginForm").click(function () {
        $('.student-login-form').hide();
        $('.tutor-login-form').hide();
        $('.admin-login-form').slideDown(1000);
    });





    $(document).keypress(function EnterEvent(e) {
        if (e.which == '13') {
            e.preventDefault();
        }
    });
    
 






















    //$('.message a').click(function changeForm() {
    //    $('.form div').animate({ height: "toggle", opacity: "toggle" }, "slow");
    //});

    //$(document).keypress(function EnterEvent(e) {
    //    if (e.which == '13') {
    //        e.preventDefault();
    //    }
    //});


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