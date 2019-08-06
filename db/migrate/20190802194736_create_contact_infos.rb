class CreateContactInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_infos do |t|
      t.text :description

      t.timestamps
    end

    add_reference :contact_infos, :user, foreign_key: true
  end
end
