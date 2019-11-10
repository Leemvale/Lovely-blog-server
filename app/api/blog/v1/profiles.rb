module Blog
  module V1
    class Profiles < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :profiles do
        desc 'Return an profile'
        params do
          requires :id, type: Integer, desc: 'User id'
        end
        route_param :id do
          get do
            profile = Profile.find_by(user_id: params[:id])
            present profile, with: Blog::Entities::Profile
          end
        end
      end
    end
  end
end