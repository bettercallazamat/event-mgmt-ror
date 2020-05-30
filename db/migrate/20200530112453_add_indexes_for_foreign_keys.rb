class AddIndexesForForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_index :events, :creator_id
    add_index :attendences, :attended_event_id
    add_index :attendences, :attendee_id
  end
end
