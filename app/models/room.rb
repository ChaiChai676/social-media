class Room < ApplicationRecord
  validates :name, presence: true

  has_many :room_messages, dependent: :destroy, inverse_of: :room
  has_and_belongs_to_many :users
end
