class CreateRoomMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :room_members do |t|
      t.references :room, null: false, foreign_key: true
      t.string :name
      t.integer :color

      t.timestamps
    end
  end
end
