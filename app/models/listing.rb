class Listing < ActiveRecord::Base
  has_many :skill_listing_links
  has_many :skills, through: :skill_listing_links
end