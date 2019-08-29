class RoomMessagesController < ApplicationController
  before_action :load_new_message

  def create
    @room_message = RoomMessage.create(room_message_params)

    authorize @room_message
    RoomChannel.broadcast_to @room, @room_message

    redirect_to @room
  end

  protected

  def load_new_message
    @room = Room.find params.dig(:room_message, :room_id)
  end

  def room_message_params
    params.require(:room_message).permit(:message, :user_id, :room_id)
  end
end
