class Usd
  def price
    response = HTTParty.get('https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5')
    response[0]['sale'].to_f.round(2)
  end
end