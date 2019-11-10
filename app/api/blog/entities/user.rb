module Blog
  module Entities
    class User < Grape::Entity
      expose :id
      expose :email
      expose :nickname
      expose :articles, using: Blog::Entities::Article
      expose :friends
    end
  end
end