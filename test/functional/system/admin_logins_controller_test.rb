require 'test_helper'

class System::AdminLoginsControllerTest < ActionController::TestCase
  setup do
    @system_admin_login = system_admin_logins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:system_admin_logins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create system_admin_login" do
    assert_difference('System::AdminLogin.count') do
      post :create, system_admin_login: { name: @system_admin_login.name, password: @system_admin_login.password, salt: @system_admin_login.salt }
    end

    assert_redirected_to system_admin_login_path(assigns(:system_admin_login))
  end

  test "should show system_admin_login" do
    get :show, id: @system_admin_login
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @system_admin_login
    assert_response :success
  end

  test "should update system_admin_login" do
    put :update, id: @system_admin_login, system_admin_login: { name: @system_admin_login.name, password: @system_admin_login.password, salt: @system_admin_login.salt }
    assert_redirected_to system_admin_login_path(assigns(:system_admin_login))
  end

  test "should destroy system_admin_login" do
    assert_difference('System::AdminLogin.count', -1) do
      delete :destroy, id: @system_admin_login
    end

    assert_redirected_to system_admin_logins_path
  end
end
