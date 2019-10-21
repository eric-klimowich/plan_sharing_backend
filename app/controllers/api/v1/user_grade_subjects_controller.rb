class Api::V1::UserGradeSubjectsController < ApplicationController
  before_action :authenticate, only: [:create]

  def create
    @user_grade_subject = UserGrade.create(user_grade_subject_params)
    if @user_grade_subject.valid?
      render json: @user_grade_subject, status: :accepted
    else
      render json: { errors: @user_grade_subject.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private
  def user_grade_subject_params
    params.require(:user_grade_subject).permit(:user_grade_id, :subject_id)
  end
end
