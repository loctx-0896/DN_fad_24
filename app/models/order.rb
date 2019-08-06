class Order < ApplicationRecord
  enum status: {order_success: 1, delivered: 2}
  has_many :detail_orders, dependent: :destroy
  belongs_to :user
  scope :sort_orders, ->{order(created_at: :desc)}
  validates :name, presence: true
  validates :phone, presence: true
  validates :address, presence: true
end
