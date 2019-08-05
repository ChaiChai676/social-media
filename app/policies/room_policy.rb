class RoomPolicy < ApplicationPolicy
  attr_reader :user, :room

  def initialize(user, room)
    @user = user
    @room = room
  end

  def create?
    true
  end

  def new?
    true
  end

  def show?
    room.users.ids.include?(user.id)
  end
end
