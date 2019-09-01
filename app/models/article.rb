class Article < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  belongs_to :author, class_name: "User"
  has_one_attached :image
end
