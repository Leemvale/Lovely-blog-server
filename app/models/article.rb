class Article < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_many :comments, as: :commentable, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  belongs_to :author, class_name: "User"
  has_one_attached :image

  def image_url
    polymorphic_url(self.image) if self.image.attachment
  end
end
