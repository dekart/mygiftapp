class CreateGifts < ActiveRecord::Migration
  def self.up
    create_table :gifts do |t|
      t.column  :sender_uid,    :bigint
      t.column  :receiver_uid,  :bigint
      
      t.column  :gift_type_id,  :integer
      t.column  :message,       :text
      
      t.timestamps
    end
  end

  def self.down
    drop_table :gifts
  end
end
