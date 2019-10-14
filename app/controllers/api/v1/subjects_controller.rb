class Api::V1::SubjectsController < ApplicationController
  before_action :authenticate, only: [:create]

  def create
    @subject = Subject.create(subject_params)
    if @subject.valid?
      render json: @subject, status: :accepted
    else
      render json: { errors: @subject.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private
  def subject_params
    params.require(:subject).permit(:name, :user_id)
  end
end
