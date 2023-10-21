class Donation < ApplicationRecord
  belongs_to :user
  has_one_attached :pic1
  has_one_attached :pic2
  has_one_attached :pic3
  has_many :donationreg, dependent: :destroy
end
