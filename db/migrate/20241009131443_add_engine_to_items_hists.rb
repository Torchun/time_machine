class AddEngineToItemsHists < ActiveRecord::Migration[7.2]
  def change
    add_column :items_hists, :engine, :string
  end
end
