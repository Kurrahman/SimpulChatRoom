class RoomMessagesController < ApplicationController
    before_action :load_entities

    def create
        @room_message = RoomMessage.create room: @room,
                            room_member: @room_member, 
                            message: params.dig(:room_message, :message),
                            sender_name: @room_member.name
        RoomChannel.broadcast_to @room, @room_message
    end

    protected

    def load_entities
        @room = Room.find(params.dig(:room_message, :room_id))
        @room_member = RoomMember.find(session[@room.id])
    end

end
