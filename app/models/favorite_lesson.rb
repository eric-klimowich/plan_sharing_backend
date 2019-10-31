class FavoriteLesson < ApplicationRecord
  belongs_to :users
  belongs_to :lessons
end
