class CreateJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :authors, :books do |t|
      t.index %i[author_id book_id]
    end
  end
end
