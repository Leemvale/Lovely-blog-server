module Blog
  module V1
    class Articles < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :articles do
        desc 'Return list of all articles'
        get do
          articles = Article.all
          present articles
        end

        desc 'Return an article'
        params do
          requires :id, type: Integer, desc: 'Article id'
        end
        route_param :id do
          get do
            present Article.find(params[:id]), with: Blog::Entities::Article
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
          authenticate_user!
          article = Article.new(params[:article])
          article.author = current_user
          if article.save
            present article
          end
        end

        desc 'Update an article'
        params do
          requires :id, type: Integer, desc: 'Article id'
          requires :article, type: Hash do
            optional :title, type: String, desc: 'Title'
            optional :text, type: String, desc: 'Text'
            optional :image, type: String, desc: 'Image'
          end
        end
        put do
          authenticate_user!
          article = Article.find(params[:id])

          if current_user.id == article.author.id
            if article.update(params[:article])
              present article
            else
              error!(:internal_server_error)
            end
          else
            error!(:forbidden) 
          end
        end

        desc 'Delete an article'
        params do
          requires :id, type: Integer, desc: 'ID'
        end
        put do
          authenticate_user!
          article = Article.find(params[:id])

          if current_user.id == article.author.id
            article.destroy
          else
            error!(:forbidden) 
          end
        end
      end
    end
  end
end