class Category < ActiveRecord::Base
  has_many :products

  validates :name, presence: true
  validates :thumburl, format: { with: URI::regexp(%w(http https)) }

  has_attached_file :category_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/no_image.png"
  validates_attachment_content_type :category_image, :content_type => /\Aimage\/.*\Z/

  # attr_accessor :delete_category_image
  # before_validation { delete_category_image.clear if delete_category_image == '1' }
end
