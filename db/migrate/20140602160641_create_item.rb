class CreateItem < ActiveRecord::Migration
  def change
      create_table :items do |t|
      t.string :name
      t.string :price
  end
end
