class AddFileToContact < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :file, :string
  end
end
