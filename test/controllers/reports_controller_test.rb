require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get printable_household_form" do
    get reports_printable_household_form_url
    assert_response :success
  end

end
