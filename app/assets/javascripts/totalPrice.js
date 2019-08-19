$(document).ready( function () {
    $('#create_user_and_order_form_count_of_products').change(function(){
        const productsCount = $('#create_user_and_order_form_count_of_products').val()
        const usdRate = $('#usd_rate').html()
        const productPrice = $('#product_price').html()
        const totalPriceUsd = +productPrice*+productsCount
        const totalPriceUsdRounded = Math.round(totalPriceUsd * 100) / 100
        const totalPriceGrivna = Math.round(totalPriceUsdRounded * + usdRate * 100) / 100
        $('#total_price').html('').append(totalPriceUsdRounded + '$' + '(' + totalPriceGrivna + ')' + '₴')
    })
})
