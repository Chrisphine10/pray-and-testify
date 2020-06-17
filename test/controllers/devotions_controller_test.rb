require 'test_helper'

class DevotionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @devotion = devotions(:one)
  end

  test "should get index" do
    get devotions_url
    assert_response :success
  end

  test "should get new" do
    get new_devotion_url
    assert_response :success
  end

  test "should create devotion" do
    assert_difference('Devotion.count') do
      post devotions_url, params: { devotion: { content: @devotion.content, title: @devotion.title, verse: @devotion.verse } }
    end

    assert_redirected_to devotion_url(Devotion.last)
  end

  test "should show devotion" do
    get devotion_url(@devotion)
    assert_response :success
  end

  test "should get edit" do
    get edit_devotion_url(@devotion)
    assert_response :success
  end

  test "should update devotion" do
    patch devotion_url(@devotion), params: { devotion: { content: @devotion.content, title: @devotion.title, verse: @devotion.verse } }
    assert_redirected_to devotion_url(@devotion)
  end

  test "should destroy devotion" do
    assert_difference('Devotion.count', -1) do
      delete devotion_url(@devotion)
    end

    assert_redirected_to devotions_url
  end
end
