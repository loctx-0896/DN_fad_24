class Product < ApplicationRecord
  attr_accessor :total_quantity
  enum status: {active: 1, unactive: 0}
  has_many :reviews, dependent: :destroy
  has_many :detail_orders
  belongs_to :category
  mount_uploader :picture, PictureUploader
  scope :sort_products, ->{order(created_at: :desc)}
  scope :find_product_by_id, ->(ids){where id: ids}
end
