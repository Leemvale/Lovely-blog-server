module Blog
  module Entities
    class Author < Grape::Entity
      expose :id
      expose :nickname
    end
  end
end