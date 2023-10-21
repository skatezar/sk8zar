class Skatespot < ApplicationRecord
  belongs_to :user
  has_one_attached :pic1
  has_one_attached :pic2
  has_one_attached :pic3
  geocoded_by :location   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  $type_of_spots = ['Skatepark', 'Street']
end
