class Category < ActiveRecord::Base
  include Image
  has_many :products

  validates :name, presence: true
  # validates :thumburl, format: { with: URI::regexp(%w(http https)) }

  # attr_accessor :delete_image
  # before_validation { delete_image.clear if delete_image == '1' }
end
