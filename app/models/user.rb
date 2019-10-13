class User < ApplicationRecord
  has_secure_password
  has_many :subjects
  validates :username, uniqueness: { case_sensative: false }
end
