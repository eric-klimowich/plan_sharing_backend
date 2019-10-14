class Api::V1::LessonsController < ApplicationController
  before_action :authenticate, only: [:create]

  def index
    @lessons = Lesson.all
    render json: @lessons
  end

  def create
    subject = Subject.find_by(name: lesson_params["subject_name"])
    current_user_id = logged_in_user_id()
    if subject
      new_lesson_params = lesson_params.merge({:subject_id => subject.id})
      new_lesson_params.delete("grade_name")
      new_lesson_params.delete("subject_name")
    else
      Subject.create(name: lesson_params["subject_name"], user_id: current_user_id)
      subject = Subject.find_by(name: lesson_params["subject_name"])
      new_lesson_params = lesson_params.merge({:subject_id => subject.id})
      new_lesson_params.delete("grade_name")
      new_lesson_params.delete("subject_name")
    end
    @lesson = Lesson.create(new_lesson_params)
    if @lesson.valid?
      render json: @lesson, status: :accepted
    else
      render json: { errors: @lesson.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :content, :grade_name, :subject_name)
  end
end
