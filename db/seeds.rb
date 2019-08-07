User.create(email: 'a@gmail.com', role: 'admin', password: 'aa123456', created_at: Time.now)

merchant = User.create(email: 'a1@gmail.com', role: 'merchant', password: 'aa123456', created_at: Time.now)

Product.create(
  name: 'Aliens',
  description: "The film follows Weaver's character Ellen Ripley as she returns to the moon where her crew encountered the hostile Alien creature, this time accompanied by a unit of space marines. ... Empire magazine voted it the 'Greatest Film Sequel of All Time'. Aliens was the seventh-highest-grossing film of 1986 in North America.",
  price: 10.00,
  user_id: merchant.id)

merchant.contact_info.create(email: 'bla@gmail.com', phone: '0123456789')
merchant.pages << Page.create(page_type: 'contacts', html: '<p>fdvdv</p><p class="email">email:</p><p class="phone">phone number:</p>')