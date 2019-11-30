$('.shopping').on('click', function () {
  var product_id = $(this).attr("data_product_id");

  $.ajax({
    url: '/carts',
    type: 'POST',
    cache: false,
    data: {
      product_id: product_id
    },
    success: function (data) {
      $('#quantity_products').attr('data-notify', data.size_cart);
      alert(I18n.t("alert.add_to_cart.success"));
    },
    error: function () {
      alert(I18n.t("alert.add_to_cart.fail"));
    }
  });
});

$('.total-quantity-product').change(function () {
  var product_id = $(this).attr("data-product-id");
  var quantity = $(this).val()
  if (quantity < 1){
    quantity = 1
  }

  $.ajax({
    url: '/carts/0',
    type: 'PUT',
    cache: false,
    data: {
      product_id: product_id,
      quantity: quantity
    },
    success: function (data) {
      $('#total-price-'+product_id).text((data.total_quantity*data.price)+'VND');
      $('#total-cart').text((data.total_cart)+'VND');
    },
    error: function () {
      alert(I18n.t("alert.update_cart.fail"));
    }
  });
});
