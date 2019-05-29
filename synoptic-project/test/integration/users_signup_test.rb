require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "134",
                                         password_confirmation: "124" } }
    end
    assert_template 'users/new'
  end

  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "3246", password_confirmation: "3246")
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         mobile: "09816291",
                                         emplpyeeid: "asd3adaa2",
                                         password:              "1234",
                                         password_confirmation: "1234" } }
    end
    follow_redirect!
    assert_template 'users/show'
  end
end