require 'test_helper'

class TableViewControllerTest < ActionController::TestCase
  test "should get table_fiche" do
    get :table_fiche
    assert_response :success
  end

end
