class AddSkillsId < ActiveRecord::Migration
  def change
  	add_index :skills, :skill, unique: true
  end
end
