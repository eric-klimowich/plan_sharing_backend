class Api::V1::ResponsesController < ApplicationController
  before_action :authenticate, only: [:create]

  def index
    @responses = Response.all
    render json: @responses
  end

  def create
    @response = Response.create(response_params)
    if @response.valid?
      render json: @response, status: :accepted
    else
      render json: { errors: @response.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private
  def response_params
    params.require(:response).permit(:content, :user_id, :request_id)
  end
end
