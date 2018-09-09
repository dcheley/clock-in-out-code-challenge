class Attendance < ApplicationRecord
  belongs_to :user

  scope :start, -> { where(status: 1) }
  scope :end, -> { where(status: 2) }
end
