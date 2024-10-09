class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.string :f1
      t.integer :f2
      t.date :f3

      t.timestamps
    end
  end
end
