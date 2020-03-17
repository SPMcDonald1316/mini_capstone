class RemoveColumnImageIdFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :image_id, :integer
  end
end
