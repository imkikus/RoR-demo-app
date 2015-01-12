class ChangeNameAndImageAddDescriptionFieldsToProductAndCategory < ActiveRecord::Migration
  def up
    add_column :categories, :description, :text 
    rename_column :products, :product_name, :name
    rename_column :products, :product_image_file_name, :image_file_name
    rename_column :products, :product_image_content_type, :image_content_type
    rename_column :products, :product_image_file_size, :image_file_size
    rename_column :products, :product_image_updated_at, :image_updated_at
    rename_column :categories, :category_image_file_name, :image_file_name
    rename_column :categories, :category_image_content_type, :image_content_type
    rename_column :categories, :category_image_file_size, :image_file_size
    rename_column :categories, :category_image_updated_at, :image_updated_at    
    remove_column :categories, :thumburl
    remove_column :products, :thumburl
  end

  def down
    remove_column :categories, :description
    rename_column :products, :name, :product_name
    rename_column :products, :image_file_name, :product_image_file_name
    rename_column :products, :image_content_type, :product_image_content_type
    rename_column :products, :image_file_size, :product_image_file_size
    rename_column :products, :image_updated_at, :product_image_updated_at
    rename_column :categories, :image_file_name, :category_image_file_name
    rename_column :categories, :image_content_type, :category_image_content_type
    rename_column :categories, :image_file_size, :category_image_file_size
    rename_column :categories, :image_updated_at, :category_image_updated_at     
    add_column :categories, :thumburl, :string
    add_column :products, :thumburl, :string
  end
end
