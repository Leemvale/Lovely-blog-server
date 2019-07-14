class AddUserToArticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :author, foreign_key: { to_table: :users }
  end
end
