class RemoveRoomImgUrlToRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :varchar, :varchar
  end
end
