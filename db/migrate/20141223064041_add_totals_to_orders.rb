class AddTotalsToOrders < ActiveRecord::Migration
  def up
    add_column :orders, :subtotal, :float
    add_column :orders, :tax, :float
    add_column :orders, :total, :float
  end

  def down
    remove_column :orders, :subtotal
    remove_column :orders, :tax
    remove_column :orders, :total
  end
end
