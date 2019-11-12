class Api::V1::RequestsController < ApplicationController
  before_action :authenticate, only: [:create]

  def index
    @requests = Request.all
    render json: @requests
  end

  def create
    @request = Request.create(request_params)
    if @request.valid?
      render json: @request, status: :accepted
    else
      render json: { errors: @request.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private
  def request_params
    params.require(:request).permit(:title, :content, :user_id)
  end
end
