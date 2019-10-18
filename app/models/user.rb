class User < ApplicationRecord
  has_secure_password
  has_many :user_grades
  has_many :grades, through: :user_grades
  validates :username, uniqueness: { case_sensative: false }
end
