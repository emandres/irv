require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    session[:user_id] = users(:one).id
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: 'tom@tom.com', password: 'a', password_confirmation: 'a' }
    end

    assert_redirected_to root_url
  end

  test "should show user" do
    session[:user_id] = users(:one).id
    get :show, id: @user
    assert_response :success
  end

  test "should destroy user" do
    session[:user_id] = users(:one).id
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
