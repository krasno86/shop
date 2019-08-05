$(document).ready( function () {
    $('#create_user_and_order_form_region').blur(function(){
        const region = $('#create_user_and_order_form_region option:selected').val();
        $.ajax({
            url: '/orders/get_warehouses',
            dataType: "json",
            type: 'get',
            data: { region: region },
            success: function(data) {
                $('#create_user_and_order_form_warehouse').find('option').remove()
                data['warehouses'].forEach(function(val, i) {
                    $('#create_user_and_order_form_warehouse').append(new Option(val))
                })
            }
        })
            .fail(function() {
                alert('Coupon not valid');
            })
    });
});