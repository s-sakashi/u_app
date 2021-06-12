class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "【U】アカウントの有効化をお願いします"
  end

  def password_reset(user)
    @user = user
    mail to: user.email , subject: "【U】パスワード再設定"
  end
end
