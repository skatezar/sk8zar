class Claim < ApplicationRecord
  belongs_to :communitytask
  belongs_to :user
end
