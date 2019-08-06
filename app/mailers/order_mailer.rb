class OrderMailer < ApplicationMailer
  include ApplicationHelper
  helper :application

  def send_order_email order
    @order = order
    mail to: order.user.email, subject: t(".subject")
  end
end
