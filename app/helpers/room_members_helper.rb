module RoomMembersHelper
    def room_member_session(room_id)
        if session[room_id]
            true
        else
            false
        end
    end
end
