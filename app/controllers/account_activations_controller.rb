class AccountActivationsController < ApplicationController
    def edit
        user = User.find_by(email: params[:email])
        if user && !user.activated? && user.authenticated?(:activation, params[:id])
          user.update_attribute(:activated,    true)
          user.update_attribute(:activated_at, Time.zone.now)
          log_in user
          flash[:success] = "アカウントが有効化されました！"
          redirect_to user
        else
          flash[:danger] = "有効化に失敗しました。リンクを確認してください。"
          redirect_to root_url
        end
      end
end
