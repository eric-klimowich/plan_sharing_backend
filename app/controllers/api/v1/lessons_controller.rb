class Api::V1::LessonsController < ApplicationController
  before_action :authenticate, only: [:create]

  def index
    @lessons = Lesson.all
    render json: @lessons
  end

  def create
    current_grade_id = find_or_create_grade
    current_subject_id = find_or_create_subject
    current_user_id = logged_in_user_id
    current_user_grade_id = find_or_create_user_grade(current_user_id, current_grade_id)
    debugger

    # subject = Subject.find_by(name: lesson_params["subject_name"])
    # if subject
    #   new_lesson_params = lesson_params.merge({:subject_id => subject.id})
    #   new_lesson_params.delete("grade_name")
    #   new_lesson_params.delete("subject_name")
    # else
    #   Subject.create(name: lesson_params["subject_name"], user_id: current_user_id)
    #   subject = Subject.find_by(name: lesson_params["subject_name"])
    #   new_lesson_params = lesson_params.merge({:subject_id => subject.id})
    #   new_lesson_params.delete("grade_name")
    #   new_lesson_params.delete("subject_name")
    # end
    @lesson = Lesson.create(new_lesson_params)
    if @lesson.valid?
      render json: @lesson, status: :accepted
    else
      render json: { errors: @lesson.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def find_or_create_grade
    grade_name_param = lesson_params["grade_name"]
    current_grade = Grade.find_by(grade_name: grade_name_param)
    if current_grade
      current_grade_id = current_grade.id
      current_grade_id
    else
      Grade.create(grade_name: grade_name_param)
      current_grade = Grade.find_by(grade_name: grade_name_param)
      current_grade_id = current_grade.id
      current_grade_id
    end
  end

  def find_or_create_subject
    subject_name_param = lesson_params["subject_name"]
    current_subject = Subject.find_by(subject_name: subject_name_param)
    if current_subject
      current_subject_id = current_subject.id
      current_subject_id
    else
      Subject.create(subject_name: subject_name_param)
      current_subject = Subject.find_by(subject_name: subject_name_param)
      current_subject_id = current_subject.id
      current_subject_id
    end
  end

  def find_or_create_user_grade(current_user_id, current_grade_id)
    current_user_grade = UserGrade.all.select do |user_grade_hash|
      user_grade_hash[:user_id] == current_user_id && user_grade_hash[:grade_id] == current_grade_id
    end
    if current_user_grade.length > 0
      current_user_grade_id = current_user_grade.first.id
      current_user_grade_id
    else
      UserGrade.create(user_id: current_user_id, grade_id: current_grade_id)
      current_user_grade = UserGrade.all.select do |user_grade_hash|
        user_grade_hash[:user_id] == current_user_id && user_grade_hash[:grade_id] == current_grade_id
      end
      current_user_grade_id = current_user_grade.first.id
      current_user_grade_id
    end
  end

  def lesson_params
    params.require(:lesson).permit(:title, :content, :grade_name, :subject_name)
  end
end
