class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.float :unit_price
      t.integer :quantity
      t.float :tax
      t.float :total
      t.references :order
      t.references :product
      t.timestamps
    end
  end
end
