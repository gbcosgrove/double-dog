class CreateOrder < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    t.string :employee_id
    t.string :price
  end
end
