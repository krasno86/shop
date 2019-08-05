User.create(email: 'a@gmail.com', role: 'admin', password: 'aa123456', created_at: Time.now)

merchant = User.create(email: 'a1@gmail.com', role: 'merchant', password: 'aa123456', created_at: Time.now)

Product.create(
  name: 'Aliens',
  description: "The film follows Weaver's character Ellen Ripley as she returns to the moon where her crew encountered the hostile Alien creature, this time accompanied by a unit of space marines. ... Empire magazine voted it the 'Greatest Film Sequel of All Time'. Aliens was the seventh-highest-grossing film of 1986 in North America.",
  price: 10,
  remote_avatar_url: "https://2.bp.blogspot.com/-xF6xSnmyF20/WRC2nzzRv4I/AAAAAAAAPgM/bSxGg7yw33sl6cJZBVL8MxNDpTiEgXtPACLcB/s1600/earsdthgyuijo.jpg",
  user_id: merchant.id
)
