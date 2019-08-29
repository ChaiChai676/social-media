class RoomMessagesController < ApplicationController
  before_action :load_new_message

  def create
    # @room_message = RoomMessage.create  user: current_user,
    #                                     room: @room,
    #                                     message: params.dig(:room_message, :message)

    @room_message = RoomMessage.create(room_message_params)

    authorize @room_message
    RoomChannel.broadcast_to @room, @room_message
  end

  protected

  def load_new_message
    @room = Room.find params.dig(:room_message, :room_id)
  end

  def room_message_params
    params.require(:room_message).permit(:message, :user_id, :room_id)
  end
end
