require 'test_helper'

class System::LoginsControllerTest < ActionController::TestCase
  setup do
    @system_login = system_logins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:system_logins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create system_login" do
    assert_difference('System::Login.count') do
      post :create, system_login: { hashed_password: @system_login.hashed_password, name: @system_login.name, salt: @system_login.salt }
    end

    assert_redirected_to system_login_path(assigns(:system_login))
  end

  test "should show system_login" do
    get :show, id: @system_login
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @system_login
    assert_response :success
  end

  test "should update system_login" do
    put :update, id: @system_login, system_login: { hashed_password: @system_login.hashed_password, name: @system_login.name, salt: @system_login.salt }
    assert_redirected_to system_login_path(assigns(:system_login))
  end

  test "should destroy system_login" do
    assert_difference('System::Login.count', -1) do
      delete :destroy, id: @system_login
    end

    assert_redirected_to system_logins_path
  end
end
