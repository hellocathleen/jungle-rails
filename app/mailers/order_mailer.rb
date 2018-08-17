class OrderMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_email(order_items, order)
    @order_items = order_items
    @order = order
    mail(to: order.email, subject: "Your order number is #{order.id}")
  end
end
