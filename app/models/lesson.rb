class Lesson < ApplicationRecord
  has_many :favorite_lessons
  has_many :comments
  belongs_to :user_grade_subject
end
