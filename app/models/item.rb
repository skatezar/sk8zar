class Item < ApplicationRecord
    geocoded_by :location   # can also be an IP address
    after_validation :geocode          # auto-fetch coordinates
    acts_as_taggable_on :tags
    acts_as_taggable_on :brands, :categories
    has_one_attached :photo
    has_one_attached :photo2
    has_one_attached :photo3
    has_many :skatezarcoinorders
    belongs_to :user
    has_many :chatrooms, dependent: :destroy
    $categories = ["Board", "Complete", "Clothing", "Shoes", "Obstacle", "Trucks", "Wheels", "Hardware", "Griptape", "Skate Art", "Fingerboard", "Longboard", "Other"]

    validates :category, :photo, :price, :condition, :description, presence: true
    def general_info
      "#{condition} #{brand} #{category} #{size}"
    end

    #Item.where(category: "Trucks").distinct.pluck(:size)
    $brands = Item.distinct.pluck(:brand)
    $sizes = Item.distinct.pluck(:size)
    $conditions = ["New", "Used"]

    include PgSearch::Model
    pg_search_scope :search_by_filters,
      against: [ :category, :brand,:size, :condition, :location, :title ],
      using: {
        tsearch: { prefix: true }
      }
end
