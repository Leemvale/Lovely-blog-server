module Blog
  module Entities
    class Article < Grape::Entity
      expose :id
      expose :title
      expose :text
      expose :image_url
      expose :author, using: Blog::Entities::Author
    end
  end
end