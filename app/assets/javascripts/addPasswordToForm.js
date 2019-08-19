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