class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :status, default: 'New'
      t.integer :count_of_products
      t.decimal :total_price, precision: 10, scale: 2
      t.string :user_first_name
      t.string :user_last_name
      t.string :region
      t.string :warehouse

      t.timestamps
    end

    add_reference :orders, :user, foreign_key: true
    add_reference :orders, :products, foreign_key: true
  end
end
