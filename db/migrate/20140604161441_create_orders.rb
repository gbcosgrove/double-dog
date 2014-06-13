class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :employee_id
      t.integer :item_id

      t.timestamps
    end
  end
end
