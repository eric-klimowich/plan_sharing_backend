class User < ApplicationRecord
  has_secure_password
  has_many :user_grades
  has_many :grades, through: :user_grades
  has_many :favorite_lessons
  has_many :comments
  has_many :requests
  has_many :responses
  validates :username, uniqueness: { case_sensative: false }
end
