class Subject < ApplicationRecord
  has_many :user_grade_subjects
  has_many :user_grades, through: :user_grade_subjects
end
