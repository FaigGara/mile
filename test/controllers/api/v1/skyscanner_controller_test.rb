require 'test_helper'

class Api::V1::SkyscannerControllerTest < ActionController::TestCase
  test "should get claim_lists" do
    get :claim_lists
    assert_response :success
  end

end
