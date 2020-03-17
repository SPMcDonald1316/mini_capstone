class AddColumnImageIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :image_id, :integer
  end
end
