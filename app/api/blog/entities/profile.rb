module Blog
  module Entities
    class Profile < Grape::Entity
      expose :id
      expose :user, using: Blog::Entities::User
      expose :comments
    end
  end
end