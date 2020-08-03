(function ($) {
    "use strict";
    $(document).ready(function () {
        //init dataTables
        $('#gvs').dataTable(
            {
                lengthChange: true,
                info: true,
                pageLength: 5
            });
    });
}(jQuery));