class Api::V1::FavoriteLessonsController < ApplicationController
  before_action :authenticate, only: [:create]

  def index
    @favorite_lessons = FavoriteLesson.all
    render json: @favorite_lessons
  end

  def create
    @favorite_lesson = FavoriteLesson.create(favorite_lesson_params)
    if @favorite_lesson.valid?
      render json: @favorite_lesson, status: :accepted
    else
      render json: { errors: @favorite_lesson.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @favorite_lesson = FavoriteLesson.find(params[:id])
    @favorite_lesson.destroy
  end

  private

  def favorite_lesson_params
    params.require(:favorite_lesson).permit(:user_id, :lesson_id)
  end
end
