require "test_helper"

class FunctionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @function = functions(:one)
  end

  test "should get index" do
    get functions_url
    assert_response :success
  end

  test "should get new" do
    get new_function_url
    assert_response :success
  end

  test "should create function" do
    assert_difference('Function.count') do
      post functions_url, params: { function: { movie_id: @function.movie_id, room: @function.room, schedule: @function.schedule } }
    end

    assert_redirected_to function_url(Function.last)
  end

  test "should show function" do
    get function_url(@function)
    assert_response :success
  end

  test "should get edit" do
    get edit_function_url(@function)
    assert_response :success
  end

  test "should update function" do
    patch function_url(@function), params: { function: { movie_id: @function.movie_id, room: @function.room, schedule: @function.schedule } }
    assert_redirected_to function_url(@function)
  end

  test "should destroy function" do
    assert_difference('Function.count', -1) do
      delete function_url(@function)
    end

    assert_redirected_to functions_url
  end
end
