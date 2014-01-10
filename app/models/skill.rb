class Skill < ActiveRecord::Base
  has_many :skill_listing_links
  has_many :listings, through: :skill_listing_links
end