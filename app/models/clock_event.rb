class ClockEvent < ApplicationRecord
  belongs_to :user

  scope :incomplete, -> { where(check_out: nil) }
  scope :completed, -> { where.not(check_out: nil) }

  def completed?
    check_in.present? && check_out.present?
  end

  def total_hours
    check_out.to_i - check_in.to_i
  end
end
