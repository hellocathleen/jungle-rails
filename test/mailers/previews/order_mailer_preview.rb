class OrderMailerPreview < ActionMailer::Preview

  def order_email_preview
    OrderMailer.order_email(Order.last)
  end

end