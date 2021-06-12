require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = users(:sakashi)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "【U】アカウントの有効化をお願いします", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    # assert_match user.name,               mail.body.encoded
    # assert_match user.activation_token,   mail.body.encoded
    # assert_match CGI.escape(user.email),  mail.body.encoded
  end

  test "password_reset" do
    user = users(:sakashi)
    user.reset_token = User.new_token
    mail = UserMailer.password_reset(user)
    assert_equal "【U】パスワード再設定", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    # assert_match user.reset_token, mail.body.encoded
    # assert_match CGI.escape(user.email), mail.body.encoded
  end

end
