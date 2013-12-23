class Skills < ActiveRecord::Migration
  def change
  	create_table :skills do |t|
      t.text :skill
  	  end
  end
end
