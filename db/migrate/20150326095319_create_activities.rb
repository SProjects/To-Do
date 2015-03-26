class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.string :name
      t.text :description, :null => true
      t.boolean :done, :default => false

      t.timestamps :null => false
    end
  end

  def self.down
  	drop_tabe :activities
  end
end
