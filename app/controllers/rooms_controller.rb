class RoomsController < ApplicationController
    before_action :load_entities

    def index
        @rooms = Room.all
    end

    def new
        @room = Room.new
    end

    def create
        if !Room.exists?(['name LIKE ?', "#{params[:name]}"])
            @room = Room.new permitted_parameters
            
            if @room.save
                flash[:success] = "Room #{@room.name} was created successfully"
                redirect_to room_path(@room.name)
            else
                redirect_to root_path
            end
        else
            redirect_to room_path(params[:name])
        end
    end

    def edit
    end

    def update
        if @room.update_attributes(permitted_parameters)
            flash[:success] = "Room #{@room.name} was updated successfully"
            redirect_to rooms_path
        else
            render :new
        end
    end

    def show
        @room_message = RoomMessage.new room: @room
        if helpers.room_member_session(@room.id)
            @room_member = RoomMember.find(session[@room.id])
        end

        @room_messages = @room.room_messages
        @room_members = @room.room_members
        p @room_members
    end

    protected

    def load_entities
        if Room.where(name: params[:id]).exists?
            @room = Room.find_by(name: params[:id])
        end
    end

    def permitted_parameters
        params.permit(:name)
    end
end
