class UserGrade < ApplicationRecord
  belongs_to :users
  belongs_to :grades
end
