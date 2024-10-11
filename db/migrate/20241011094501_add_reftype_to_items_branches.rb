class AddReftypeToItemsBranches < ActiveRecord::Migration[7.2]
  def change
    add_column :items_branches, :reftype, :string
  end
end
