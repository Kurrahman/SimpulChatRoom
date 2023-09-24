class FixRoomMemberName < ActiveRecord::Migration[7.0]
  def change
    rename_column :room_messages, :room_members_id, :room_member_id
  end
end
