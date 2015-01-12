require 'test_helper'

class TasksControllerTest < ActionController::TestCase

  test "should get new" do
    get :new, project_id: projects(:one).id
    assert_response :success
  end

end
