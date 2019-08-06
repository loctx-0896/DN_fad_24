class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: "Sample Email"
  end
end
