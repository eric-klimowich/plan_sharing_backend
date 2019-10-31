class Lesson < ApplicationRecord
  has_many :favorite_lessons
  belongs_to :user_grade_subject
end
