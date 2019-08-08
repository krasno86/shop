class CreatePaymentAndDeliveryInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_and_delivery_infos do |t|
      t.string :title

      t.timestamps
    end

    add_reference :payment_and_delivery_infos, :user, foreign_key: true
  end
end
