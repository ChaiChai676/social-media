class RoomMessage < ApplicationRecord
  validates :message, :user, :room, presence: true

  belongs_to :user
  belongs_to :room, inverse_of: :room_messages

  def as_json(options)
    super(options).merge(user_avatar_url: user.gravatar_url, user_first_name: user.first_name)
  end
end
