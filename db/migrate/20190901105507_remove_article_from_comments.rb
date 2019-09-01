class RemoveArticleFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_reference :comments, :article, foreign_key: true
  end
end
