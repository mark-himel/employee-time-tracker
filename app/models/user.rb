class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  validates :name, :email, presence: true
  validates_uniqueness_of :email

  has_many :clock_events

  def clock_event
    @clock_event ||= clock_events.incomplete.last || clock_events.new
  end
end
