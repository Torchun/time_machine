class AddRefidToItemsHists < ActiveRecord::Migration[7.2]
  def change
    add_column :items_hists, :refid, :string
  end
end
