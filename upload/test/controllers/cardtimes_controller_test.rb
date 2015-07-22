require 'test_helper'

class CardtimesControllerTest < ActionController::TestCase
  setup do
    @cardtime = cardtimes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cardtimes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cardtime" do
    assert_difference('Cardtime.count') do
      post :create, cardtime: { cardno: @cardtime.cardno, cardtime: @cardtime.cardtime, ou_id: @cardtime.ou_id, up_data: @cardtime.up_data }
    end

    assert_redirected_to cardtime_path(assigns(:cardtime))
  end

  test "should show cardtime" do
    get :show, id: @cardtime
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cardtime
    assert_response :success
  end

  test "should update cardtime" do
    patch :update, id: @cardtime, cardtime: { cardno: @cardtime.cardno, cardtime: @cardtime.cardtime, ou_id: @cardtime.ou_id, up_data: @cardtime.up_data }
    assert_redirected_to cardtime_path(assigns(:cardtime))
  end

  test "should destroy cardtime" do
    assert_difference('Cardtime.count', -1) do
      delete :destroy, id: @cardtime
    end

    assert_redirected_to cardtimes_path
  end
end
