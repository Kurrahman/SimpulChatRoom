module RoomMessagesHelper
    def getSenderName(message)
        if (message.room_member_id)
            name = RoomMember.find(message.room_member_id).name
        end
    end
end
