$(document).ready( function () {
    $('#create_user_and_order_form_count_of_products').blur(function(){
        var productsCount = $('#create_user_and_order_form_count_of_products').val()
        $('#products_count').html('').append(productsCount)
    })
})
