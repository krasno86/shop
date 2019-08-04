class CreatePaymentInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_infos do |t|
      t.string :payment_type
      t.text :description

      t.timestamps
    end

    add_reference :payment_infos, :user, foreign_key: true
  end
end
