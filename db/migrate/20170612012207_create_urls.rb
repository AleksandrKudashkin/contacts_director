class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.string :address
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
