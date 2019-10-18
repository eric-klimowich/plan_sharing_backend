class Grade < ApplicationRecord
  has_many :user_grades
  has_many :users, through: :user_grades
end
