class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :employee_id
      t.integer :item_id
    end
  end
end
