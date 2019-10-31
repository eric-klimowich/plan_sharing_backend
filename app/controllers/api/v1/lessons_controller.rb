require 'base64'

class Api::V1::LessonsController < ApplicationController
  before_action :authenticate, only: [:create]
  before_action :find_lesson, only: [:send_lesson_data, :show, :update, :destroy]

  def index
    @lessons = Lesson.all
    render json: @lessons
  end

  def my_lessons
    @my_lessons = Lesson.all.select do |lessons_hash|
      lessons_hash.user_grade_subject.user_grade.user.id == logged_in_user_id
    end
    render json: @my_lessons
  end

  def send_lesson_data
    render json: {
      "file": @lesson.file
    }
  end

  def show
    send_data Base64.decode64(@lesson.file), filename: @lesson.file_name
  end

  def create
    current_user_id = logged_in_user_id
    current_grade_id = find_or_create_grade
    current_user_grade_id = find_or_create_user_grade(current_user_id, current_grade_id)
    current_subject_id = find_or_create_subject
    current_user_grade_subject_id = find_or_create_user_grade_subject(current_user_grade_id, current_subject_id)
    new_lesson_params = {
      title: lesson_params["title"],
      description: lesson_params["description"],
      user_grade_subject_id: current_user_grade_subject_id,
      file: lesson_params["file"],
      file_name: lesson_params["file_name"]
    }
    @lesson = Lesson.create(new_lesson_params)
    if @lesson.valid?
      render json: @lesson, status: :accepted
    else
      render json: { errors: @lesson.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    current_user_id = logged_in_user_id
    current_grade_id = find_or_create_grade
    current_user_grade_id = find_or_create_user_grade(current_user_id, current_grade_id)
    current_subject_id = find_or_create_subject
    current_user_grade_subject_id = find_or_create_user_grade_subject(current_user_grade_id, current_subject_id)
    new_lesson_params = {
      title: lesson_params["title"],
      description: lesson_params["description"],
      user_grade_subject_id: current_user_grade_subject_id,
      file: lesson_params["file"],
      file_name: lesson_params["file_name"]
    }
    if @lesson.update(new_lesson_params)
      render json: @lesson, status: :accepted
    else
      render json: { errors: @lesson.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @lesson.destroy
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

  def find_or_create_user_grade_subject(current_user_grade_id, current_subject_id)
    current_user_grade_subject = UserGradeSubject.all.select do |user_grade_subject_hash|
      user_grade_subject_hash[:user_grade_id] == current_user_grade_id && user_grade_subject_hash[:subject_id] == current_subject_id
    end
    if current_user_grade_subject.length > 0
      current_user_grade_subject_id = current_user_grade_subject.first.id
      current_user_grade_subject_id
    else
      UserGradeSubject.create(user_grade_id: current_user_grade_id, subject_id: current_subject_id)
      current_user_grade_subject = UserGradeSubject.all.select do |user_grade_subject_hash|
        user_grade_subject_hash[:user_grade_id] == current_user_grade_id && user_grade_subject_hash[:subject_id] == current_subject_id
      end
      current_user_grade_subject_id = current_user_grade_subject.first.id
      current_user_grade_subject_id
    end
  end

  def lesson_params
    params.require(:lesson).permit(:title, :description, :grade_name, :subject_name, :file, :file_name)
  end

  def find_lesson
    @lesson = Lesson.find(params[:id])
  end
end
