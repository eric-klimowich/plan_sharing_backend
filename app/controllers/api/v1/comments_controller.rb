class Api::V1::CommentsController < ApplicationController
  before_action :authenticate, only: [:create]

  def create
    @comment = Comment.create(comment_params)
    if @comment.valid?
      render json: @comment, status: :accepted
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :lesson_id)
  end
end
