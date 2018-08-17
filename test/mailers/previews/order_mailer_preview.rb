class OrderMailerPreview < ActionMailer::Preview

  def order_email_preview
    OrderMailer.order_email(@order_items, Order.last)
  end

end