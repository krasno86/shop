admin = User.create(email: 'a@gmail.com', role: 'admin', password: 'aa123456', created_at: Time.now)

merchant = User.create(email: 'a1@gmail.com', role: 'merchant', password: 'aa123456', created_at: Time.now)

Product.create(
  name: 'Xiaomi mi mix 2s',
  price: 400.00,
  user_id: merchant.id)

ContactInfo.create(email: 'bla@gmail.com', phone: '0123456789', user_id: merchant.id)


Page.create(page_type: 'contact', html: '<body><p>fdvdv</p><p class="email">email:</p><p class="phone">phone number:</p><body>', user_id: merchant.id)

Page.create(page_type: 'product', html: "<body><p><img alt=\"\" src=\"/uploads/ckeditor/pictures/3/content_Xiaomi-Mi-Mix-2s-white-1.png\" style=\"width: 300px; height: 300px;\" /></p>\r\n\r\n<p>Диагональ экрана: 5.99&quot;;</p>\r\n\r\n<p>Разрешение экрана: 2160x1080;</p>\r\n\r\n<p>Камера: 12 Мп + 12 Мп;</p>\r\n\r\n<p>Количество ядер: 8;</p>\r\n\r\n<p>Оперативная память: 6 Гб;</p>\r\n\r\n<p>Внутренняя память: 64 Гб;</p>\r\n\r\n<h3 class=\"price\">&nbsp;</h3>\r\n\r\n<form class=\"button_to\" method=\"get\" action=\"/orders/new\"><input class=\"btn btn-warning\" type=\"submit\" value=\"Create Order\"></form></body>", user_id: merchant.id)

Page.create(page_type: 'shipment', html: '<body><h1>Новая почта</h1> <p>Доставка в отделение &laquo;Нова пошта&raquo;<br /> С помощью&nbsp;доставки &laquo;Нова пошта&raquo;, Вы можете получить товар даже в самых отдаленных уголках Украины. При покупке товаров других продавцов услуга наложенного платежа оплачивается отдельно от доставки.<br /> &nbsp;</p></body>', user_id: merchant.id)

UsdRate.create(current_rate: 25.70)