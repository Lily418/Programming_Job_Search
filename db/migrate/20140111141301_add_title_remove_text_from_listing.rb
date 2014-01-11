class AddTitleRemoveTextFromListing < ActiveRecord::Migration
  def change
  	add_column :listings, :title, :string
  	add_column :listings, :company, :string
  end
end
