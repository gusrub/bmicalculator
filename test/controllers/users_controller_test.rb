require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create_list(:user, 3).first
    @new_user = build(:user)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { dob: @new_user.dob, email: @new_user.email, first_name: @new_user.first_name, gender: @new_user.gender, last_name: @new_user.last_name, password: @new_user.password, picture: @new_user.picture, role: @new_user.role } }
    end

    assert_redirected_to user_url(User.last)
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
