require "test_helper"

class RanksControllerTest < ActionDispatch::IntegrationTest
  test "should get ranking" do
    get ranks_ranking_url
    assert_response :success
  end
end
