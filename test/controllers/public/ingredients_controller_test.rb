require "test_helper"

class Public::IngredientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_ingredients_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_ingredients_edit_url
    assert_response :success
  end

  test "should get create" do
    get public_ingredients_create_url
    assert_response :success
  end

  test "should get update" do
    get public_ingredients_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_ingredients_destroy_url
    assert_response :success
  end
end
