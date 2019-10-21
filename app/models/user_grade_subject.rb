class UserGradeSubject < ApplicationRecord
  belongs_to :user_grade
  belongs_to :subject
  has_many :lessons
end
