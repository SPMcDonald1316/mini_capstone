class AddImageUrltoProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :url, :text
  end
end
