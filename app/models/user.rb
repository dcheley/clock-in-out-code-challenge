class User < ApplicationRecord
  has_secure_password

  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }, uniqueness: true
  validates :password, length: { in: 8..16 }, format: { with: /\A((?=.*[a-z])(?=.*[A-Z])(?=.*[\d])(?=.*[!@#$%&])).*\Z/, message: "must include at least one lowercase letter, one uppercase letter, one digit and symbol (!@#$%&)" }, on: [:create, :update]
end
