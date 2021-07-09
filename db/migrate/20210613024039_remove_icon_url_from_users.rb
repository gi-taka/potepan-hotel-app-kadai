class RemoveIconUrlFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :icon_img_url, :string
  end
end
