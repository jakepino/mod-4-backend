class AddPosidToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :Comments, :post_id, :integer

  end
end
