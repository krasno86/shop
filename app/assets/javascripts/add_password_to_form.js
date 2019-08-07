// $(document).ready(function(){
//     $('label.form-control-label.hidden').hide()
//
//     $('#create_user_and_order_form_register[type="checkbox"]').click(function(){
//         if($(this).is(":checked")){
//             $('#create_user_and_order_form_password').removeAttr('type', 'hidden');
//         }
//         else if($(this).is(":not(:checked)")){
//             $('#create_user_and_order_form_password').attr('type', 'hidden');
//         }
//     });
// });


$(document).ready(function(){
    $('#create_user_and_order_form_register[type="checkbox"]').click(function(){
        if($(this).is(":checked")){
            $('.form-control-label.password.optional').append(' *');
        }
        else if($(this).is(":not(:checked)")){
            $('.form-control-label.password.optional').html('Password')
        }
    });
});