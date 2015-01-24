require 'test_helper'

class VintsControllerTest < ActionController::TestCase
  setup do
    @vint = vints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vint" do
    assert_difference('Vint.count') do
      post :create, vint: { app_id: @vint.app_id, descraption: @vint.descraption, location_id: @vint.location_id, title: @vint.title, video_url: @vint.video_url }
    end

    assert_redirected_to vint_path(assigns(:vint))
  end

  test "should show vint" do
    get :show, id: @vint
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vint
    assert_response :success
  end

  test "should update vint" do
    put :update, id: @vint, vint: { app_id: @vint.app_id, descraption: @vint.descraption, location_id: @vint.location_id, title: @vint.title, video_url: @vint.video_url }
    assert_redirected_to vint_path(assigns(:vint))
  end

  test "should destroy vint" do
    assert_difference('Vint.count', -1) do
      delete :destroy, id: @vint
    end

    assert_redirected_to vints_path
  end
end
