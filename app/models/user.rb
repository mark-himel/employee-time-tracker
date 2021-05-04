class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  validates :name, :email, presence: true
  validates_uniqueness_of :email
end
