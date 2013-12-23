class AddSourceIndex < ActiveRecord::Migration
  def change
  	add_column :listings, :id_source, :string
  	add_index :listings, :id_source, unique: true 
  end
end
