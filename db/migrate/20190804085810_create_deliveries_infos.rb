class CreateDeliveriesInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries_infos do |t|
      t.string :delivery_type
      t.text :description

      t.timestamps
    end

    add_reference :deliveries_infos, :user, foreign_key: true
  end
end
