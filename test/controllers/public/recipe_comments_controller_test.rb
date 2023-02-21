require "test_helper"

class Public::RecipeCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get indec" do
    get public_recipe_comments_indec_url
    assert_response :success
  end

  test "should get update" do
    get public_recipe_comments_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_recipe_comments_destroy_url
    assert_response :success
  end

  test "should get create" do
    get public_recipe_comments_create_url
    assert_response :success
  end
end
