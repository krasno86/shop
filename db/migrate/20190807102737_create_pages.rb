class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.integer :page_type
      t.text :html

      t.timestamps
    end

    add_reference :pages, :user, foreign_key: true
  end
end
