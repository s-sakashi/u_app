class ApplicationController < ActionController::Base
    include SessionsHelper
    # ユーザーのログインを確認する
    private

    # ユーザーのログインを確認する
    def logged_in_user
        unless logged_in?
          store_location
          flash[:danger] = "温泉に入る前に、まずは服を脱ごう（※ログインが必要です）"
          redirect_to login_url
        end
    end
end
