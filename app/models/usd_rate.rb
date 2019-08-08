class UsdRate < ApplicationRecord
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ },
            numericality: { greater_than: 0, less_than: 1000000 }

  def self.update_current_rate
    response = HTTParty.get('https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5')
    current_rate = response[0]['sale'].to_f.round(2)
    UsdRate.first.update(current_rate: current_rate)
  end
end
