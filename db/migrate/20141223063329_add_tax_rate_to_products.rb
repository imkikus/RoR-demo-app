class AddTaxRateToProducts < ActiveRecord::Migration

  def up
  	add_column :products, :tax_rate, :decimal
  end

  def down
  	remove_column :products, :tax_rate
  end
end
