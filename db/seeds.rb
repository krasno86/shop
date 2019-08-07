User.create(email: 'a@gmail.com', role: 'admin', password: 'aa123456', created_at: Time.now)

merchant = User.create(email: 'a1@gmail.com', role: 'merchant', password: 'aa123456', created_at: Time.now)

Product.create(
  name: 'Aliens',
  description: "The film follows Weaver's character Ellen Ripley as she returns to the moon where her crew encountered the hostile Alien creature, this time accompanied by a unit of space marines. ... Empire magazine voted it the 'Greatest Film Sequel of All Time'. Aliens was the seventh-highest-grossing film of 1986 in North America.",
  price: 10.00,
  user_id: merchant.id)

merchant.contact_info.create(email: 'bla@gmail.com', phone: '0123456789')
merchant.pages << Page.create(page_type: 'contacts', html: '<body><p>fdvdv</p><p class="email">email:</p><p class="phone">phone number:</p><body>')

merchant.pages << Page.create(page_type: 'product', html: "<body><p><img alt=\"\" src=\"/uploads/ckeditor/pictures/3/content_Xiaomi-Mi-Mix-2s-white-1.png\" style=\"width: 300px; height: 300px;\" /></p>\r\n\r\n<p>Диагональ экрана: 5.99&quot;;</p>\r\n\r\n<p>Разрешение экрана: 2160x1080;</p>\r\n\r\n<p>Камера: 12 Мп + 12 Мп;</p>\r\n\r\n<p>Количество ядер: 8;</p>\r\n\r\n<p>Оперативная память: 6 Гб;</p>\r\n\r\n<p>Внутренняя память: 64 Гб;</p>\r\n\r\n<h3 class=\"price\">&nbsp;</h3>\r\n\r\n<form class=\"button_to\" method=\"get\" action=\"/orders/new\"><input class=\"btn btn-warning\" type=\"submit\" value=\"Create Order\"></form></body>")
