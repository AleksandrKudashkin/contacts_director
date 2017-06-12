class AddCommentToUrl < ActiveRecord::Migration[5.1]
  def change
    add_column :urls, :comment, :string
  end
end
