class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
    	t.text :string
    end
  end
end
