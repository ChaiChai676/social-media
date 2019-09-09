class RoomMessage < ApplicationRecord
  validates :message, presence: true, unless: -> { file.attached? }

  validates_associated :user, :room

  belongs_to :user
  belongs_to :room, inverse_of: :room_messages

  has_one_attached :file

  after_update :as_json

  def as_json(options)
    # if file.attached?
    #   super(options).merge(user_avatar_url: user.gravatar_url, user_first_name: user.first_name, file_name: file.filename, file_url: "youtube.com")
    # else
      super(options).merge(user_avatar_url: user.gravatar_url, user_first_name: user.first_name, file_url: "youtube.com")
    # end
  end
end
