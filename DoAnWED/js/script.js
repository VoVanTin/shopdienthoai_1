$(document).ready(function () {
    var autoLoad = setInterval(function () {
        $('#btn-next').trigger('click');
    }, 1000);

    $('.nut-slide ul li').click(function (event) {
        clearInterval(autoLoad);
        var vi_tri_hien_tai = $('.active_nut').index() + 1;
        var vi_tri_click = $(this).index() + 1;
        $('.nut-slide ul li').removeClass('active_nut');
        $(this).addClass('active_nut');
        if (vi_tri_click > vi_tri_hien_tai) {
            $('.active').addClass('bien-mat-ben-trai').one('webkitAnimationEnd', function (event) {
                $('.bien-mat-ben-trai').removeClass('bien-mat-ben-trai').removeClass('active');
            });
            $('.slide:nth-child(' + vi_tri_click + ')').addClass('active').addClass('di-vao-ben-phai').one('webkitAnimationEnd', function (event) {
                $('.di-vao-ben-phai').removeClass('di-vao-ben-phai');
            });
        }
        if (vi_tri_click < vi_tri_hien_tai) {
            $('.active').addClass('bien-mat-ben-phai').one('webkitAnimationEnd', function (event) {
                $('.bien-mat-ben-phai').removeClass('bien-mat-ben-phai').removeClass('active');
            });
            $('.slide:nth-child(' + vi_tri_click + ')').addClass('active').addClass('di-vao-ben-trai').one('webkitAnimationEnd', function (event) {
                $('.di-vao-ben-trai').removeClass('di-vao-ben-trai');
            });
        }

    });

});