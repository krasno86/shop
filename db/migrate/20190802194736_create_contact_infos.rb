class CreateContactInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_infos do |t|
      t.string :email
      t.string :phone
      t.string :location

      t.timestamps
    end

    add_reference :contact_infos, :user, foreign_key: true
  end
end
