// var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
// var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
//     return new bootstrap.Popover(popoverTriggerEl)
// })
//
//
// var popover = new bootstrap.Popover(document.querySelector('.popover-dismiss'), {
//     trigger: 'focus'
// })
$(".card").each(
    function() {
        $( this ).removeClass('transform-scale').removeClass('shadow');
    }
).mouseenter(
    function() {
        $( this ).addClass('transform-scale').addClass('shadow');
    }
).mouseleave(
    function() {
        $( this ).removeClass('transform-scale').removeClass('shadow');
    }
)
