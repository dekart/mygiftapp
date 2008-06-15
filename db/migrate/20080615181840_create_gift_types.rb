class CreateGiftTypes < ActiveRecord::Migration
  def self.up
    create_table :gift_types do |t|
      t.string :name
      
      t.timestamps
    end
  end

  def self.down
    drop_table :gift_types
  end
end
