
// $(document).ready( function () {
//     $("#create_user_and_order_form_register").on("click", function() { alert("clicked!"); });
// })


// $(':checkbox').change(function(){
//     $('#delete').removeAttr('hidden');
// });

$(document).ready( function () {
    $('#create_user_and_order_form_register').change(function(){
        // $('#create_user_and_order_form_password').addClass('hidden');
        $('#create_user_and_order_form_password').removeAttr('type', 'hidden');
    })
})