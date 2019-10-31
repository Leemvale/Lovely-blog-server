class AddUserToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :commenter, foreign_key: { to_table: :users }
  end
end
