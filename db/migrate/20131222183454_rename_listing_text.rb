class RenameListingText < ActiveRecord::Migration
  def change
  	rename_column :listings, :string, :text
  end
end
