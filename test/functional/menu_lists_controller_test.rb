require 'test_helper'

class MenuListsControllerTest < ActionController::TestCase
  setup do
    @menu_list = menu_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:menu_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create menu_list" do
    assert_difference('MenuList.count') do
      post :create, menu_list: { title: @menu_list.title }
    end

    assert_redirected_to menu_list_path(assigns(:menu_list))
  end

  test "should show menu_list" do
    get :show, id: @menu_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @menu_list
    assert_response :success
  end

  test "should update menu_list" do
    put :update, id: @menu_list, menu_list: { title: @menu_list.title }
    assert_redirected_to menu_list_path(assigns(:menu_list))
  end

  test "should destroy menu_list" do
    assert_difference('MenuList.count', -1) do
      delete :destroy, id: @menu_list
    end

    assert_redirected_to menu_lists_path
  end
end
