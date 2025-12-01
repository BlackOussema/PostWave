module Api
  class PostsController < ApplicationController
    before_action :authenticate_request!, except: [:index, :show]
    before_action :set_post, only: [:show, :update, :destroy]
    before_action only: [:update, :destroy] do
      authorize_resource!(@post)
    end

    def index
      posts = Post.order(created_at: :desc).includes(:user)
      render json: posts.as_json(include: { user: { only: [:id, :name] } }, except: [:updated_at])
    end

    def show
      render json: @post.as_json(include: { user: { only: [:id, :name] }, comments: { include: :user }})
    end

    def create
      post = current_user.posts.build(post_params)
      if post.save
        render json: post, status: :created
      else
        render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      if @post.update(post_params)
        render json: @post
      else
        render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      @post.destroy
      render json: { message: 'Deleted' }
    end

    private

    def set_post
      @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Post not found' }, status: :not_found
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end
  end
end