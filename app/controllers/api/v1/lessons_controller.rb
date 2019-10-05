class Api::V1::LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    render json: @lessons
  end

  def create
    @lesson = Lesson.create(lesson_params)
    if @lesson.valid?
      render json: @lesson, status: :accepted
    else
      render json: { errors: @lesson.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def lesson_params
    params.permit(:title, :content, :user_id)
  end
end
