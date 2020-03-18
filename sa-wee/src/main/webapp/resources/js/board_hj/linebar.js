/* https://www.datatype.in/real-time-progress-bar-using-php-bootstrap-jquery-and-ajax/ */
/* 나중에 data-width 대신 ajax로 받아와야 함. */
/* 나중에 data-width 대신 ajax로 받아와야 함. */

(function( $ ) {
    "use strict";
    $(function() {
        function animated_contents() {
            $(".zt-skill-bar > div ").each(function (i) {
                var $this  = $(this),
                    skills = $this.data('width');

                $this.css({'width' : skills + '%'});

            });
        }
        
        if(jQuery().appear) {
            $('.zt-skill-bar').appear().on('appear', function() {
                animated_contents();
            });
        } else {
            animated_contents();
        }
    });
}(jQuery));