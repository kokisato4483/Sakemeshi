require "test_helper"

class Admin::RecipeCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get admin_recipe_comments_destroy_url
    assert_response :success
  end
end
