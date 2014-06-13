class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :orders
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
