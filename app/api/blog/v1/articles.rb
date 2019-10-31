module Blog
  module V1
    class Articles < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :articles do
        desc 'Return list of articles'
        get do
          authenticate_user!
          articles = Article.all
          present articles
        end

        desc 'Return an article'
        params do
          requires :id, type: Integer, desc: 'Article id'
        end
        route_param :id do
          get do
            Article.find(params[:id])
          end
        end

        desc 'Create an article'
        params do
          requires :article, type: Hash do
            requires :title, type: String, desc: 'Title'
            requires :text, type: String, desc: 'Text'
            optional :image, type: String, desc: 'Image'
          end
        end
        post do
          article = Article.new(params[:article])
          article.author = current_user
          if article.save
            article
          end
        end
      end
    end
  end
end