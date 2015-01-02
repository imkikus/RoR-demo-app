class DropOrderTable < ActiveRecord::Migration

  def up
  	drop_table :orders

  	create_table :orders do |t|
  		t.string :status
  		t.text :billing_address
  		t.text :shipping_address
  		t.references :user
  		t.timestamps
  	end
  end

  def down
  	drop_table :orders

  	create_table :orders do |t|
      t.string :status
      t.timestamps
    end
  end
end
