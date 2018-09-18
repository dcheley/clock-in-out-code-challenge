class Attendance < ApplicationRecord
  belongs_to :user

  scope :start, -> { where(status: 1) }
  scope :end, -> { where(status: 2) }

  validates :status, inclusion: 1..2
  validates_uniqueness_of :date_created, scope: [:user_id, :status]
end
