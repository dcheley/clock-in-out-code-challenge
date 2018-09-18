class Attendance < ApplicationRecord
  belongs_to :user

  validates :status, inclusion: 1..2

  scope :start, -> { where(status: 1) }
  scope :end, -> { where(status: 2) }
end
