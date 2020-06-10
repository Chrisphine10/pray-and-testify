require 'test_helper'

class PrayersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prayers_index_url
    assert_response :success
  end

  test "should get new" do
    get prayers_new_url
    assert_response :success
  end

  test "should get create" do
    get prayers_create_url
    assert_response :success
  end

  test "should get edit" do
    get prayers_edit_url
    assert_response :success
  end

  test "should get update" do
    get prayers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get prayers_destroy_url
    assert_response :success
  end

end
