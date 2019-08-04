class CreateJoinTableRoomsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :rooms, :users do |t|
      t.references :room, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
