class CreateUsdRates < ActiveRecord::Migration[5.2]
  def change
    create_table :usd_rates do |t|
      t.decimal :current_rate, precision: 10, scale: 2

      t.timestamps
    end
  end
end
