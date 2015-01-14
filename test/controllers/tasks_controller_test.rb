require 'test_helper'

class TasksControllerTest < ActionController::TestCase

  test "should get new" do
    get :new, project_id: projects(:one).id
    assert_response :success
  end

  test "should toggle completed" do
    get :toggle, id: tasks(:one).id
    assert_response :success
    assert_not_equal assigns(:is_completed)
  end

end
