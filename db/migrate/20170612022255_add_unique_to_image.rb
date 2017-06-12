class AddUniqueToImage < ActiveRecord::Migration[5.1]
  def change
    remove_index :images, [:contact_id]
    add_index :images, [:contact_id], unique: true
  end
end
