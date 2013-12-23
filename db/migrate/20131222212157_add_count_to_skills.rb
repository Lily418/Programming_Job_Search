class AddCountToSkills < ActiveRecord::Migration
  def change
  	add_column :skills, :count, :integer
  end
end
