class AddItemsHistToItemsHists < ActiveRecord::Migration[7.2]
  def change
    add_reference :items_hists, :items_hist, null: true, foreign_key: true
  end
end
