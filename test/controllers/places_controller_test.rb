require 'test_helper'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get index" do
    get places_index_url
    assert_response :success
  end
end
