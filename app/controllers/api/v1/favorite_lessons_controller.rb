class Api::V1::FavoriteLessonsController < ApplicationController
  def index
    @favorite_lessons = FavoriteLesson.all
    render json: @favorite_lessons
  end
end
