require 'test_helper'

class LibsControllerTest < ActionController::TestCase
  setup do
    @lib = libs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:libs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lib" do
    assert_difference('Lib.count') do
      post :create, lib: { author: @lib.author, code: @lib.code, created_at: @lib.created_at, name: @lib.name }
    end

    assert_redirected_to lib_path(assigns(:lib))
  end

  test "should show lib" do
    get :show, id: @lib
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lib
    assert_response :success
  end

  test "should update lib" do
    patch :update, id: @lib, lib: { author: @lib.author, code: @lib.code, created_at: @lib.created_at, name: @lib.name }
    assert_redirected_to lib_path(assigns(:lib))
  end

  test "should destroy lib" do
    assert_difference('Lib.count', -1) do
      delete :destroy, id: @lib
    end

    assert_redirected_to libs_path
  end
end
