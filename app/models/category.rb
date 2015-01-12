class Category < ActiveRecord::Base
  has_many :products

  validates :name, presence: true
  # validates :thumburl, format: { with: URI::regexp(%w(http https)) }

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/no_image.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # attr_accessor :delete_image
  # before_validation { delete_image.clear if delete_image == '1' }
end
