class PasswordResetsController < ApplicationController
  def new
  end

  
  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_passwordreset_email
      flash[:info] = "パスワード再設定の案内メールを送信しました。"
      redirect_to root_url
    else
      flash.now[:danger] = "メールアドレスが存在しません。"
      render 'new'
    end
  end


  def edit
  end

end
