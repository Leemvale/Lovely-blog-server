class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :commenter, class_name: "User"
end
