class CreateRoomMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :room_messages do |t|
      t.references :room, null: false, foreign_key: true
      t.references :room_members, null: false, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
