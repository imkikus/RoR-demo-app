class Category < ActiveRecord::Base
  has_many :products

  validates :name, presence: true
  validates :thumburl, format: { with: URI::regexp(%w(http https)) }
end
