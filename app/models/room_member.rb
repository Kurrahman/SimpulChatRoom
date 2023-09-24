class RoomMember < ApplicationRecord
  belongs_to :room, inverse_of: :room_members
  has_many :room_messages, inverse_of: :room_member
end
