class User < ApplicationRecord
  has_secure_password
  has_many :user_grades
  has_many :grades, through: :user_grades
  has_many :favorite_lessons
  validates :username, uniqueness: { case_sensative: false }
end
