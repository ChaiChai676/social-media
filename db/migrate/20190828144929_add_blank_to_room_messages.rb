class AddBlankToRoomMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :room_messages, :blank, :boolean
  end
end
