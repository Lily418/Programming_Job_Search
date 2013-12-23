class SkillsListingLink < ActiveRecord::Migration
  def change
  	create_table :skill_listing_links do |t|
  		t.belongs_to :listing
  		t.belongs_to :skill
  	end
  end
end
