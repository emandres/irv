require 'test_helper'

class AuthorizationsControllerTest < ActionController::TestCase
  setup do
    @authorization = authorizations(:one)
    @user = users(:one)
    session[:user_id] = users(:one).id
  end

  test "should get index" do
    get :index, user_id: @user.id
    assert_response :success
    assert_not_nil assigns(:authorizations)
  end

  test "should create authorization" do
    assert_difference('Authorization.count') do
      post :create, authorization: { role_id: roles(:one).id }, user_id: @user.id
    end

    assert_redirected_to user_authorizations_path(@user)
  end

  test "should destroy authorization" do
    assert_difference('Authorization.count', -1) do
      delete :destroy, id: @authorization, user_id: @user.id
    end

    assert_redirected_to user_authorizations_path(@user)
  end
end
