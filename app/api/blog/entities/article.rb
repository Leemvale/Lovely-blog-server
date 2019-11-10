module Blog
  module Entities
    class Article < Grape::Entity
      expose :id
      expose :title
      expose :text
      expose :image_url
      expose :author
    end
  end
end