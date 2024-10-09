class CreateItemsHists < ActiveRecord::Migration[7.2]
  def change
    create_table :items_hists do |t|
      t.integer :items_id
      t.string :f1
      t.integer :f2
      t.date :f3
      t.datetime :items_created_at
      t.datetime :items_updated_at
      t.string :op_hist

      t.timestamps
    end
  end
end
