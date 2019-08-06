class CreateDeliveryInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_infos do |t|
      t.string :delivery_type
      t.text :description

      t.timestamps
    end

    add_reference :delivery_infos, :user, foreign_key: true
  end
end
