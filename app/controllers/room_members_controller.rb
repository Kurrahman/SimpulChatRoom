class RoomMembersController < ApplicationController
    before_action :load_entities

    def create
        @room_member = RoomMember.create room: @room,
                            name: params[:name]

        session[@room.id] = @room_member.id
        redirect_to room_path(@room.name)
    end

    protected

    def load_entities
        @room = Room.find(params[:room_id])
    end
end
