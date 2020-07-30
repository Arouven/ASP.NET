(function ($) {
    "use strict";
    $(document).ready(function () {
        //init dataTables
        $('#gvs').dataTable(
            {
                lengthChange: true,
                info: true,
                pageLength: 2
            });
    });
    $(document).on('click', '[data-toggle="lightbox"]', function (event) {
        event.preventDefault();
        $(this).ekkoLightbox();
    });
}(jQuery));