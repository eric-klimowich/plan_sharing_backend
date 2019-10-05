class User < ApplicationRecord
  has_secure_password
  has_many :lessons
  validates :username, uniqueness: { case_sensative: false }
end
