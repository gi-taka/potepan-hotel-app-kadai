class ChangeRoomsColumnTitle < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :room_introduce, :room_introduction
  end
end
