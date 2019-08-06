class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :status, default: 0, null: false
      t.integer :count_of_products
      t.string :email
      t.string :phone
      t.string :user_first_name
      t.string :user_last_name
      t.decimal :total_price, precision: 10, scale: 2
      t.string :region
      t.string :warehouse
      t.boolean :paid, null: false, default: false

      t.timestamps
    end

    add_reference :orders, :user, foreign_key: true
    add_reference :orders, :products, foreign_key: true
  end
end
