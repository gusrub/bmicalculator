require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create_list(:user, 3).first
    @new_user = build(:user)
    sign_in_valid_user(create(:user, role: User.roles[:admin]))
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { dob: @user.dob, email: @user.email, first_name: @user.first_name, gender: @user.gender, last_name: @user.last_name, password: @user.password, picture: @user.picture, role: @user.role } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
