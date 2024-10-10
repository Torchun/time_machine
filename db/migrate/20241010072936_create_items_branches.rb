class CreateItemsBranches < ActiveRecord::Migration[7.2]
  def change
    create_table :items_branches do |t|
      t.references :items_hist, null: false, foreign_key: true
      t.integer :item_id, null: false
      t.string :refid

      t.timestamps
    end
    add_index :items_branches, :item_id
  end
end
