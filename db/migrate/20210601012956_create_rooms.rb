class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :room_introduce
      t.integer :fee
      t.string :address
      t.string :room_img_url
      t.integer :register_user_id

      t.timestamps
    end
  end
end
