$(document).ready( function () {
    $('#create_user_and_order_form_count_of_products').blur(function(){
        const productsCount = $('#create_user_and_order_form_count_of_products').html()
        const usd_rate = $('#usd_rate').html()
        const total_price_usd = +usd_rate*+$('#products_count').html()
        const total_price_usd_rounded = Math.round(total_price_usd * 100) / 100
        const total_price_grivna = Math.round(total_price_usd_rounded * + usd_rate * 100) / 100
        $('#total_price').html('').append(total_price_usd_rounded + '$' + '(' + total_price_grivna + ')' + '₴')
    })
})
