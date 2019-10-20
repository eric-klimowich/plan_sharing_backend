class Api::V1::GradesController < ApplicationController
  before_action :authenticate, only: [:create]

  def create
    @grade = Grade.create(grade_params)
    if @grade.valid?
      render json: @grade, status: :accepted
    else
      render json: { errors: @grade.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private
  def grade_params
    params.require(:grade).permit(:grade_name)
  end
end
