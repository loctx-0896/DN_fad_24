class Order < ApplicationRecord
  enum status: {order_success: 1, delivered: 2}
  has_many :detail_orders, dependent: :destroy
  belongs_to :user
  scope :sort_orders, ->{order(created_at: :desc)}
  validates :name, presence: true
  validates :phone, presence: true
  validates :address, presence: true

  def send_order_to_email
    OrderMailer.send_order_email(self).deliver_now
  end
end
