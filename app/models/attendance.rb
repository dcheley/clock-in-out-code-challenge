class Attendance < ApplicationRecord
  before_validation :extract_date

  belongs_to :user

  scope :start, -> { where(status: 1) }
  scope :end, -> { where(status: 2) }

  validates :status, inclusion: 1..2
  # Only one clock in and clock out time per day
  validates_uniqueness_of :date_created, scope: [:user_id, :status]

  private
  # Set date based on the date that Object is created
  def extract_date
    unless self.created_at.nil?
      self.date_created = self.created_at.to_date
    end
  end
end
