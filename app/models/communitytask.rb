class Communitytask < ApplicationRecord
  belongs_to :user
  has_many :claims, dependent: :destroy
end
