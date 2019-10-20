class Api::V1::UserGradesController < ApplicationController
  before_action :authenticate, only: [:create]

  def create
    @user_grade = UserGrade.create(user_grade_params)
    if @user_grade.valid?
      render json: @user_grade, status: :accepted
    else
      render json: { errors: @user_grade.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private
  def user_grade_params
    params.require(:user_grade).permit(:user_id, :subject_id)
  end
end
