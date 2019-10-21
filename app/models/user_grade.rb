class UserGrade < ApplicationRecord
  belongs_to :user
  belongs_to :grade
  has_many :user_grade_subjects
  has_many :subjects, through: :user_grade_subjects
end
