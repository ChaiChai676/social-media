class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = policy_scope(Room)
  end

  def new
    @room = Room.new
    authorize @room
  end

  def create
    @room = Room.new(permitted_parameters)
    authorize @room
    @room.users << current_user
    if @room.save
      flash[:success] = "Room #{@room.name} was created successfully"
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    authorize @room

    @room_message = RoomMessage.new room: @room
    @room_messages = @room.room_messages.includes(:user)
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

  private

  def permitted_parameters
    params.require(:room).permit(:name, :user_ids)
  end
end
