module Api
  class CommentsController < ApplicationController
    before_action :authenticate_request!, only: [:create]
    before_action :set_post

    def index
      comments = @post.comments.order(created_at: :asc).includes(:user)
      render json: comments.as_json(include: { user: { only: [:id, :name] } })
    end

    def create
      comment = @post.comments.build(comment_params.merge(user: current_user))
      if comment.save
        render json: comment.as_json(include: { user: { only: [:id, :name] } }), status: :created
      else
        render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def set_post
      @post = Post.find(params[:post_id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Post not found' }, status: :not_found
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
  end
end