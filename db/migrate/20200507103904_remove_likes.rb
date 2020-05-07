class RemoveLikes < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :likes, :integer

  end
end
