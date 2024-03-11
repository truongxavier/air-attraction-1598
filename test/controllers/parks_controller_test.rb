require "test_helper"

class ParksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parks_index_url
    assert_response :success
  end

  test "should get show" do
    get parks_show_url
    assert_response :success
  end

  test "should get new" do
    get parks_new_url
    assert_response :success
  end

  test "should get create" do
    get parks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get parks_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get parks_edit_url
    assert_response :success
  end

  test "should get accept" do
    get parks_accept_url
    assert_response :success
  end

  test "should get decline" do
    get parks_decline_url
    assert_response :success
  end
end
