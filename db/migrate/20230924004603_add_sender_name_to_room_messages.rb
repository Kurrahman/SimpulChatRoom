class AddSenderNameToRoomMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :room_messages, :sender_name, :string
  end
end
