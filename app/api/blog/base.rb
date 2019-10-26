require 'grape-swagger'

module Blog
  class Base < Grape::API
    helpers do 
      def authenticate_user!
        env["warden"].authenticate!
      end
    end
    
    mount Blog::V1::Articles

    add_swagger_documentation
  end
end